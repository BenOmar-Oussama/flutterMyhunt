import 'package:flutter/material.dart';
import 'package:myhuntmigration/models/Post.dart';
import 'package:myhuntmigration/models/User.dart';

class Sample {
  static User mohammad = User(
      name: "Hack2Impact",
      username: "@Hack2Impact",
      followers: 400,
      following: 190,
      profilePicture: "assets/users/mohammad.jpg",
      
        
        
      );

  static User yasir = User(
      name: "Talk Game",
      username: "@yasirnoori.yn",
      followers: 400,
      following: 190,
      profilePicture: "assets/users/yasir.jpg",
      );

  static Post postOne = Post(
    EventName: "Hack2Impact",
    description: "event description",
      guildlines: "blablajeklwfje",
      following: 50,
      ChallengeType: Icons.camera_alt_outlined,
      Points: 10,
      user: mohammad,
      location: "Building 7",
      deadline: "3 hours",
      photos: [

      ],
      relatedPhotos: [
        'assets/hack2impactsamplefeed/ORG_GROUP_PIC7.jpeg',
        'assets/hack2impactsamplefeed/PIC08537.JPG',
        'assets/hack2impactsamplefeed/PIC08539.JPG',
        'assets/hack2impactsamplefeed/PIC08651.JPG',
      ]);

  static Post postTwo = Post(
      EventName: "Status Selfie",
      description: "event description",
      guildlines: "blablajeklwfje",
      following: 40,
      ChallengeType: Icons.qr_code_scanner_outlined,
      Points: 5,
      user: yasir,
      location: "Building 14",
      deadline: "6 Hours",
      photos: [
      ],
      relatedPhotos: [

      ]);
}
