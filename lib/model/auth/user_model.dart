class UserModel {
  String? id;
  String? name;
  String? email;
  UserModel({this.id, this.email,this.name, });
  UserModel.formJson(Map<String, dynamic> json) {
    name = json["name"];
    id = json["id"];
    email = json["email"];
  }
  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "id": id,
      "email": email,
    };
  }
}
