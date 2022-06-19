// ignore_for_file: file_names, prefer_adjacent_string_concatenation, prefer_interpolation_to_compose_strings, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile | Rumah Online",
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
      backgroundColor: const Color.fromARGB(255, 168, 212, 188),
      body: ListView(
        children: [
          Center(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                alignment: Alignment.centerLeft,
                height: MediaQuery.of(context).size.height / 7,
                color: const Color.fromARGB(255, 248, 244, 207),
                child: Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.all(5),
                      child: Image.asset(
                        "assets/me.jpg",
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(5),
                      alignment: Alignment.center,
                      child: const Text(
                        "Johnny" + " | " + "adalah-email@gmail.com",
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Center(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                child: Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.all(5),
                      color: Colors.amber,
                      width: MediaQuery.of(context).size.width / 2.2,
                      height: MediaQuery.of(context).size.height / 4,
                      alignment: Alignment.center,
                      child: const Text(
                        "Email:" + "\n" + "adalah-email@gmail.com",
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(5),
                      color: const Color.fromARGB(255, 48, 198, 160),
                      width: MediaQuery.of(context).size.width / 2.2,
                      height: MediaQuery.of(context).size.height / 4,
                      alignment: Alignment.center,
                      child: const Text(
                        "Nama Lengkap:" + "\n" + "Johnny",
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Center(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                child: Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.all(5),
                      color: const Color.fromARGB(255, 48, 198, 160),
                      width: MediaQuery.of(context).size.width / 2.2,
                      height: MediaQuery.of(context).size.height / 4,
                      alignment: Alignment.center,
                      child: const Text(
                        "No Hp:" + "\n" + "08642345244",
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(5),
                      color: const Color.fromARGB(255, 48, 198, 160),
                      width: MediaQuery.of(context).size.width / 2.2,
                      height: MediaQuery.of(context).size.height / 4,
                      alignment: Alignment.center,
                      child: const Text(
                        "Alamat:" + "\n" + "Jl. sekian",
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10),
            child: ElevatedButton(
              style: TextButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              onPressed: () {
                Get.snackbar(
                  "Notifikasi",
                  "Fitur Belum Tersedia :(",
                  icon: const Icon(Icons.info, color: Colors.white),
                  snackPosition: SnackPosition.BOTTOM,
                );
              },
              child: const Text(
                "Edit",
                style: TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
