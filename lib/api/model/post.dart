class Post {
  int? id;
  String? title;
  String? body;

  Post({
    this.id,
    this.title,
    this.body,
  });

  factory Post.createPost(Map<String, dynamic> object) {
    return Post(
      id: object['id'],
      title: object['title'],
      body: object['body'],
    );
  }
}
