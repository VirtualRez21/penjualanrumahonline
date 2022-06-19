// ignore_for_file: use_key_in_widget_cionstructors, prefer_const_constructors, avoid_unnecessary_containers

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:penjualanrumahonline/splashscreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget gambarHeader() {
    return Container(
      margin: EdgeInsets.all(10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: Image.asset(
          "assets/header.jpg",
          fit: BoxFit.fill,
          // height: 150.0,
          // width: 100.0,
        ),
      ),
    );
  }

  Widget teksHeader(String teks) {
    return Container(
      child: Text(
        teks,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          wordSpacing: 10,
          decoration: TextDecoration.overline,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Penjualan Rumah Online | Projek Akhir',
      // theme: ThemeData(
      //   primarySwatch: Colors.blue,
      // ),
      home: SplashScreen(),
    );
  }
}
