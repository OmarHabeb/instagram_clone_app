import 'dart:developer';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagram_clone_app/core/network/local/shared_preference.dart';
import 'package:instagram_clone_app/core/repository/home.dart';
import 'package:instagram_clone_app/model/auth/user_model.dart';
import 'package:instagram_clone_app/model/home/post_model.dart';
import 'package:meta/meta.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeRepository homeRepository;
  HomeCubit(this.homeRepository) : super(HomeInitial());

  static HomeCubit get(context) => BlocProvider.of(context);
  UserModel userModel = UserModel();
  List  Posts = [];
  userId() {
    return CacheHelper.getData(key: "uId");
  }

////////////////////////////////////////
  ///get user data
  getUserImage() {
    return homeRepository.getProfileImage(userId: userId());
  }

  getUserPosts() async {
    emit(GetUserPostsLoadingState());
    // final String path = "${userId()}/posts";
    var data = await homeRepository.getPostsImages(userId: userId());
     Posts = data.docs.map((doc) {
      return PostModel.formJson(doc.data());
    }).toList();
    log(Posts.toString());
    emit(GetUserPostsSuccessState());
  }

  getUserData() {
    emit(GetUserDataLoadingState());
    homeRepository.getUserData(userId: userId()).then((value) {
      userModel = UserModel.formJson(value.data());
      emit(GetUserDataSuccessState());
    }).catchError((onError) {
      emit(GetUserDataFiledState());
    });
  }

  ////////////////////////////////
  ///set user profile
  final ImagePicker _picker = ImagePicker();
  XFile? imageProfilePath;
  File? imageProfileFile;
  Future pickUserImage() async {
    emit(PickImageLoadingState());
    imageProfilePath = await _picker.pickImage(source: ImageSource.gallery);
    imageProfileFile = File(imageProfilePath!.path);
    emit(PickImageSuccessState());
  }

  /////////////////////////////////
  ///uploade post
  XFile? imagePostPath;
  File? imagePostFile;
  Future pickUserPost() async {
    emit(PickPostLoadingState());
    imagePostPath = await _picker.pickImage(source: ImageSource.gallery);
    imagePostFile = File(imagePostPath!.path);
    emit(PickPostSuccessState());
  }

  Future uploadPost({required String caption})async {
    emit(UploadPostLoadingState());
    await homeRepository.addPost(
        userId: userId(),
        imageFile: imagePostFile!,
        caption: caption,
        createdAt: DateTime.now());
    emit(UploadPostSuccessState());
  }

////////////////////////////////////////////////////////////////////////
//// update user data
  Future updateUserData({name, email, File? image}) async {
    emit(UpdateUserDataLoading());
    UserModel userModel = UserModel(
      name: name.toString(),
      email: email.toString(),
      id: CacheHelper.getData(key: "uId"),
    );
    if (image != null)
      await homeRepository.UpdateUserProfile(
          userId: CacheHelper.getData(key: "uId"), imageFile: image);

    await FirebaseFirestore.instance
        .collection('User')
        .doc(CacheHelper.getData(key: "uId"))
        .update(userModel.toJson())
        .then((onValue) {
      emit(UpdateUserDataSuccess());
    }).catchError((onError) {
      emit(UpdateUserDataFailed());
      print(Error);
    });
  }


  ///////////////////////////////
  
XFile? realPostPath;
  File? realPostFile;
  Future pickUserreal() async {
    emit(PickPostLoadingState());
    imagePostPath = await _picker.pickMedia();
    imagePostFile = File(imagePostPath!.path);
    emit(PickPostSuccessState());
  }

  Future addreal({
    required File imageFile,
  }) async {
    final path = "$userId/real/${userId}_${DateTime.now()}";
    await Supabase.instance.client.storage
        .from('user image')
        .upload(path, imageFile);
  }
}
