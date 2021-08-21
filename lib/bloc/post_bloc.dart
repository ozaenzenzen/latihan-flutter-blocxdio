import 'package:bloc/bloc.dart';

import 'package:flutter_bloc_lat4/api/connect/connect_api.dart';
import 'package:flutter_bloc_lat4/api/model/post.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc() : super(PostUnitialized());

  @override
  Stream<PostState> mapEventToState(PostEvent event) async* {
    List<Post> posts;

    if (state is PostUnitialized) {
      posts = await ConnectAPI.getPost(0, 10);
      yield PostLoaded(posts: posts, hasReachedMax: false);
    } else {
      PostLoaded postLoaded = state as PostLoaded;
      posts = await ConnectAPI.getPost(postLoaded.posts!.length, 10);

      yield (posts.isEmpty)
          ? postLoaded.copyWith(hasReachedMax: true)
          : PostLoaded(posts: postLoaded.posts! + posts, hasReachedMax: false);
    }
    //  throw UnimplementedError();
  }
}
