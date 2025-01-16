import 'dart:developer';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagram_clone_app/core/network/local/shared_preference.dart';
import 'package:instagram_clone_app/core/repository/home.dart';
import 'package:instagram_clone_app/model/auth/user_model.dart';
import 'package:meta/meta.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeRepository homeRepository;
  HomeCubit(this.homeRepository) : super(HomeInitial());

  static HomeCubit get(context) => BlocProvider.of(context);
  UserModel userModel = UserModel();
  List<String> Posts = [];
  userId() {
    return CacheHelper.getData(key: "uId");
  }

  getUserImage() {
    return homeRepository.getProfileImage(userId: userId());
  }

  getUserPosts() {
    emit(GetUserPostsLoadingState());
    homeRepository.getPostsImages(userId: userId()).then((onValue) {
      Posts = onValue;
      emit(GetUserPostsSuccessState());
    }).catchError((onError) {
      emit(GetUserPostsFiledState());
      log(onError);
    });
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
  final ImagePicker _picker = ImagePicker();
  XFile? image;
  File? imageFile;
  Future pickUserImage() async {
    emit(PickImageLoadingState());
    image = await _picker.pickImage(source: ImageSource.gallery);
    imageFile = File(image!.path);
    emit(PickImageSuccessState());
  }
  /////////////////////////////////

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
}
