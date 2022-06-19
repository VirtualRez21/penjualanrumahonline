// ignore_for_file: prefer_const_constructors, prefer_interpolation_to_compose_strings, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, sized_box_for_whitespace, unnecessary_string_interpolations

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:penjualanrumahonline/controller.dart';
import 'package:penjualanrumahonline/inputPost.dart';
import 'package:penjualanrumahonline/detailPage.dart';
import 'package:penjualanrumahonline/inputController.dart';
import 'package:penjualanrumahonline/main.dart';
import 'package:penjualanrumahonline/viewMyPost.dart';
import 'package:penjualanrumahonline/viewProfile.dart';

class MainPage extends StatelessWidget {
  MainPage({Key? key}) : super(key: key);

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
              onPressed: () {
                Get.to(
                  DetailPage(),
                );
                inputCtrl.idPostCtrl.text = id;
                inputCtrl.authorCtrl.text = author;
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
              },
            ),
          ),
        ],
      ),
    );
  }

  final authC = Get.find<GetxLoginController>();
  final tc = Get.find<GetxLoginController>();

  @override
  Widget build(BuildContext context) {
    // String email = tc.emailCtrl.text;
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference rumah = firestore.collection("rumah");
    final InputController inputCtrl = Get.put(InputController());
    inputCtrl.idPostCtrl.text = "";
    inputCtrl.authorCtrl.text = "";
    inputCtrl.judulPostCtrl.text = "";
    inputCtrl.hargaCtrl.text = "";
    inputCtrl.tglCtrl.text = "";
    inputCtrl.bedCtrl.text = "";
    inputCtrl.bathCtrl.text = "";
    inputCtrl.bangunanCtrl.text = "";
    inputCtrl.tanahCtrl.text = "";
    inputCtrl.alamatCtrl.text = "";
    inputCtrl.interCtrl = "";
    inputCtrl.lantaiCtrl.text = "";
    inputCtrl.sertifCtrl.text = "";
    inputCtrl.madeCtrl.text = "";
    inputCtrl.listrikCtrl.text = "";
    inputCtrl.air = "";
    inputCtrl.rekCtrl.text = "";
    inputCtrl.deskCtrl.text = "";
    inputCtrl.statusCtrl = "";
    return WillPopScope(
      onWillPop: () {
        SystemNavigator.pop();
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          title:
              Text("Beranda | Rumah Online", style: TextStyle(fontSize: 16.0)),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: <Color>[
                  Color.fromARGB(255, 168, 212, 188),
                  Colors.blue
                ],
              ),
            ),
          ),
        ),
        drawer: Drawer(
          backgroundColor: Color.fromARGB(255, 2, 159, 154),
          child: Column(
            children: <Widget>[
              Expanded(
                child: ListView(
                  children: <Widget>[
                    UserAccountsDrawerHeader(
                      currentAccountPicture: CircleAvatar(
                        backgroundImage: AssetImage('assets/me.jpg'),
                      ),
                      accountName: Text(
                        'Johnny',
                        style: TextStyle(fontSize: 20.0),
                      ),
                      accountEmail: Text("${tc.emailCtrl.text}"),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: ExactAssetImage("assets/sampul.jpg"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    ListTile(
                      leading: const Icon(Icons.person_pin),
                      title: const Text(
                        'Profile',
                        style: TextStyle(fontSize: 14.0),
                      ),
                      onTap: () => Get.to(
                        Profile(),
                      ),
                    ),
                    ListTile(
                      leading: const Icon(Icons.home_sharp),
                      title: const Text(
                        'Beranda',
                        style: TextStyle(fontSize: 14.0),
                      ),
                      onTap: () => Get.to(
                        MainPage(),
                      ),
                    ),
                    ListTile(
                      leading: const Icon(Icons.add_circle),
                      title: const Text(
                        'Add Post',
                        style: TextStyle(fontSize: 14.0),
                      ),
                      onTap: () => Get.to(
                        DataPost(),
                      ),
                    ),
                    ListTile(
                      leading: const Icon(Icons.add_circle),
                      title: const Text(
                        'My Post',
                        style: TextStyle(fontSize: 14.0),
                      ),
                      onTap: () => Get.to(
                        PostDisplay(),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: Container(
                    child: Column(
                      children: <Widget>[
                        Divider(
                          height: 1,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          child: IconButton(
                            onPressed: () {
                              authC.logout();
                              tc.emailCtrl.text = "";
                              tc.passwordCtrl.text = "";
                            },
                            icon: Icon(Icons.logout),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
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
                          stream: rumah.snapshots(),
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
      ),
    );
  }
}
