import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:instagram_clone_app/model/auth/user_model.dart';

class AuthWebService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
 
  Future login( {required String email, required password}) async {
      final UserCredential user = await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return user.user!.uid;
  }

  Future register({required emailOrPhoneNumber,required password ,required String name } ) async {
    final UserCredential? user = await _firebaseAuth.createUserWithEmailAndPassword(
      email: emailOrPhoneNumber,
      password: password,
    ).then( (value){
      setUser(
        id: value.user!.uid,
        name: name,
        email: emailOrPhoneNumber,
       
      );
    }).catchError((onError) {
      print(onError);
    });
    return user!.user!.uid;
  }

 Future<void> logout() async {
    await _firebaseAuth.signOut();
  }

}
  void setUser({
    required String id,
    required String name,
    required String email,
  }) {
    UserModel userModel = UserModel(
      id: id,
      name: name,
      email: email,

    );
    FirebaseFirestore.instance.collection('User').doc(id).set(userModel.toJson());
  }