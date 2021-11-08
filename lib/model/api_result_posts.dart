class ApiResultPosts {
  List<Post>? posts;

  ApiResultPosts({this.posts});

  ApiResultPosts.fromJson(Map<String, dynamic> json) {
    if (json['posts'] != null) {
      posts = [];

      json['posts'].forEach((post) {
        posts!.add(new Post.fromJson(post));
      });
    }
  }
}

class Post {
  String? id;
  String? title;
  String? description;
  String? image;
  DateTime? date;
  String? author;
  bool? favorite;

  Post(
      {this.id,
      this.title,
      this.description,
      this.image,
      this.date,
      this.author,
      this.favorite});

  Post.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    title = json['title'];
    description = json['description'];
    image = json['image'];
    date = DateTime.parse(json['date'].toString());
    author = json['author'];
    favorite = false;

    // DateTime trydt = DateTime.parse(json['date']);
    // print('datetime: ' + trydt.toString());
  }

  void setFav(bool favStatus) {
    favorite = favStatus;
  }
}
