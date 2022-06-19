// ignore_for_file: file_names, prefer_const_constructors, unnecessary_string_interpolations, prefer_interpolation_to_compose_strings, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:penjualanrumahonline/controller.dart';

import 'package:penjualanrumahonline/detailMyPost.dart';
import 'package:penjualanrumahonline/inputController.dart';
import 'package:penjualanrumahonline/main.dart';

import 'package:penjualanrumahonline/testController.dart';

class PostDisplay extends StatelessWidget {
  PostDisplay({Key? key}) : super(key: key);

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
              onPressed: () {
                // inputCtrl.hargaCtrl.text = '';
                // inputCtrl.judulPostCtrl.text = '';
                // inputCtrl.tglCtrl.text = '';
                // inputCtrl.bedCtrl.text = '';
                // inputCtrl.bathCtrl.text = '';
                // inputCtrl.bangunanCtrl.text = '';
                // inputCtrl.tanahCtrl.text = '';
                // inputCtrl.alamatCtrl.text = '';
                // inputCtrl.interCtrl = '';
                // inputCtrl.lantaiCtrl.text = '';
                // inputCtrl.sertifCtrl.text = '';
                // inputCtrl.madeCtrl.text = '';
                // inputCtrl.listrikCtrl.text = '';
                // inputCtrl.air = '';
                // inputCtrl.rekCtrl.text = '';
                // inputCtrl.deskCtrl.text = '';
                // inputCtrl.statusCtrl = '';

                inputCtrl.idPostCtrl.text = id;
                inputCtrl.judulPostCtrl.text = judul;
                inputCtrl.hargaCtrl.text = harga;
                inputCtrl.tglCtrl.text = tanggalPost;
                inputCtrl.bedCtrl.text = jumlahRuangTidur;
                inputCtrl.bathCtrl.text = jumlahKamarMandi;
                inputCtrl.bangunanCtrl.text = luasBangunan;
                inputCtrl.tanahCtrl.text = luasTanah;
                inputCtrl.alamatCtrl.text = alamat;
                inputCtrl.interCtrl = interior;
                inputCtrl.lantaiCtrl.text = lantai;
                inputCtrl.sertifCtrl.text = sertifikat;
                inputCtrl.madeCtrl.text = tahunDiBuat;
                inputCtrl.listrikCtrl.text = listrik;
                inputCtrl.air = air;
                inputCtrl.rekCtrl.text = rekening;
                inputCtrl.deskCtrl.text = deskripsi;
                inputCtrl.statusCtrl = status;
                Get.to(
                  DetailPost(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  final authC = Get.find<GetxLoginController>();
  final tc = Get.find<GetxProfile>();
  final GetxInputController inputCtrl = Get.put(GetxInputController());

  @override
  Widget build(BuildContext context) {
    // String email = tc.emailCtrl.text;
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference rumah = firestore.collection("rumah");
    return Scaffold(
      appBar: AppBar(
        title: Text("My Post | Rumah Online", style: TextStyle(fontSize: 16.0)),
        flexibleSpace: Container(
          decoration: BoxDecoration(
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
          Column(
            children: [
              MyApp().gambarHeader(),
              MyApp().teksHeader("(Cari Rumah Dengan Mudah)"),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Container(
                  child: Row(
                    children: [
                      StreamBuilder<QuerySnapshot>(
                        stream: rumah
                            .where('author', isEqualTo: tc.email.text)
                            .snapshots(),
                        builder: (_, snapshot) {
                          return (snapshot.hasData)
                              ? Column(
                                  children: snapshot.data!.docs
                                      .map(
                                        (e) => kontenRumah(
                                          e.id,
                                          e.get('author'),
                                          e.get('judul'),
                                          e.get('gambar'),
                                          e.get('harga'),
                                          e.get('tanggal_post'),
                                          e.get('jml_bedroom'),
                                          e.get('jml_bathroom'),
                                          e.get('luas_bangunan'),
                                          e.get('luas_tanah'),
                                          e.get('alamat'),
                                          e.get('interior'),
                                          e.get('lantai'),
                                          e.get('sertif'),
                                          e.get('madeYear'),
                                          e.get('listrik'),
                                          e.get('air'),
                                          e.get('deskripsi'),
                                          e.get('status'),
                                          e.get('noRek'),
                                          // onUpdate: () {

                                          // },
                                          // onDelete: () {
                                          //   sepatu.doc(e.id).delete();
                                          // },
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
            ],
          )
        ],
      ),
    );
  }
}
