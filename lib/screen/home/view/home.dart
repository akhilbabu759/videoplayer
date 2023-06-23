import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import 'package:videoplayer/core/style/styles.dart';
import 'package:videoplayer/screen/add_screen/view/add_screen.dart';
import 'package:videoplayer/screen/home/controller/home_controller..dart';

import 'widget/video_widget.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final homControl = Get.put(HomeController());
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.to(AddScreen());
          },
          child: Icon(Icons.add)),
      body: Column(
        children: [
          GetBuilder<HomeController>(
            builder: (controller) {
              return  Padding(
                      padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.045,
                        left: MediaQuery.of(context).size.width * 0.03,
                        right: MediaQuery.of(context).size.width * 0.03,
                        bottom: MediaQuery.of(context).size.height * 0.025,
                      ),
                      child: Container(
                        child: Column(children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.video_camera_back_outlined,
                                    color: AppStyle().grayCol,
                                    size: 30,
                                  ),
                                  Text(
                                    ' TapTube',
                                    style: TextStyle(
                                        color: AppStyle().tilleColor,
                                        fontSize: 23),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.search,
                                    color: AppStyle().grayCol,
                                  )
                                ],
                              )
                            ],
                          ),
                        ]),
                      ),
                    );
                  
            },
          ),
          Expanded(
              child: GestureDetector(
            onHorizontalDragDown: (details) {
              log(details.localPosition.toString());
            },
            child: GetBuilder<HomeController>(
              builder: (controller) {
                return homControl.list.length==0?Center(child: Text('Empty Data',style: TextStyle(color: AppStyle().tilleColor),),): ListView.builder(
                  controller: homControl.scrollController,
                  itemCount: homControl.list.length,
                  itemBuilder: (context, index) => ViedoWidget(
                       
                        videoPlayerController:
                            VideoPlayerController.file(homControl.list[index]),
                      ));
              },
            ),
          ))
        ],
      ),
    );
  }
}
