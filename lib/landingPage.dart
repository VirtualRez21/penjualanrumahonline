// ignore_for_file: file_names, prefer_const_literals_to_create_immutables, prefer_const_constructors, sort_child_properties_last, prefer_interpolation_to_compose_strings, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:penjualanrumahonline/controller.dart';
import 'package:penjualanrumahonline/sign_in.dart';

class LandingPage extends StatelessWidget {
  LandingPage({super.key});

  final authC = Get.put(GetxLoginController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/landing-wp.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Spacer(flex: 4),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.blue.withOpacity(0.3),
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                  child: Text(
                    "Aplikasi Penjualan\nRumah Online",
                    style: TextStyle(
                      fontSize: 40,
                      color: Colors.white,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                Container(
                  color: Colors.black.withOpacity(0.2),
                  child: Text(
                    "\"Tidak ada yang lebih menyenangkan seperti pulang ke rumah lagi.\"\n- Margaret Elizabeth Sangster",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Get.to(SignIn());
        },
        label: const Text('Get Started'),
        icon: const Icon(Icons.start),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
