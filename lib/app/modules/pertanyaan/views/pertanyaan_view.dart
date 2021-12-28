import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tierra_app/app/controllers/auth_controller.dart';
import 'package:tierra_app/app/routes/app_pages.dart';

import '../controllers/pertanyaan_controller.dart';

class PertanyaanView extends StatefulWidget {
  const PertanyaanView({Key? key}) : super(key: key);

  @override
  _PertanyaanViewState createState() => _PertanyaanViewState();
}

class _PertanyaanViewState extends State<PertanyaanView> {
  TextEditingController _msgpertanyaan = TextEditingController();
  ImagePicker imagePicker = ImagePicker();
  XFile? PickedImage = null;
  File? imageFile, file;
  String? postImageURL;
  PertanyaanController controller = Get.put(PertanyaanController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            'Pertanyaan',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            onPressed: () => Get.back(),
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: Colors.black,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: _msgpertanyaan,
                  onChanged: (String isiChat) {
                    setState(() {});
                  },
                  maxLines: null,
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                      // labelStyle: TextStyle(),
                      focusColor: Colors.green,
                      hintText: "Tambahkan pertanyaan anda disini",
                      fillColor: Color(0xFF008269).withOpacity(0.1),
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              BorderSide(color: Color(0xFF008269), width: 1)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              BorderSide(color: Color(0xFF008269), width: 1))),
                  // )
                ),

                //Mengambil gambar

                SizedBox(height: 10),

                Center(
                    child: file != null
                        ? Galeri()
                        : Text("Tambahkan Gambar Ke postingan anda")),

                SizedBox(
                  height: 10,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                        onTap: () => PickGaleri(),
                        child: Container(
                          // margin: EdgeInsets.only(left: Get.width * 0.04),
                          width: Get.width * 0.2,
                          height: Get.width * 0.2,
                          color: Colors.red[100],

                          child: Column(children: [
                            IconButton(
                                onPressed: () => PickGaleri(),
                                icon: Icon(Icons.photo_album_rounded)),
                            Text("Galeri"),
                          ]),
                        )),
                    SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: () => PickCamera(),
                      child: Container(
                          // margin: EdgeInsets.only(left: Get.width * 0.04),
                          width: Get.width * 0.2,
                          height: Get.width * 0.2,
                          color: Colors.red[100],
                          child: Column(
                            children: [
                              IconButton(
                                  onPressed: () => PickCamera(),
                                  icon: Icon(Icons.add_a_photo)),
                              Text("Camera")
                            ],
                          )),
                    )
                  ],
                ),

                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: Container(
          height: Get.height * 0.15,
          width: Get.width * 0.15,
          child: Padding(
            padding: EdgeInsets.only(bottom: Get.height * 0.01),
            child: FloatingActionButton(
                onPressed: () {
                  if (_msgpertanyaan.text.isEmpty &&
                      _msgpertanyaan.text == ' ') {
                    print('Tambahkan Pertanyaan');
                    Get.defaultDialog(
                        title: 'Info',
                        middleText: 'Tambahkan Pertanyaan',
                        actions: [
                          TextButton(
                              onPressed: () => Get.back(), child: Text('Ok'))
                        ]);
                  } else {
                    PertanyaanController()
                        .uploadData(_msgpertanyaan.text, file);

                    Get.toNamed(Routes.BOTTOM_NAV_BAR);
                  }
                },
                child: Icon(Icons.send),
                backgroundColor: Color(0xFF008269)),
          ),
        ));
  }

  Stack Galeri() {
    return Stack(children: [
      Container(
        height: 200,
        width: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(200),
          image: DecorationImage(
            image: FileImage(File(PickedImage!.path)),
            // FileImage(File(controller.PickedImage!.path)),
            fit: BoxFit.cover,
          ),
        ),
      ),
      IconButton(
        onPressed: () => ResetImage(),
        icon: Icon(
          Icons.delete_forever_rounded,
          color: Colors.red[400],
          size: 50,
        ),
      )
    ]);
  }

  Future<void> PickGaleri() async {
    try {
      final GaleriImage =
          await imagePicker.pickImage(source: ImageSource.gallery);

      setState(() {
        if (GaleriImage != null) {
          file = File(GaleriImage.path);
          PickedImage = GaleriImage;
          print(GaleriImage.name);
          print(GaleriImage.path);
        } else {
          file = null;
          PickedImage = null;
        }
      });
    } catch (err) {
      print(err);
    }
  }

  void ResetImage() {
    setState(() {
      PickedImage = null;
      file = null;
    });
  }

  void PickCamera() async {
    try {
      final GaleriImage =
          await imagePicker.pickImage(source: ImageSource.camera);
      setState(() {
        if (GaleriImage != null) {
          file = File(GaleriImage.path);
          PickedImage = GaleriImage;
          print(GaleriImage.name);
          print(GaleriImage.path);
        } else {
          PickedImage = null;
        }
      });
    } catch (err) {
      print(err);
    }
  }
}
