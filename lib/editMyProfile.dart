// ignore_for_file: override_on_non_overriding_member, annotate_overrides, avoid_unnecessary_containers, prefer_const_constructors, file_names

// import 'dart:js_util';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:penjualanrumahonline/controller.dart';
import 'package:penjualanrumahonline/testController3.dart';
import 'package:penjualanrumahonline/testController4.dart';
import 'package:penjualanrumahonline/viewProfile.dart';

class EditProfile extends StatelessWidget {
  EditProfile({super.key});

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

  final authC = Get.find<GetxLoginController>();
  final GetxProfile2 tc = Get.put(GetxProfile2());
  final GetxProfile3 profileEdit2 = Get.put(GetxProfile3());

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference users = firestore.collection("users");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Profile | Rumah Online",
            style: TextStyle(fontSize: 16.0)),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: <Color>[Color.fromARGB(255, 168, 212, 188), Colors.blue],
            ),
          ),
        ),
      ),
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
                  TextCapitalization.words,
                  profileEdit2.namaLengkap,
                  TextInputType.name,
                  [FilteringTextInputFormatter.singleLineFormatter],
                  "Nama Lengkap",
                  "Isi Nama Lengkap",
                  Icon(Icons.person),
                  false,
                ),
                tempatInput(
                  TextCapitalization.none,
                  profileEdit2.noHP,
                  TextInputType.number,
                  [FilteringTextInputFormatter.singleLineFormatter],
                  "No. HP",
                  "Isi No. HP",
                  Icon(Icons.phone),
                  false,
                ),
                tempatInput(
                  TextCapitalization.words,
                  profileEdit2.alamatLengkap,
                  TextInputType.name,
                  [FilteringTextInputFormatter.singleLineFormatter],
                  "Alamat",
                  "Isi Alamat Lengkap",
                  Icon(Icons.home_filled),
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
                  users.doc(profileEdit2.idUser.text).update({
                    'nama': profileEdit2.namaLengkap.text,
                    'alamat': profileEdit2.alamatLengkap.text,
                    'noHp': profileEdit2.noHP.text,
                  });
                  Get.to(Profile());
                },
                child: Text(
                  "Edit Profile",
                  style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
