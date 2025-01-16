import 'dart:developer';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagram_clone_app/core/network/local/shared_preference.dart';
import 'package:instagram_clone_app/core/repository/auth.dart';
import 'package:meta/meta.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthRepository authRepository;
  AuthCubit(this.authRepository) : super(AuthInitial());
  static AuthCubit get(context) => BlocProvider.of(context);

  Future login({required email, required password}) async {
    emit(LoginLoadingState());
    authRepository.login(email: email, password: password).then((value) {
      CacheHelper.setData(key: "uId", value: value);
      log(value);
      print("login success");
      emit(LoginSuccessState());
    }).catchError((onError) {
      emit(LoginFailedState());
    });
  }

  Future register(
      {required email,
      required password,
      required String name,
      required File imageFile}) async {
    emit(RegisterLoadingState());
    authRepository
        .register(
            emailOrPhoneNumber: email,
            password: password,
            name: name,
            imageFile: imageFile)
        .then((value) {
      CacheHelper.setData(key: "uId", value: value);

      emit(RegisterSuccessState());
    }).catchError((onError) {
      emit(RegisterFailedState());
    });
  }

  Future logOut() async {
    emit(LogOutLoadingState());
    authRepository.logOut().then((value) {
      CacheHelper.deleteData(key: "uId");
      emit(LogOutSuccessState());
    }).catchError((onError) {
      emit(LogOutFailedState());
    });
  }

  ///////////////////////////////////////////
  final ImagePicker _picker = ImagePicker();
  XFile? image;
  File? imageFile;
  Future pickUserImage() async {
    emit(PickImageLoadingState());
    image = await _picker.pickImage(source: ImageSource.gallery);
    imageFile = File(image!.path);
    emit(PickImageSuccessState());
  }

}
