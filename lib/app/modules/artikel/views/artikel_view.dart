import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/artikel_controller.dart';

class ArtikelView extends GetView<ArtikelController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Artikel'),
        backgroundColor: Colors.green.shade600,
        centerTitle: true,
        elevation: 0,
      ),
      body: Center(
        child: Text(
          'Artikel',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
