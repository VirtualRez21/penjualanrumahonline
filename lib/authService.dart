// import 'package:demo_futsalapp/models/user_model.dart';
// import 'package:demo_futsalapp/service/user_service.dart';
// ignore_for_file: file_names, prefer_final_fields, use_rethrow_when_possible

import 'package:firebase_auth/firebase_auth.dart';
import 'package:penjualanrumahonline/userModel.dart';
import 'package:penjualanrumahonline/userService.dart';

class AuthService {
  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<UserModel> signIn(
      {required String email, required String password}) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      UserModel user =
          await UserService().getUserById(userCredential.user!.uid);
      return user;
    } catch (e) {
      throw e;
    }
  }

  Future<UserModel> signUp({
    required String nama,
    required String email,
    required String password,
    required String noHP,
    required String alamat,
  }) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);

      UserModel user = UserModel(
          id: userCredential.user!.uid,
          nama: nama,
          email: email,
          noHP: noHP,
          alamat: alamat);

      await UserService().setUser(user);

      return user;
    } catch (e) {
      throw e;
    }
  }

  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      throw e;
    }
  }
}
