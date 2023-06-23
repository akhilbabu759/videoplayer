import 'dart:developer';
import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:video_player/video_player.dart';

class addController extends GetxController{
  
late VideoPlayerController videoPlayerController=VideoPlayerController.file(File(''));
 Future<void> initializeVideoPlayerFuture=Future(() => null);

   File pickedVideo=File('');

Future<void> pickVideo() async {
  final pickedFile = await ImagePicker().pickVideo(source: ImageSource.gallery);
  if (pickedFile != null) {
    final appDir = await getApplicationDocumentsDirectory();
    final fileName = DateTime.now().millisecondsSinceEpoch.toString();
    final videoFile = await File(pickedFile.path).copy('${appDir.path}/$fileName.mp4');
  
      pickedVideo = videoFile;
      update();
      
    
  }
}
Future<void> pickVideoo() async {
  final pickedFile = await ImagePicker().pickVideo(source: ImageSource.gallery);
  //  log(pickedFile!.length().then((value) => log(value.toString())).toString());
  if (pickedFile != null) {
    final appDir = await getApplicationDocumentsDirectory();
    final fileName = DateTime.now().millisecondsSinceEpoch.toString();
    final videoFile = await File(pickedFile.path).copy('${appDir.path}/$fileName.mp4');
    log(videoFile.toString());
    
      pickedVideo = videoFile;
      update();
      videoPlayerController = VideoPlayerController.file(pickedVideo);
      update();
      initializeVideoPlayerFuture = videoPlayerController.initialize();
      update();
   
  }
}


}