import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myhuntmigration/data/Sample.dart';
import 'package:myhuntmigration/pages/PictureChallengePage.dart';
import 'package:myhuntmigration/pages/QRChallengePage.dart';

import '../helper/Colorsys.dart';
import '../models/Post.dart';

List<String> FilterText = [
  "Recommended",
  "ITS",
  "SSE",
  "SAO",
  "DSA",
  "SAC",
];

List<Post> posts = [
  Sample.postOne,
  Sample.postTwo,
  Sample.postOne,
  Sample.postTwo,
  Sample.postOne,
  Sample.postTwo,
];

Widget LevelContainer( BuildContext context) {
  return SafeArea(
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 00),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                RichText(
                    // textHeightBehavior: Tex,
                    text: TextSpan(children: <TextSpan>[
                  TextSpan(
                      text: "Hello,\n",
                      style: GoogleFonts.inter(
                        textStyle: TextStyle(
                            fontSize: 27,
                            color: Colorsys.graydark,
                            fontWeight: FontWeight.w600),
                      )),
                  TextSpan(
                      text: "Oussama El Mdaghri\n",
                      style: GoogleFonts.inter(
                        textStyle: TextStyle(
                            fontSize: 30,
                            color: Colorsys.graydark,
                            fontWeight: FontWeight.bold),
                      )),
                ])),
              ],
            ),
          ),
          const SizedBox(
            height: 0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              width: double.infinity,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                      color: Colorsys.purple.withOpacity(0.2),
                      spreadRadius: 3,
                      blurRadius: 12,
                      offset: const Offset(0, 3))
                ],
              ),
              child: Row(
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("myhuntmigration/assets/Icons.IconForLevelsOussama.png")
                )
                    ),

                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
            child: Row(
              children: [
                RichText(
                    text: TextSpan(children: <TextSpan>[
                  TextSpan(
                      text: "Ongoing Challenges\n",
                      style: GoogleFonts.inter(
                        textStyle: TextStyle(
                            fontSize: 21,
                            color: Colorsys.graydark,
                            fontWeight: FontWeight.w700),
                      )),
                ])),
                const Spacer(),
                RichText(
                    text: TextSpan(children: <TextSpan>[
                  TextSpan(
                      text: "> \n",
                      style: GoogleFonts.inter(
                        textStyle: TextStyle(
                            fontSize: 15,
                            color: Colorsys.graydark,
                            fontWeight: FontWeight.bold),
                      )),
                ])),
                RichText(
                    text: TextSpan(children: <TextSpan>[
                  TextSpan(
                      text: "See more\n",
                      style: GoogleFonts.inter(
                        textStyle: TextStyle(
                            fontSize: 15,
                            color: Colorsys.graydark,
                            fontWeight: FontWeight.w500),
                      )),
                ])),
              ],
            ),
          ),
          Container(
            transform: Matrix4.translationValues(0, -20, 0),
            child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: <Widget>[
                    const SizedBox(
                      width: 20,
                    ),
                    SelectedfilterBoxes("Recommended"),
                    const SizedBox(
                      width: 7,
                    ),
                    filterBoxes("ITS"),
                    const SizedBox(
                      width: 7,
                    ),
                    filterBoxes("SSE"),
                    const SizedBox(
                      width: 7,
                    ),
                    filterBoxes("SAO"),
                    const SizedBox(
                      width: 7,
                    ),
                    filterBoxes("DSA"),
                    const SizedBox(
                      width: 7,
                    ),
                    filterBoxes("SAHSS"),
                    const SizedBox(
                      width: 7,
                    ),
                    filterBoxes("BA"),
                    const SizedBox(
                      width: 7,
                    ),
                    filterBoxes("SAC"),
                    const SizedBox(
                      width: 20,
                    ),
                  ],
                )),
          ),
          Container(
            transform: Matrix4.translationValues(0, -20, 0),
            child: Column(
              children: [
                horizontalCard(Sample.postOne , context),
                horizontalCard(Sample.postTwo  , context),
                horizontalCard(Sample.post3 , context),
                horizontalCard(Sample.post4 , context),
                horizontalCard(Sample.post5 , context),
                horizontalCard(Sample.post6 , context),
              ],
            ),
          ),
          // ChallengeRow(Sample.postOne, Sample.postTwo),
          // ChallengeRow(Sample.postTwo, Sample.postOne),
          // ChallengeRow(Sample.postOne, Sample.postTwo),
          // ChallengeRow(Sample.postTwo, Sample.postOne),
          // ChallengeRow(Sample.postOne, Sample.postTwo),
          // ChallengeRow(Sample.postTwo, Sample.postOne),
        ],
      ),
    ),
  );
}

