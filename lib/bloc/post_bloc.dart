import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_lat4/api/connect/connect_api.dart';
import 'package:flutter_bloc_lat4/api/model/post.dart';

class PostEvent {}

abstract class PostState {}

class PostUnitialized extends PostState {}

class PostLoaded extends PostState {
  List<Post>? posts;
  bool? hasReachedMax;

  PostLoaded({
    this.posts,
    this.hasReachedMax,
  });

  PostLoaded copyWith({List<Post>? posts, bool? hasReachedMax}) {
    return PostLoaded(
      posts: posts ?? this.posts,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }
}

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc() : super(PostUnitialized());

  @override
  Stream<PostState> mapEventToState(PostEvent event) async* {
    List<Post> posts;
    if (state is PostUnitialized) {
      posts = await ConnectAPI.getPost(0, 100);
      yield PostLoaded(posts: posts, hasReachedMax: false);
    } else {
      PostLoaded postLoaded = state as PostLoaded;
      posts = await ConnectAPI.getPost(postLoaded.posts!.length, 10);
      yield (posts.isEmpty)
          ? postLoaded.copyWith(hasReachedMax: true)
          : PostLoaded(posts: postLoaded.posts, hasReachedMax: false);
    }
     throw UnimplementedError();
  }
}
