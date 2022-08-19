// ignore_for_file: camel_case_types

import 'package:cloud_firestore/cloud_firestore.dart';

class myUser {
  String name;
  String profilePhoto;
  String email;
  String uid;

  myUser({
    required this.name,
    required this.profilePhoto,
    required this.email,
    required this.uid,
  });

  //app - firebase(map)
  Map<String,dynamic> toJson() => {

    "name" : name,
    "profilePic" : profilePhoto,
    "email" : email,
    "uid" : uid,
  };

  //firebase - app(user)
  static myUser fromSnap(DocumentSnapshot snap){
    var snapshot = snap.data()as Map<String,dynamic>;
    return myUser(
      email: snapshot['email'],
      profilePhoto: snapshot["profilePic"],
      uid: snapshot['uid'],
      name: snapshot['name'],
    );
  }
}





// Positioned(
//   right: 10,
//   child: Container(
//     height: MediaQuery.of(context).size.height / 1.5,
//     margin: EdgeInsets.only(
//         top: MediaQuery.of(context).size.height / 5, right: 1),
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.center,
//       mainAxisAlignment: MainAxisAlignment.spaceAround,
//       children: [
//         ProfileButton(
//           profilePhotoUrl: data.profilePic,
//         ),
//         Column(
//           children:[
//             Icon(
//               Icons.favorite,
//               size: 35,
//               color: Colors.white,
//             ),
//             Text(
//               data.likes.length.toString(),
//               style:
//                   TextStyle(fontSize: 15, color: Colors.white),
//             ),
//           ],
//         ),
//         Column(
//           children:[
//             Icon(
//               Icons.reply,
//               size: 35,
//               color: Colors.white,
//             ),
//             Text(
//               data.shareCount.toString(),
//               style:
//                   TextStyle(fontSize: 15, color: Colors.white),
//             ),
//           ],
//         ),
//         Column(
//           children: [
//             Icon(
//               Icons.comment,
//               size: 35,
//               color: Colors.white,
//             ),
//             Text(
//              data.CommentsCount.toString(),
//               style:
//                   TextStyle(fontSize: 15, color: Colors.white),
//             ),
//           ],
//         ),
//         Column(
//           children: [AlbumRotater(profilePicUrl: data.profilePic)],
//         )
//       ],
//     ),
//   ),
// ),
/// data
// Obx(() {
// return PageView.builder(
// scrollDirection: Axis.vertical,
// controller: PageController(initialPage: 0, viewportFraction: 1),
// itemCount: videocontroller.videoList.length,
// itemBuilder: (context, index) {
// var data = videocontroller.videoList[index];
// return Stack(
// children: [
// TikTokeVideoPlayer(
// videourl: data.videoUrl,
// ),
// Container(
// margin: const EdgeInsets.only(bottom: 10, left: 15),
// child: Column(
// mainAxisAlignment: MainAxisAlignment.end,
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Text(data.username,
// style: TextStyle(
// fontWeight: FontWeight.w500, fontSize: 20),
// ),
// Text(data.caption),
// Text(
// data.songName,
// style: TextStyle(fontWeight: FontWeight.bold),
// ),
// ],
// ),
// ),
// ],
// );
// },
// );
// }),