Widget card(Post post) {
  return Container(
    height: 200,
    width: 150,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: Colorsys.purpleblue,
    ),
    child: Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        Stack(alignment: AlignmentDirectional.bottomCenter, children: [
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colorsys.fadeblue,
            ),
            child: const Icon(
              Icons.camera_alt_outlined,
              size: 20,
            ),
          ),
          Container(
            alignment: Alignment.center,
            transform: Matrix4.translationValues(0, 8, 0),
            height: 20,
            width: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              color: Colorsys.whitish2,
            ),
            child: Text("${post.Points} 🌟",
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w900,
                  color: Colorsys.graydark,
                )),
          )
        ]),
        const SizedBox(
          height: 20,
        ),
        Text(post.user.name,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Colorsys.graydark,
            )),
        const SizedBox(
          height: 6,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              width: 30,
            ),
            Icon(
              Icons.pin_drop_outlined,
              color: Colorsys.graydark,
              size: 18,
            ),
            const SizedBox(
              width: 10,
            ),
            FittedBox(
              child: Text(
                post.location,
                style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: Colorsys.graydark),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 6,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              width: 30,
            ),
            Icon(
              Icons.timer_outlined,
              color: Colorsys.graydark,
              size: 18,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              post.deadline,
              style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: Colorsys.graydark),
            ),
          ],
        )
      ],
    ),
  );
}

Widget cardfull(Post post) {
  return Container(
    height: 200,
    width: 150,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: Colorsys.purpleblue,
    ),
    child: Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            const SizedBox(
              width: 10,
            ),
            Stack(alignment: AlignmentDirectional.bottomCenter, children: [
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colorsys.fadeblue,
                ),
                child: const Icon(
                  Icons.camera_alt_outlined,
                  size: 25,
                ),
              ),
              Container(
                alignment: Alignment.center,
                transform: Matrix4.translationValues(0, 8, 0),
                height: 20,
                width: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: Colorsys.whitish2,
                ),
                child: Text("${post.Points} 🌟",
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w900,
                      color: Colorsys.graydark,
                    )),
              )
            ]),
            const SizedBox(
              width: 10,
            ),
            Text("PictureQuest",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Colorsys.graydark,
                )),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        const SizedBox(
          height: 6,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              width: 30,
            ),
            Icon(
              Icons.pin_drop_outlined,
              color: Colorsys.graydark,
              size: 18,
            ),
            const SizedBox(
              width: 10,
            ),
            FittedBox(
              child: Text(
                post.location,
                style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: Colorsys.graydark),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 6,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              width: 30,
            ),
            Icon(
              Icons.timer_outlined,
              color: Colorsys.graydark,
              size: 18,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              post.deadline,
              style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: Colorsys.graydark),
            ),
          ],
        )
      ],
    ),
  );
}

Widget card2(Post post) {
  return Container(
      height: 200,
      width: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colorsys.purpleblue,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                height: 40,
                width: 40,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Colors.black),
              ),
            ],
          )
        ],
      ));
}

Widget ChallengeRow(Post post, Post post2) {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          cardfull(post),
          const SizedBox(
            width: 40,
          ),
          card(post2)
        ],
      ),
      const SizedBox(
        height: 20,
      )
    ],
  );
}

