// ignore_for_file: file_names, non_constant_identifier_names, avoid_print

import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_core/firebase_core.dart' as firebase_core;
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
// import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InputController extends GetxController {
  var judulPost = "".obs;
  final idPostCtrl = TextEditingController();
  final authorCtrl = TextEditingController();
  final judulPostCtrl = TextEditingController();
  final hargaCtrl = TextEditingController();
  final tglCtrl = TextEditingController();
  final bedCtrl = TextEditingController();
  final bathCtrl = TextEditingController();
  final bangunanCtrl = TextEditingController();
  final tanahCtrl = TextEditingController();
  final alamatCtrl = TextEditingController();
  // final interCtrl = TextEditingController();
  final lantaiCtrl = TextEditingController();
  final sertifCtrl = TextEditingController();
  final madeCtrl = TextEditingController();
  final listrikCtrl = TextEditingController();
  Object air = "".obs;
  Object interCtrl = "".obs;
  Object statusCtrl = "".obs;
  final rekCtrl = TextEditingController();
  final deskCtrl = TextEditingController();
  // final statusCtrl = TextEditingController();

  void tampil() async {
    final Storage storage = Storage();
  }

  void upload(String filename) async {
    final Storage storage = Storage();
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      type: FileType.custom,
      allowedExtensions: ['png', 'jpeg', 'jpg'],
    );

    if (result == null) {
      Get.snackbar(
        "Notifikasi",
        "No File Upload",
        icon: const Icon(Icons.notifications, color: Colors.blue),
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 3),
      );
      return null;
    }
    final path = result.files.single.path!;
    // final filename = result.files.first.name;
    storage.uploadFile(path, filename).then((value) => print("Done"));

    // if (result != null) {
    //   File file = File(result.files.single.path!);
    //   String filename = result.files.first.name;
    //   print(file);
    //   try {

    //     // await storage.refFromURL('gs://pa-h-4-19.appspot.com/').child('$Filename');
    //     await firebase_storage.FirebaseStorage.instance.ref('$filename').putFile(file);
    //     print('Berhasil');
    //   }
    //     on firebase_storage.FirebaseException catch (e){
    //     print(e);
    //   }
    // } else {
    //     Get.snackbar(
    //       "Notifikasi",
    //       "No File Upload",
    //       icon: const Icon(Icons.notifications, color: Colors.blue),
    //       snackPosition: SnackPosition.BOTTOM,
    //       duration: const Duration(seconds: 3),
    //     );
    //   // User canceled the picker
    // }
  }
}

class Storage {
  final firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;
  Future<void> uploadFile(String path, String Filename) async {
    File file = File(path);

    try {
      // await storage.refFromURL('gs://pa-h-4-19.appspot.com/').child('$Filename');
      await storage.ref('rumah/$Filename').putFile(file);
    } on firebase_core.FirebaseException catch (e) {
      print(e);
    }
  }

  Future<String> downloadURL(String imageName) async {
    String downloadURL = await storage.ref('rumah/$imageName').getDownloadURL();
    return downloadURL;
  }
}
