import 'package:flutter/material.dart';
import 'package:vidz_upload/view/screen/add_video.dart';
import 'package:vidz_upload/view/screen/display_screen.dart';

const backgroundColor = Colors.black;
var buttonColor = Colors.red[400];
const borderColor = Colors.grey;

var pageindex = [
   DisplayVideo_Screen(),
  const Text('Search'),
  const addVideo_screen(),
  const Text('Message'),
  const Text('Profile')
];
