import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:videoplayer/core/style/styles.dart';

class ViedoWidget extends StatelessWidget {
  const ViedoWidget(
      {super.key,
      required this.videoPlayerController,
      });
  final VideoPlayerController videoPlayerController;
  // final Future<void> initializeVideoPlayerFuture;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.3,
              child: FutureBuilder(
                  future: videoPlayerController.initialize(),
                  builder: (context, snapshot) {
                    // log('addCont.pickedVideo.path');
                    if (snapshot.connectionState == ConnectionState.done) {
                      // log('addCont.pickedVideo.path');
                      return AspectRatio(
                        aspectRatio: videoPlayerController.value.aspectRatio,
                        child: VideoPlayer(videoPlayerController),
                      );
                    }
                    return Center(child: CircularProgressIndicator());
                  }),
            ),
            Positioned(right: MediaQuery.of(context).size.width*0.5,top: 100,
              child: CircleAvatar(backgroundColor: Color.fromARGB(84, 255, 255, 255),
                child: IconButton(onPressed: () {
                videoPlayerController.play();
                
              }, icon: Icon(Icons.play_arrow_outlined,color: AppStyle().grayCol,)),),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Text(
              videoPlayerController.value.caption.toString(),
              style: TextStyle(color: AppStyle().tilleColor, fontSize: 21),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Duration: ${videoPlayerController.value.duration.inMinutes}:${videoPlayerController.value.duration.inSeconds} min',
                style: TextStyle(color: AppStyle().grayCol),
              ),
              Text(
                'Size: ${videoPlayerController.value.size} mb',
                style: TextStyle(color: AppStyle().grayCol),
              )
            ],
          ),
        )
      ],
    );
  }
}
