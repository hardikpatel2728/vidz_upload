// ignore_for_file: use_build_context_synchronously, camel_case_types

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vidz_upload/constants.dart';
import 'add_caption_Screen.dart';

class addVideo_screen extends StatelessWidget {
  const addVideo_screen({Key? key}) : super(key: key);

  videoPick(ImageSource src,BuildContext context) async {
    final video = await ImagePicker().pickVideo(source: src);
    if(video != null){
      Get.snackbar("Video Selected",video.path);
      Navigator.push(context, MaterialPageRoute(builder: (context) =>addCaption_screen(videoFile: File(video.path), videoPath: video.path)));
    }else{
      Get.snackbar("Error In Selecting Video", "Please Choose A Different Video File");
    }
  }

  showDialogOpt(BuildContext context){
    return showDialog(context: context, builder: (context) => SimpleDialog(
      children: [
        SimpleDialogOption(
          onPressed: () => videoPick(ImageSource.gallery,context),
          child: const Text("Gallery"),
        ),
        SimpleDialogOption(
          onPressed: () => videoPick(ImageSource.camera,context),
          child: const Text("Camera"),
        ),
        SimpleDialogOption(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text("Close"),
        )
      ],
    ),);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: () => showDialogOpt(context),
          child: Container(
            width: 190,
            height: 50,
            decoration: BoxDecoration(color: buttonColor),
            child: const Center(
                child: Text(
                  "upload Video",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                )),
          ),
        ),
      ),
    );
  }
}
