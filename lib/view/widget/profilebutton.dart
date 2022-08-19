// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class ProfileButton extends StatelessWidget {
  ProfileButton({Key? key, required this.profilePhotoUrl}) : super(key: key);
  String profilePhotoUrl;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 60,
      height: 60,
      child: Stack(
        children: [
          Positioned(
            left: 10,top: 20,
            child: Container(
              width: 40,
              height: 40,
              padding: const EdgeInsets.all(1),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child:Image(
                   image: NetworkImage(profilePhotoUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
