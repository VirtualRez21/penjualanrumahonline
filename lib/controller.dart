// ignore_for_file: non_constant_identifier_names, avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:penjualanrumahonline/main_page.dart';
import 'package:penjualanrumahonline/sign_in.dart';
import 'package:penjualanrumahonline/splashscreen.dart';

class GetxProfile extends GetxController {
  final namaLengkap = TextEditingController();
  final noHP = TextEditingController();
  final alamatLengkap = TextEditingController();
}

class GetxLoginController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;

  var email = "".obs;
  var password = "".obs;

  final emailCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();

  Stream<User?> get StreamAuthStatus => auth.authStateChanges();

  void login(String email, String password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      Get.offAll(MainPage());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found' || e.code == 'unknown') {
        Get.snackbar(
          "Notifikasi",
          "Email atau Password Salah",
          icon: const Icon(Icons.notifications, color: Colors.blue),
          snackPosition: SnackPosition.TOP,
          duration: const Duration(seconds: 6),
        );
      } else if (e.code == 'wrong-password') {
        Get.snackbar(
          "Notifikasi",
          "Password Salah",
          icon: const Icon(Icons.circle_notifications, color: Colors.blue),
          snackPosition: SnackPosition.TOP,
          duration: const Duration(seconds: 6),
        );
      } else if (e.code == 'invalid-email') {
        Get.snackbar(
          "Notifikasi",
          "Email Salah",
          icon: const Icon(Icons.notification_important, color: Colors.blue),
          snackPosition: SnackPosition.TOP,
          duration: const Duration(seconds: 6),
        );
      } else {
        Get.snackbar(
          "Selamat Datang Di Rumah Online",
          "Yang paling saya sukai dari rumah saya adalah dengan siapa saya berbagi.",
          icon: const Icon(Icons.home, color: Colors.blue),
          snackPosition: SnackPosition.TOP,
          duration: const Duration(seconds: 6),
        );
      }
    }
  }

  void logout() async {
    await auth.signOut();
    Get.offAll(SplashScreen());
  }

  void sign_up(String email, String password) async {
    try {
      await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      Get.offAll(SignIn());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Get.snackbar(
          "Notifikasi",
          "Password Terlalu Pendek/Lemah",
          icon: const Icon(Icons.notification_important, color: Colors.blue),
          snackPosition: SnackPosition.TOP,
          duration: const Duration(seconds: 6),
        );
      } else if (e.code == 'email-already-in-use') {
        Get.snackbar(
          "Notifikasi",
          "Akun Sudah Terdaftar",
          icon: const Icon(Icons.notification_important, color: Colors.blue),
          snackPosition: SnackPosition.TOP,
          duration: const Duration(seconds: 6),
        );
      }
    } catch (e) {
      print(e);
    }
  }
}
