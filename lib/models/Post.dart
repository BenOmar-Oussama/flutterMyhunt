import 'package:flutter/material.dart';
import 'package:myhuntmigration/models/User.dart';

class Post {
  late User user;
  final String location;
  final String deadline;
  final List<String> photos;
  late List<String> relatedPhotos;
  final IconData ChallengeType;
  final int Points;
  late String FacebookProfile;
  late String InstagramProfile;
  late String Email;
  final String EventName;
  final String description;
  final String guildlines;

  get getFacebookProfile => FacebookProfile;

 set setFacebookProfile( FacebookProfile) => this.FacebookProfile = FacebookProfile;

  get getInstagramProfile => InstagramProfile;

 set setInstagramProfile( InstagramProfile) => this.InstagramProfile = InstagramProfile;

  get getEmail => Email;

 set setEmail( Email) => this.Email = Email;
  late int following;

  get getUser => user;

 set setUser( user) => this.user = user;

  get getLocation => location;


  get getDateAgo => deadline;


  get getPhotos => photos;


  get getRelatedPhotos => relatedPhotos;

 set setRelatedPhotos( relatedPhotos) => this.relatedPhotos = relatedPhotos;

  get getChallengeType => ChallengeType;


  get getPoints => Points;



  Post({required this.EventName,required this.description,required this.guildlines, required this.following, required this.ChallengeType,required this.Points, required this.location, required this.deadline, required this.photos, required this.relatedPhotos,required  this.user})
;   Post.over({required this.EventName,required this.description,required this.guildlines, required this.ChallengeType,required this.Points, required this.location, required this.deadline, required this.photos,});


}