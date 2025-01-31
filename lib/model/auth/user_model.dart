class UserModel {
  String? id;
  String? name;
  String? email;
  int? following;
  int? followers;
  int? posts;
  String? userProfileImage;
  UserModel(
      {this.id,
      this.email,
      this.name,
      this.followers = 0,
      this.following = 0,
      this.userProfileImage,
      this.posts = 0});
  UserModel.formJson(Map<String, dynamic> json) {
    name = json["name"];
    id = json["id"];
    email = json["email"];
    followers = json["followers"];
    following = json["following"];
    userProfileImage = json["User Profile Image"];
    posts = json["posts"];
  }
  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "id": id,
      "email": email,
      "followers": followers,
      "following": following,
      "User Profile Image": userProfileImage,
      "posts": posts

    };
  }
}