Widget SelectedfilterBoxes(String text) {
  return Container(
    height: 30,
    margin: const EdgeInsets.symmetric(vertical: 20),
    padding: const EdgeInsets.only(left: 10, right: 10, top: 7, bottom: 2),
    decoration: BoxDecoration(boxShadow: [
      BoxShadow(
          color: Colorsys.black.withOpacity(0.3),
          spreadRadius: 3,
          blurRadius: 10,
          offset: const Offset(0, 3))
    ], borderRadius: BorderRadius.circular(20), color: Colorsys.purple),
    child: RichText(
        text: TextSpan(children: <TextSpan>[
      TextSpan(
          text: text,
          style: GoogleFonts.inter(
            textStyle: TextStyle(
                fontSize: 13,
                color: Colorsys.whitish,
                fontWeight: FontWeight.w500),
          )),
    ])),
  );
}

Widget filterBoxes(String text) {
  return Container(
    height: 30,
    padding: const EdgeInsets.only(left: 10, right: 10, top: 7, bottom: 2),
    decoration: BoxDecoration(boxShadow: [
      BoxShadow(
          color: Colorsys.black.withOpacity(0.2),
          spreadRadius: 3,
          blurRadius: 10,
          offset: const Offset(0, 3))
    ], borderRadius: BorderRadius.circular(20), color: Colorsys.beigepurple),
    child: RichText(
        text: TextSpan(children: <TextSpan>[
      TextSpan(
          text: text,
          style: GoogleFonts.inter(
            textStyle: TextStyle(
                fontSize: 13,
                color: Colorsys.purple,
                fontWeight: FontWeight.w700),
          )),
    ])),
  );
}

Widget horizontalCard(Post post , BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    child: Stack(children: [
      GestureDetector(
        onTap: () {
                  Navigator.of(context)
            .push(MaterialPageRoute(builder: (BuildContext context) {
          if(post.ChallengeType == Icons.qr_code_rounded)
          {
            return  QRChallengePage(post: post,);
          }else
          {
            return ChallengePage(post: post);
          }
        }));
        },
        child: Container(
          width: double.infinity,
          height: 80,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: Colorsys.black.withOpacity(0.1),
                  spreadRadius: 6,
                  blurRadius: 12,
                  offset: const Offset(0, 3))
            ],
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 90,
                  ),
                  Icon(
                    Icons.timer,
                    color: Colorsys.purple,
                    size: 18,
                  ),
                  Text(
                    " ${post.deadline} left",
                    style: GoogleFonts.inter(
                      textStyle: TextStyle(
                          fontSize: 10,
                          color: Colorsys.graydark.withOpacity(0.5),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const Spacer(),
                  Icon(Icons.star , size: 18 , color: Colorsys.purple,),
                  Text(
                    "${post.Points}",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inter(
                      textStyle: TextStyle(
                          fontSize: 15,
                          color: Colorsys.graydark,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  const SizedBox(width: 95),
                  Text(
                    post.EventName,
                    //textAlign: TextAlign.start,
                    style: GoogleFonts.inter(
                      textStyle: TextStyle(
                          fontSize: 18,
                          color: Colorsys.graydark.withOpacity(1),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  const SizedBox(width: 95),
                  Text(
                    post.EventName,
                    //textAlign: TextAlign.start,
                    style: GoogleFonts.inter(
                      textStyle: TextStyle(
                          fontSize: 12,
                          color: Colorsys.graydark.withOpacity(0.7),
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      Stack(alignment: Alignment.center, children: [
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            color: Colorsys.purple.withOpacity(1),
            borderRadius: BorderRadius.circular(10),
          ),
          // child:
        ),
        Container(
          height: 45,
          width: 45,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colorsys.whitish.withOpacity(0.2),
                  spreadRadius: 7,
                  blurRadius: 14,
                  offset: const Offset(0, 5))
            ],
          ),
          child: Icon(
            post.ChallengeType,
            size: 30,
            color: Colorsys.purple,
          ),
        )
      ]),
    ]),
  );
}
