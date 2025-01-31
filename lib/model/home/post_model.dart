class PostModel {
  int? likesNumber;
  int? commentNumber;
  String? caption;
  String? imageUrl;

  PostModel(
      {this.likesNumber =0,
      this.commentNumber = 0 ,
      this.caption,
      this.imageUrl,
  });

  PostModel.formJson(Map<String, dynamic> json) {
   
    likesNumber = json['Likes number'];
    commentNumber = json['Comment number'];
    caption = json['Caption'];
    imageUrl = json['ImageUrl'];

  }
  Map<String, dynamic> toJson() {
    return {
      'Likes number': likesNumber,
      'Comment number': commentNumber,
      'Caption': caption,
      'ImageUrl': imageUrl,
     

    };
  }
}
