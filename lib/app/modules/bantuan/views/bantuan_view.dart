import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tierra_app/app/utils/theme.dart';

import '../controllers/bantuan_controller.dart';
import 'package:google_fonts/google_fonts.dart';

class BantuanView extends GetView<BantuanController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bantuan'),
        centerTitle: true,
        backgroundColor: Color(0xFF008269),
      ),
      
      body:
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [ Container(
                // color: Colors.amber,
                width: Get.width * 0.7,
                height: Get.height * 0.4,
                child: Center(
                  child: Image.asset("assets/logo/intro3.png",
                      height: Get.height * 1),
                ),
              ),
                Text(
                  'Hi sobat TIERRA, Jika ada pertanyaan atau masalah yang membuat kalian tidak puas atau nyaman terhadap Tierra. Jangan ragu untuk memberi kritik, saran ataupun meminta bantuan terhadap masalah yang dihadapi pada Tierra. Kamu bisa langsung menghubungi kami di HelpTierra@gmail.com',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  
                ),
              ],
            ),
          ),
        
      );
  }
}
