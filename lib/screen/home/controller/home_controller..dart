import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  ScrollController scrollController = ScrollController();
  late Timer timer;
  bool appBarVisible = true;

  @override
  void onInit() {
    scrollController.addListener(scrollListener);
    super.onInit();
  }

  void scrollListener() {
    if (scrollController.position.userScrollDirection ==
        ScrollDirection.reverse) {
      // User is scrolling down, hide the AppBar

      appBarVisible = false;
      update();
    }
    if (scrollController.position.userScrollDirection ==
        ScrollDirection.forward) {
      // User is scrolling up, show the AppBar and restart the timer

      appBarVisible = true;
      update();

      timer.cancel();
      timer = Timer(Duration(milliseconds: 1500), () {
        appBarVisible = false;
        update();
      });
    }
  }
}
