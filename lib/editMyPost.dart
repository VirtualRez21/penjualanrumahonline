// ignore_for_file: file_names, use_key_in_widget_constructors, unnecessary_string_interpolations, sized_box_for_whitespace, avoid_unnecessary_containers

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:penjualanrumahonline/controller.dart';
import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
import 'package:penjualanrumahonline/inputController.dart';
import 'package:penjualanrumahonline/main.dart';
import 'package:penjualanrumahonline/main_page.dart';
import 'package:penjualanrumahonline/testController.dart';

class EditPost extends StatelessWidget {
  const EditPost({super.key});

  @override
  Widget build(BuildContext context) {
    final tc = Get.find<GetxLoginController>();
    final GetxInputController inputCtrl = Get.put(GetxInputController());
    final Storage storage = Storage();
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference rumah = firestore.collection("rumah");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Post | Rumah Online",
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
          Column(
            children: [
              MyApp().gambarHeader(),
              MyApp().teksHeader("(Cari Rumah Dengan Mudah)"),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextField(
                  enabled: false,
                  controller: tc.emailCtrl,
                  decoration: const InputDecoration(
                      labelText: "AUTHOR",
                      border: OutlineInputBorder(),
                      icon: Icon(Icons.person)),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextField(
                  controller: inputCtrl.judulPostCtrl,
                  keyboardType: TextInputType.name,
                  decoration: const InputDecoration(
                      labelText: "Judul Post",
                      hintText: "Isi Judul Post",
                      border: OutlineInputBorder(),
                      icon: Icon(Icons.post_add)),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextField(
                  controller: inputCtrl.hargaCtrl,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      labelText: "Harga",
                      hintText: "Isi Harga",
                      border: OutlineInputBorder(),
                      icon: Icon(Icons.attach_money_rounded)),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextField(
                  controller: inputCtrl.tglCtrl,
                  decoration: const InputDecoration(
                      labelText: "Isi Tanggal Post",
                      hintText: "Isi Tanggal Post",
                      border: OutlineInputBorder(),
                      icon: Icon(Icons.date_range_rounded)),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextField(
                  controller: inputCtrl.bedCtrl,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      labelText: "Jumlah Ruang Tidur",
                      hintText: "Isi Jumlah Ruang Tidur",
                      border: OutlineInputBorder(),
                      icon: Icon(Icons.bedroom_parent_rounded)),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextField(
                  controller: inputCtrl.bathCtrl,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      labelText: "Jumlah Kamar Mandi",
                      hintText: "Isi Jumlah Kamar Mandi",
                      border: OutlineInputBorder(),
                      icon: Icon(Icons.bathroom_rounded)),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextField(
                  controller: inputCtrl.bangunanCtrl,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      labelText: "Luas Bangunan",
                      hintText: "Isi Luas Bangunan",
                      border: OutlineInputBorder(),
                      icon: Icon(Icons.house_rounded)),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextField(
                  controller: inputCtrl.tanahCtrl,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      labelText: "Luas Tanah",
                      hintText: "Isi Luas Tanah",
                      border: OutlineInputBorder(),
                      icon: Icon(Icons.house_rounded)),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextField(
                  controller: inputCtrl.alamatCtrl,
                  keyboardType: TextInputType.streetAddress,
                  decoration: const InputDecoration(
                      labelText: "Alamat",
                      hintText: "Isi Alamat",
                      border: OutlineInputBorder(),
                      icon: Icon(Icons.streetview_rounded)),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: inputCtrl.lantaiCtrl,
                  decoration: const InputDecoration(
                      labelText: "Lantai",
                      hintText: "Isi Lantai",
                      border: OutlineInputBorder(),
                      icon: Icon(Icons.house_rounded)),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextField(
                  controller: inputCtrl.sertifCtrl,
                  decoration: const InputDecoration(
                      labelText: "Sertifikat",
                      hintText: "Isi Sertifikat",
                      border: OutlineInputBorder(),
                      icon: Icon(Icons.house_rounded)),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: inputCtrl.madeCtrl,
                  decoration: const InputDecoration(
                      labelText: "Tahun Dibuat",
                      hintText: "Isi Tahun Dibuat",
                      border: OutlineInputBorder(),
                      icon: Icon(Icons.date_range_rounded)),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: inputCtrl.listrikCtrl,
                  decoration: const InputDecoration(
                    labelText: "Listrik (watt)",
                    hintText: "Isi Listrik (watt)",
                    border: OutlineInputBorder(),
                    icon: Icon(Icons.electric_bolt_rounded),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: inputCtrl.rekCtrl,
                  decoration: const InputDecoration(
                      labelText: "Rekening",
                      hintText: "Isi No Rekening",
                      border: OutlineInputBorder(),
                      icon: Icon(Icons.attach_money_rounded)),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextField(
                  maxLines: 5,
                  controller: inputCtrl.deskCtrl,
                  decoration: const InputDecoration(
                      labelText: "Deskripsi",
                      hintText: "Isi Deskripsi",
                      border: OutlineInputBorder(),
                      icon: Icon(Icons.description_rounded)),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: Column(
                  children: [
                    const Text(
                      'Air',
                      style: TextStyle(
                        fontSize: 15,
                        letterSpacing: 5,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    CustomRadioButton(
                      elevation: 0,
                      wrapAlignment: WrapAlignment.spaceAround,
                      unSelectedColor: Theme.of(context).canvasColor,
                      buttonLables: const [
                        'Iya',
                        'Tidak',
                      ],
                      buttonValues: const [
                        "Iya",
                        "Tidak",
                      ],
                      buttonTextStyle: const ButtonTextStyle(
                        selectedColor: Colors.white,
                        unSelectedColor: Colors.black,
                        // textStyle: Theme.of(context).textTheme.bodyText1,
                      ),
                      radioButtonValue: (value) {
                        inputCtrl.air = value!;
                      },
                      selectedColor: Theme.of(context).colorScheme.secondary,
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: Column(
                  children: [
                    const Text(
                      'Interior',
                      style: TextStyle(
                        fontSize: 15,
                        letterSpacing: 5,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    CustomRadioButton(
                      width: 140,
                      elevation: 0,
                      wrapAlignment: WrapAlignment.spaceAround,
                      unSelectedColor: Theme.of(context).canvasColor,
                      buttonLables: const [
                        'Berperabot',
                        'Tidak Berperabot',
                      ],
                      buttonValues: const [
                        "Berperabot",
                        "Tidak Berperabot",
                      ],
                      buttonTextStyle: const ButtonTextStyle(
                        selectedColor: Colors.white,
                        unSelectedColor: Colors.black,
                        // textStyle: Theme.of(context).textTheme.bodyText1,
                      ),
                      radioButtonValue: (value) {
                        inputCtrl.interCtrl = value!;
                      },
                      selectedColor: Theme.of(context).colorScheme.secondary,
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: Column(
                  children: [
                    const Text(
                      'Status',
                      style: TextStyle(
                        fontSize: 15,
                        letterSpacing: 5,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    CustomRadioButton(
                      elevation: 0,
                      width: 140,
                      wrapAlignment: WrapAlignment.spaceAround,
                      unSelectedColor: Theme.of(context).canvasColor,
                      buttonLables: const [
                        'Belum Dibeli',
                        'Sudah Dibeli',
                      ],
                      buttonValues: const [
                        "Belum Dibeli",
                        "Sudah Dibeli",
                      ],
                      buttonTextStyle: const ButtonTextStyle(
                        selectedColor: Colors.white,
                        unSelectedColor: Colors.black,
                        // textStyle: Theme.of(context).textTheme.bodyText1,
                      ),
                      radioButtonValue: (value) {
                        inputCtrl.statusCtrl = value!;
                      },
                      selectedColor: Theme.of(context).colorScheme.secondary,
                    ),
                  ],
                ),
              ),
              FutureBuilder(
                future: storage.downloadURL('${tc.emailCtrl.text}'),
                builder:
                    (BuildContext context, AsyncSnapshot<String> snapshot) {
                  if (snapshot.connectionState == ConnectionState.done &&
                      snapshot.hasData) {
                    return Container(
                      width: 300,
                      height: 250,
                      child: Image.network(
                        snapshot.data!,
                        fit: BoxFit.cover,
                      ),
                    );
                  }
                  if (snapshot.connectionState == ConnectionState.waiting ||
                      !snapshot.hasData) {
                    return const CircularProgressIndicator();
                  }
                  return Container();
                },
              ),
              Container(
                child: Container(
                  width: 120,
                  height: 35,
                  margin: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                  child: ElevatedButton(
                    style: TextButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                    onPressed: () {
                      rumah.doc(inputCtrl.idPostCtrl.text).update(
                        {
                          'author': tc.emailCtrl.text,
                          'gambar': tc.emailCtrl.text,
                          'judul': inputCtrl.judulPostCtrl.text,
                          'harga': inputCtrl.hargaCtrl.text,
                          'tanggal_post': inputCtrl.tglCtrl.text,
                          'jml_bedroom': inputCtrl.bedCtrl.text,
                          'jml_bathroom': inputCtrl.bathCtrl.text,
                          'luas_bangunan': inputCtrl.bangunanCtrl.text,
                          'luas_tanah': inputCtrl.tanahCtrl.text,
                          'alamat': inputCtrl.alamatCtrl.text,
                          'interior': inputCtrl.interCtrl,
                          'lantai': inputCtrl.lantaiCtrl.text,
                          'sertif': inputCtrl.sertifCtrl.text,
                          'madeYear': inputCtrl.madeCtrl.text,
                          'listrik': inputCtrl.listrikCtrl.text,
                          'air': inputCtrl.air,
                          'noRek': inputCtrl.rekCtrl.text,
                          'status': inputCtrl.statusCtrl,
                          'deskripsi': inputCtrl.deskCtrl.text
                        },
                      );

                      inputCtrl.hargaCtrl.text = '';
                      inputCtrl.judulPostCtrl.text = '';
                      inputCtrl.tglCtrl.text = '';
                      inputCtrl.bedCtrl.text = '';
                      inputCtrl.bathCtrl.text = '';
                      inputCtrl.bangunanCtrl.text = '';
                      inputCtrl.tanahCtrl.text = '';
                      inputCtrl.alamatCtrl.text = '';
                      inputCtrl.interCtrl = '';
                      inputCtrl.lantaiCtrl.text = '';
                      inputCtrl.sertifCtrl.text = '';
                      inputCtrl.madeCtrl.text = '';
                      inputCtrl.listrikCtrl.text = '';
                      inputCtrl.air = '';
                      inputCtrl.rekCtrl.text = '';
                      inputCtrl.deskCtrl.text = '';
                      inputCtrl.statusCtrl = '';

                      Get.to(MainPage());
                      // file.uploadFile();
                      // authC.login(loginController.emailCtrl.text,
                      //     loginController.passwordCtrl.text);
                      // loginController.emailCtrl.text = "";
                      // loginController.passwordCtrl.text = "";
                    },
                    child: const Text(
                      "Edit",
                      style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                    ),
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
