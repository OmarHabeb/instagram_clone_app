import 'dart:io';

import 'package:instagram_clone_app/core/web_services/home.dart';

class HomeRepository {
  HomeWebService homeWebService;
  HomeRepository(this.homeWebService);

  getProfileImage({required String userId}) {
    return homeWebService.getUserProfileImage(userId: userId);
  }

  getUserData({required String userId}) {
    return homeWebService.getUserData(userId: userId);
  }

  Future UpdateUserProfile({
    required String userId,
    required File imageFile,
  }) async {
    return await homeWebService.updateUserProfilepic(
        userId: userId, imageFile: imageFile);
  }

  getPostsImages({required String userId}) {
    return homeWebService.getUserPostsImages(userId: userId);
  }

  addPost(
      {required String userId,
      required String name,
      required File imageFile,
      required String description}) async {
    return homeWebService.addPost(
        imageFile: imageFile,
        userId: userId,
        name: name,
        description: description);
  }
}
