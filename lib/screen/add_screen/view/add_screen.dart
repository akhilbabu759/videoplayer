import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import 'package:videoplayer/screen/add_screen/controller/addController.dart';
import 'package:videoplayer/screen/home/view/widget/video_widget.dart';

class AddScreen extends StatelessWidget {
  const AddScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final addCont = Get.put(addController());
    log(addCont.pickedVideo.path);
    return Scaffold(
      body: Center(
        child: GetBuilder<addController>(builder: (controller) =>  Column(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //  addCont.pickedVideo.path.isEmpty?
          
          //  :CircularProgressIndicator(),
               ViedoWidget(videoPlayerController:addCont.videoPlayerController )
            ,ElevatedButton(
              onPressed: ()async {
               await addCont.pickVideoo();
              },
              child: Text('Pick Video'),
            ),
            ElevatedButton(
              onPressed: ()async {
               await addCont.videoPlayerController.play();
              },
              child: Text('Play Video'),
            )
          ]),
        ),
      ),
    );
  }
}
