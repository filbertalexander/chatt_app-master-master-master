import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/favorit_controller.dart';

class FavoritView extends GetView<FavoritController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorit'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Color(0xFF008269),
      ),
      body: Center(
        child: Text(
          'Favorit',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
