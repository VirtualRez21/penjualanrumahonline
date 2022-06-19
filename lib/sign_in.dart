// ignore_for_file: override_on_non_overriding_member, annotate_overrides, avoid_unnecessary_containers, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:penjualanrumahonline/controller.dart';
import 'package:penjualanrumahonline/sign_up.dart';

class SignIn extends StatelessWidget {
  SignIn({super.key});

  @override
  Widget tempatInput(
      TextCapitalization kapital,
      final ctrl,
      TextInputType type,
      List<TextInputFormatter> format,
      String label,
      String hint,
      Widget ikon,
      bool aktif) {
    return Container(
      margin: const EdgeInsets.only(top: 10.0, bottom: 10.0),
      child: TextFormField(
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

  final GetxLoginController loginController = Get.put(GetxLoginController());
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
                  loginController.emailCtrl,
                  TextInputType.name,
                  [FilteringTextInputFormatter.singleLineFormatter],
                  "Email",
                  "Isi Email",
                  Icon(Icons.person),
                  false,
                ),
                tempatInput(
                  TextCapitalization.none,
                  loginController.passwordCtrl,
                  TextInputType.name,
                  [FilteringTextInputFormatter.singleLineFormatter],
                  "Password",
                  "Isi Password",
                  Icon(Icons.lock),
                  false,
                ),
              ],
            ),
          ),
          Container(
            child: Container(
              width: 120,
              height: 35,
              margin: const EdgeInsets.all(10),
              child: ElevatedButton(
                style: TextButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 255, 255, 255),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                onPressed: () {
                  authC.login(loginController.emailCtrl.text,
                      loginController.passwordCtrl.text);
                      loginController.emailCtrl.text = '';
                      loginController.passwordCtrl.text = '';
                },
                child: Text(
                  "Login",
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
              Text("Belum Punya Akun ?"),
              TextButton(
                onPressed: (() => Get.to(SignUp())),
                child: Text(
                  "DAFTAR SEKARANG",
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
