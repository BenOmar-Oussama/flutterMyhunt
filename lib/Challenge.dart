import 'package:flutter/material.dart';

class Challenge {
  String eventName;
  String challengeName;
  String challengeIcon;
  String deadline;
  String description;
  int points;
  String location;
  String organization;
  Color ogColor;
  late String clubName;
  var comments = Map(); 

  void test(){
    debugPrint("fewf");
  }

  Challenge(
      this.ogColor,

      this.eventName,
      this.challengeName,
      this.challengeIcon,
      this.deadline,
      this.description,
      this.points,
      this.location,
      this.organization);

  Challenge.over(
      this.ogColor,
      this.eventName,
      this.challengeName,
      this.challengeIcon,
      this.deadline,
      this.description,
      this.points,
      this.location,
      this.organization,
      this.clubName);


   get getColor => this.ogColor;

  get getEventName => this.eventName;

  set setEventName(eventName) => this.eventName = eventName;

  get getChallengeName => this.challengeName;

  set setChallengeName(challengeName) => this.challengeName = challengeName;

  get getChallengeIcon => this.challengeIcon;

  set setChallengeIcon(challengeIcon) => this.challengeIcon = challengeIcon;

  get getDeadline => this.deadline;

  set setDeadline(deadline) => this.deadline = deadline;

  get getDescription => this.description;

  set setDescription(description) => this.description = description;

  get getPoints => this.points;

  set setPoints(points) => this.points = points;

  get getLocation => this.location;

  set setLocation(location) => this.location = location;

  get getClubName => this.clubName;

  set setClubName(clubName) => this.clubName = clubName;

  String getname(){

    return eventName;
  }

  
}
