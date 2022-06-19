// ignore_for_file: file_names, prefer_adjacent_string_concatenation, prefer_interpolation_to_compose_strings, avoid_unnecessary_containers, unused_local_variable, prefer_const_constructors, unnecessary_string_interpolations

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:penjualanrumahonline/controller.dart';
import 'package:penjualanrumahonline/editMyProfile.dart';
import 'package:penjualanrumahonline/inputController.dart';
import 'package:penjualanrumahonline/testController3.dart';
import 'package:penjualanrumahonline/testController4.dart';

class Profile extends StatelessWidget {
  Profile({super.key});

  Widget kontenRumah(
    String id,
    String author,
    String judul,
    String foto,
    String harga,
    String tanggalPost,
    String jumlahRuangTidur,
    String jumlahKamarMandi,
    String luasBangunan,
    String luasTanah,
    String alamat,
    String interior,
    String lantai,
    String sertifikat,
    String tahunDiBuat,
    String listrik,
    String air,
    String deskripsi,
    String status,
    String rekening,
  ) {
    final Storage storage = Storage();
    final InputController inputCtrl = Get.put(InputController());

    return Container(
      margin: EdgeInsets.all(8),
      width: 180,
      height: 180,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          FutureBuilder(
            future: storage.downloadURL('$foto'),
            builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
              if (snapshot.connectionState == ConnectionState.done &&
                  snapshot.hasData) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.network(
                    snapshot.data!,
                    fit: BoxFit.cover,
                  ),
                );
              }
              if (snapshot.connectionState == ConnectionState.waiting ||
                  !snapshot.hasData) {
                return CircularProgressIndicator();
              }
              return Container();
            },
          ),
          Container(
            padding: EdgeInsets.all(5),
            child: ElevatedButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.black.withOpacity(0.5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
              child: Text(
                "Rp." + harga,
                textAlign: TextAlign.center,
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }

  final GetxProfile tc = Get.put(GetxProfile());
  final logout = Get.find<GetxLoginController>();
  final GetxProfile2 profileEdit = Get.put(GetxProfile2());
  final GetxProfile3 profileEdit2 = Get.put(GetxProfile3());

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference users = firestore.collection("users");
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
                child: Row(
                  children: [
                    StreamBuilder<QuerySnapshot>(
                      stream: users
                          .where('email', isEqualTo: tc.email.text)
                          .snapshots(),
                      builder: (_, snapshot) {
                        return (snapshot.hasData)
                            ? Column(
                                children: snapshot.data!.docs
                                    .map(
                                      (e) => Container(
                                        child: Container(
                                          child: Column(
                                            children: [
                                              SingleChildScrollView(
                                                scrollDirection:
                                                    Axis.horizontal,
                                                child: Column(
                                                  children: [
                                                    Container(
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height /
                                                              7,
                                                      color:
                                                          const Color.fromARGB(
                                                              255,
                                                              248,
                                                              244,
                                                              207),
                                                      child: Row(
                                                        children: [
                                                          Container(
                                                            margin:
                                                                const EdgeInsets
                                                                    .all(5),
                                                            child: Image.asset(
                                                              "assets/me.jpg",
                                                            ),
                                                          ),
                                                          Container(
                                                            margin:
                                                                const EdgeInsets
                                                                    .all(5),
                                                            alignment: Alignment
                                                                .center,
                                                            child: Text(
                                                              e.get('nama') +
                                                                  " | " +
                                                                  e.get(
                                                                      'email'),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                      // Center(
                                                    ),
                                                    SingleChildScrollView(
                                                      scrollDirection:
                                                          Axis.horizontal,
                                                      child: Container(
                                                        child: Row(
                                                          children: [
                                                            Container(
                                                              margin:
                                                                  const EdgeInsets
                                                                      .all(5),
                                                              color:
                                                                  Colors.amber,
                                                              width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width /
                                                                  2.2,
                                                              height: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .height /
                                                                  4,
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              child: Text(
                                                                "Email:" +
                                                                    "\n" +
                                                                    e.get(
                                                                        "email"),
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                              ),
                                                            ),
                                                            Container(
                                                              margin:
                                                                  const EdgeInsets
                                                                      .all(5),
                                                              color: const Color
                                                                      .fromARGB(
                                                                  255,
                                                                  48,
                                                                  198,
                                                                  160),
                                                              width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width /
                                                                  2.2,
                                                              height: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .height /
                                                                  4,
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              child: Text(
                                                                "Nama Lengkap:" +
                                                                    "\n" +
                                                                    e.get(
                                                                        "nama"),
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    SingleChildScrollView(
                                                      scrollDirection:
                                                          Axis.horizontal,
                                                      child: Container(
                                                        child: Row(
                                                          children: [
                                                            Container(
                                                              margin:
                                                                  const EdgeInsets
                                                                      .all(5),
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      48,
                                                                      198,
                                                                      160),
                                                              width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width /
                                                                  2.2,
                                                              height: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .height /
                                                                  4,
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              child: Text(
                                                                "No Hp:" +
                                                                    "\n" +
                                                                    e.get(
                                                                        "noHp"),
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                              ),
                                                            ),
                                                            Container(
                                                              margin:
                                                                  const EdgeInsets
                                                                      .all(5),
                                                              color: const Color
                                                                      .fromARGB(
                                                                  255,
                                                                  48,
                                                                  198,
                                                                  160),
                                                              width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width /
                                                                  2.2,
                                                              height: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .height /
                                                                  4,
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              child: Text(
                                                                "Alamat:" +
                                                                    "\n" +
                                                                    e.get(
                                                                        "alamat"),
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                margin:
                                                    const EdgeInsets.all(10),
                                                child: ElevatedButton(
                                                  style: TextButton.styleFrom(
                                                    backgroundColor:
                                                        const Color.fromARGB(
                                                            255, 255, 255, 255),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              50),
                                                    ),
                                                  ),
                                                  onPressed: () {
                                                    Get.to(EditProfile());
                                                    profileEdit2.idUser.text =
                                                        e.id;
                                                    profileEdit2.alamatLengkap
                                                        .text = e.get("alamat");
                                                    profileEdit2.noHP.text =
                                                        e.get("noHp");
                                                    profileEdit2.namaLengkap
                                                        .text = e.get("nama");
                                                  },
                                                  child: const Text(
                                                    "Edit",
                                                    style: TextStyle(
                                                      color: Color.fromARGB(
                                                          255, 0, 0, 0),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    )
                                    .toList(),
                              )
                            : Center(
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    Color.fromARGB(255, 0, 255, 149),
                                  ),
                                ),
                              );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
