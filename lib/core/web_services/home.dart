import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:instagram_clone_app/model/home/post_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HomeWebService {
  getUserProfileImage({required String userId}) {
    final String path = "$userId/profile/$userId";
    return Supabase.instance.client.storage
        .from('user image')
        .getPublicUrl(path);
  }

  getUserData({required String userId}) {
    return FirebaseFirestore.instance.collection('User').doc(userId).get();
  }

  Future updateUserProfilepic(
      {required File imageFile, required String userId}) async {
    final path = "$userId/profile/$userId";
    await Supabase.instance.client.storage
        .from('user image')
        .update(path, imageFile);
  }

  Future addPost({
    required File imageFile,
    required String userId,
    required String caption,
    required DateTime? createdAt,
  }) async {
    final path = "$userId/posts/${userId}_${DateTime.now()}";
    await Supabase.instance.client.storage
        .from('user image')
        .upload(path, imageFile);
    final icUrl =
        Supabase.instance.client.storage.from('user image').getPublicUrl(path);
    setPost(
        caption: caption, id: userId, imageUrl: icUrl, createdAt: createdAt);
  }

  getUserPosts({required String userId}) {
    return FirebaseFirestore.instance
        .collection('User')
        .doc(userId)
        .collection("post")
        .get();
  }
}

//add post to database
////////////////////////////////////
void setPost(
    {String? caption, String? imageUrl, DateTime? createdAt, String? id}) {
  PostModel postModel = PostModel(caption: caption, imageUrl: imageUrl);
  FirebaseFirestore.instance
      .collection('User')
      .doc(id)
      .collection("post")
      .doc("${id}${DateTime.now()}")
      .set(postModel.toJson());
  FirebaseFirestore.instance.collection('User').doc(id).update({
    "posts": FieldValue.increment(1),
  });
}
