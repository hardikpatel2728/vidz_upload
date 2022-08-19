import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import '../model/video.dart';

// how to fetch video from firbase storage

class Videocontroller extends GetxController{
  final Rx<List<Video>> _videoList = Rx<List<Video>>([]);
  List<Video> get videoList => _videoList.value;
  @override
  void onInit() {
    super.onInit();
     _videoList.bindStream(FirebaseFirestore.instance.collection("videos").snapshots().map((QuerySnapshot query){
       List<Video> retval = [];
       for(var element  in query.docs){
         retval.add(Video.fromSnap(element));
       }
       return retval;
    }));
  }
}