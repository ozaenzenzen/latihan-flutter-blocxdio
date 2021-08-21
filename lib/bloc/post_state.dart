part of 'post_bloc.dart';

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