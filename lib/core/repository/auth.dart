import 'dart:io';

import 'package:instagram_clone_app/core/web_services/auth.dart';

class AuthRepository {
 final AuthWebService _authWebService;
 AuthRepository(this._authWebService);

 Future login ({required String email, required String password }) async {
   return await _authWebService.login(email: email, password: password);
 }
 Future register({required emailOrPhoneNumber, required password, required String name ,required File imageFile}) async {
   return await _authWebService.register(emailOrPhoneNumber: emailOrPhoneNumber, password: password, name: name, imageFile: imageFile);
 }
 Future<void> logOut() async {
   return await _authWebService.logout();
 }
 
}