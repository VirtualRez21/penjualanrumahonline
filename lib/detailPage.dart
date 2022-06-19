// ignore_for_file: file_names, must_be_immutable, prefer_const_constructors, duplicate_ignore, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, avoid_unnecessary_containers, prefer_interpolation_to_compose_strings, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:penjualanrumahonline/inputController.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Storage storage = Storage();
    final InputController inputCtrl = Get.put(InputController());
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
    return Scaffold(
      appBar: AppBar(
        // ignore: prefer_const_constructors
        title: Text("Detail Page | Rumah Online",
            style: TextStyle(fontSize: 16.0)),
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
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            FutureBuilder(
              future: storage.downloadURL(inputCtrl.authorCtrl.text),
              builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                if (snapshot.connectionState == ConnectionState.done &&
                    snapshot.hasData) {
                  return Expanded(
                    child: Container(
                      child: Image.network(
                        snapshot.data!,
                        fit: BoxFit.fill,
                      ),
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
            Expanded(
              child: Container(
                child: ListView(
                  children: [
                    Container(
                      margin: EdgeInsets.all(5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            inputCtrl.authorCtrl.text +
                                " - " +
                                inputCtrl.tglCtrl.text,
                            style: TextStyle(fontSize: 14),
                            textAlign: TextAlign.justify,
                          ),
                          Text(
                            inputCtrl.idPostCtrl.text,
                            style: TextStyle(fontSize: 14),
                            textAlign: TextAlign.justify,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            inputCtrl.judulPostCtrl.text,
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            inputCtrl.alamatCtrl.text,
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.justify,
                          ),
                          Text(
                            "Rp." + inputCtrl.hargaCtrl.text,
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          SingleChildScrollView(
                            child: Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(right: 10),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(Icons.bed),
                                      Text(inputCtrl.bedCtrl.text),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 10, right: 10),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(Icons.bathtub),
                                      Text(inputCtrl.bathCtrl.text),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 10, right: 10),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(Icons.landscape),
                                      Text(inputCtrl.tanahCtrl.text + "m²"),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 10, right: 10),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(Icons.home),
                                      Text(inputCtrl.bangunanCtrl.text + "m²"),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Interior",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "${inputCtrl.interCtrl}",
                            style: TextStyle(fontSize: 16),
                            textAlign: TextAlign.justify,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Lantai",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            inputCtrl.lantaiCtrl.text,
                            style: TextStyle(fontSize: 16),
                            textAlign: TextAlign.justify,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Sertifikat",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            inputCtrl.sertifCtrl.text,
                            style: TextStyle(fontSize: 16),
                            textAlign: TextAlign.justify,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Tahun Dibuat",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            inputCtrl.madeCtrl.text,
                            style: TextStyle(fontSize: 16),
                            textAlign: TextAlign.justify,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Listrik",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            inputCtrl.listrikCtrl.text,
                            style: TextStyle(fontSize: 16),
                            textAlign: TextAlign.justify,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Air",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "${inputCtrl.air}",
                            style: TextStyle(fontSize: 16),
                            textAlign: TextAlign.justify,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Status",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "${inputCtrl.statusCtrl}",
                            style: TextStyle(fontSize: 16),
                            textAlign: TextAlign.justify,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Rekening",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            inputCtrl.rekCtrl.text,
                            style: TextStyle(fontSize: 16),
                            textAlign: TextAlign.justify,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Deskripsi",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            inputCtrl.deskCtrl.text,
                            style: TextStyle(fontSize: 16),
                            textAlign: TextAlign.justify,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Material(
        child: Container(
          margin: EdgeInsets.all(15.0),
          height: 40,
          child: ElevatedButton(
              child: Text(
                'Beli Rumah',
                style: TextStyle(fontSize: 20.0),
              ),
              onPressed: () {
                Get.snackbar(
                  "Notifikasi",
                  "Fitur Belum Tersedia :(",
                  icon: Icon(Icons.info, color: Colors.white),
                  snackPosition: SnackPosition.BOTTOM,
                );
              }),
        ),
        color: Colors.transparent,
      ),
    );
  }
}
