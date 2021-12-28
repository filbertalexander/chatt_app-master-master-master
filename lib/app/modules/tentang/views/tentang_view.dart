import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/tentang_controller.dart';

class TentangView extends GetView<TentangController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tentang'),
        centerTitle: true,
        backgroundColor: Color(0xFF008269),
      ),
      body:
         Padding(
           padding: const EdgeInsets.all(10.0),
           child: Column(
             children: [ 
               Padding(
                 padding: const EdgeInsets.only(top: 10),
                 child: Text(
                  'Tierra merupakan sebuah aplikasi berbasis android yang bergerak di bidang tanaman hias. Tierra memungkinan para pengguna untuk berinteraksi satu dengan yang lain, sehingga diharapkan dapat menyelesaikan berbagai masalah yang muncul seputar tanaman hias. Untuk lebih lanjut silahkan ke                 www.vct-tierra.com',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
               ),
        Container(
                // color: Colors.amber,
                width: Get.width * 0.7,
                height: Get.height * 0.4,
                child: Center(
                  child: Image.asset("assets/logo/ss.png",
                      height: Get.height * 1),
                ),
              ),
             ],
           ),
         ),
    );
  }
}
