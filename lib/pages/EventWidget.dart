import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../helper/Colorsys.dart';
import '../models/Post.dart';

Widget ChallengeView(Post post) {
  return Scaffold(
      body: SafeArea(
    child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      const SizedBox(
        height: 10,
      ),
      Center(
        child: RichText(
            textAlign: TextAlign.center,
            // textHeightBehavior: Tex,
            text: TextSpan(children: <TextSpan>[
              TextSpan(
                  text: "Your Challenge\n",
                  style: GoogleFonts.inter(
                    textStyle: TextStyle(
                        fontSize: 20,
                        color: Colorsys.graydark,
                        fontWeight: FontWeight.w600),
                  )),
              TextSpan(
                  text: "PictureQuest \n",
                  style: GoogleFonts.inter(
                    textStyle: TextStyle(
                        fontSize: 30,
                        color: Colorsys.graydark,
                        fontWeight: FontWeight.bold),
                  )),
            ])),
      ),
      Center(
        child: Container(
          transform: Matrix4.translationValues(0, -30, 0),
          height: 50,
          width: double.infinity,
          child: Text(post.EventName,
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                textStyle: TextStyle(
                    fontSize: 50,
                    color: Colorsys.purple,
                    fontWeight: FontWeight.w600),
              )),
        ),
      ),
      Center(
        child: Container(
          height: 30,
          width: 100,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colorsys.fadeblue),
          child: Text(
            "🌟" "${post.Points}",
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
              textStyle: TextStyle(
                  fontSize: 25,
                  color: Colorsys.graydark,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ),
      const SizedBox(
        height: 14,
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: Container(
          height: 90,
          width: double.infinity,
          padding: const EdgeInsets.only(left: 20, right: 3, top: 3, bottom: 3),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.transparent),
          child: Padding(
            padding: const EdgeInsets.only(top: 10, right: 15),
            child: RichText(
                textAlign: TextAlign.start,
                // textHeightBehavior: Tex,
                text: TextSpan(children: <TextSpan>[
                  TextSpan(
                      text: "Description: ",
                      style: GoogleFonts.inter(
                        textStyle: TextStyle(
                            fontSize: 17,
                            color: Colorsys.graydark,
                            fontWeight: FontWeight.w600),
                      )),
                  TextSpan(
                      text:
                          "fhjekwfhkewjfhkewjfhjwefhewjfwefhfhejwfhewkjfhewjkfhewjkfewhjfewhjfwekjewhfjkefewfewfewfewfwwefwewhekf",
                      style: GoogleFonts.inter(
                        textStyle: TextStyle(
                            fontSize: 13,
                            color: Colorsys.graydark,
                            fontWeight: FontWeight.w600),
                      )),
                ])),
          ),
        ),
      ),
      Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Submit",
                style: GoogleFonts.inter(
                  textStyle: TextStyle(
                      fontSize: 13,
                      color: Colorsys.graydark,
                      fontWeight: FontWeight.w600),
                )),
            const VerticalDivider(
              color: Colors.black,
              thickness: 1,
              width: 30,
              indent: 20,
              endIndent: 0,
            ),
            Text("Feed",
                style: GoogleFonts.inter(
                  textStyle: TextStyle(
                      fontSize: 13,
                      color: Colorsys.graydark,
                      fontWeight: FontWeight.w600),
                )),
          ],
        ),
      )
    ]),
  ));
}
