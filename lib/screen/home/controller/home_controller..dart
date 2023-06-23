import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';

class HomeController extends GetxController {
  ScrollController scrollController = ScrollController();
  late Timer timer;
  // bool appBarVisible = true;
  List<File> list=[];

  @override
  void onInit() {
    // scrollController.addListener(scrollListener);
    getSavedVideos();
    super.onInit();
  }

  // void scrollListener() {
  //   if (scrollController.position.userScrollDirection ==
  //       ScrollDirection.reverse) {
  //     // User is scrolling down, hide the AppBar

  //     appBarVisible = false;
  //     update();
  //   }
  //   if (scrollController.position.userScrollDirection ==
  //       ScrollDirection.forward) {
  //     // User is scrolling up, show the AppBar and restart the timer

  //     appBarVisible = true;
  //     update();

  //     timer.cancel();
  //     timer = Timer(Duration(milliseconds: 1500), () {
  //       appBarVisible = false;
  //       update();
  //     });
  //   }
  // }

  Future<void> getSavedVideos() async {
  final appDir = await getApplicationDocumentsDirectory();
  final files = appDir.listSync().whereType<File>().toList();
  list=files;
  
}
}
