import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
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
    {required File imageFile,
    required String userId})async {

  final path = "$userId/profile/$userId";
  await Supabase.instance.client.storage.from('user image').update(path, imageFile);
  
}
Future addPost(
    {required File  imageFile,
    required String userId , required String name , required String description}) async {

  final path = "$userId/posts/$name";
  await Supabase.instance.client.storage.from('user image').upload(path, imageFile);
  
}


 getUserPostsImages({required String userId}) {
    final String path = "$userId/posts";
    return Supabase.instance.client.storage
        .from('user image')
        .list(path: path);
  }
}
