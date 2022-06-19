// ignore_for_file: override_on_non_overriding_member, annotate_overrides, avoid_unnecessary_containers, prefer_const_constructors

// import 'dart:js_util';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:penjualanrumahonline/controller.dart';

class SignUp extends StatelessWidget {
  SignUp({super.key});

  @override
  Widget tempatInput(
      TextCapitalization kapital,
      final ctrl,
      TextInputType type,
      List<TextInputFormatter> format,
      String label,
      String hint,
      Widget ikon,
      bool aktif,
      bool pass) {
    return Container(
      margin: const EdgeInsets.only(top: 10.0, bottom: 10.0),
      child: TextFormField(
        obscureText: pass,
        readOnly: aktif,
        textCapitalization: kapital,
        controller: ctrl,
        keyboardType: type,
        inputFormatters: format,
        decoration:
            InputDecoration(labelText: label, hintText: hint, icon: ikon),
      ),
    );
  }

  final GetxLoginController daftarController = Get.put(GetxLoginController());
  final GetxProfile profileController = Get.put(GetxProfile());
  final authC = Get.find<GetxLoginController>();

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 168, 212, 188),
      body: ListView(
        children: [
          Container(
            alignment: Alignment.center,
            child: Text("Penjualan Rumah Online"),
          ),
          Container(
            child: Column(
              children: [
                tempatInput(
                  TextCapitalization.none,
                  daftarController.emailCtrl,
                  TextInputType.name,
                  [FilteringTextInputFormatter.singleLineFormatter],
                  "Email",
                  "Isi Email",
                  Icon(Icons.person),
                  false,
                  false,
                ),
                tempatInput(
                  TextCapitalization.none,
                  daftarController.passwordCtrl,
                  TextInputType.name,
                  [FilteringTextInputFormatter.singleLineFormatter],
                  "Password",
                  "Isi Password",
                  Icon(Icons.lock),
                  false,
                  true,
                ),
                tempatInput(
                  TextCapitalization.words,
                  profileController.namaLengkap,
                  TextInputType.name,
                  [FilteringTextInputFormatter.singleLineFormatter],
                  "Nama Lengkap",
                  "Isi Nama Lengkap",
                  Icon(Icons.person),
                  false,
                  false,
                ),
                tempatInput(
                  TextCapitalization.none,
                  profileController.noHP,
                  TextInputType.number,
                  [FilteringTextInputFormatter.singleLineFormatter],
                  "No. HP",
                  "Isi No. HP",
                  Icon(Icons.phone),
                  false,
                  false,
                ),
                tempatInput(
                  TextCapitalization.words,
                  profileController.alamatLengkap,
                  TextInputType.name,
                  [FilteringTextInputFormatter.singleLineFormatter],
                  "Alamat",
                  "Isi Alamat Lengkap",
                  Icon(Icons.home_filled),
                  false,
                  false,
                ),
              ],
            ),
          ),
          Container(
            child: Container(
              margin: const EdgeInsets.all(10),
              child: ElevatedButton(
                style: TextButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 255, 255, 255),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                onPressed: () {
                  authC.sign_up(profileController.namaLengkap.text, profileController.noHP.text, profileController.alamatLengkap.text, daftarController.emailCtrl.text, daftarController.passwordCtrl.text);
                  // authC.sign_up(daftarController.emailCtrl.text,
                  //     daftarController.passwordCtrl.text);
                  daftarController.emailCtrl.text = '';
                  daftarController.passwordCtrl.text = '';
                },
                child: Text(
                  "Daftar",
                  style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 18.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Sudah Punya Akun ?"),
              TextButton(
                onPressed: (() => Get.back()),
                child: Text(
                  "LOGIN",
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
