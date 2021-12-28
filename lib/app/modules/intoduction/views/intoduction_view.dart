import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:tierra_app/app/routes/app_pages.dart';

import '../controllers/intoduction_controller.dart';

class IntoductionView extends GetView<IntoductionController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.red[800],
        body: IntroductionScreen(
          pages: [
            PageViewModel(
              title: 'Welcome to TIERRA',
              body: "Temukan teman tanaman kalian dengan mudah",
              image: Container(
                width: Get.width * 0.75,
                height: Get.height * 0.75,
                child: Center(
                  child: Image.asset("assets/logo/intro1.png",
                      height: Get.height * 1),
                ),
              ),
            ),
            PageViewModel(
              title: "Share your plants activity",
              body: "Tanyakan permasalahan tanamanmu pada komunitas",
              image: Container(
                width: Get.width * 0.7,
                height: Get.height * 0.7,
                child: Center(
                  child: Image.asset("assets/logo/intro2.png",
                      height: Get.height * 1),
                ),
              ),
            ),
          ],
          onDone: () => Get.offAllNamed(Routes.LOGIN),
          onSkip: () => Get.offAllNamed(Routes.LOGIN),
          // When done button is press

          showSkipButton: true,
          skip: Text(
            "Skip",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          next: Text(
            "Next",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          done:
              const Text("Done", style: TextStyle(fontWeight: FontWeight.w600)),
        ));
  }
}
