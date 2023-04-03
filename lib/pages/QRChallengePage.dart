import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myhuntmigration/pages/QRVIEW.dart';

import '../helper/Colorsys.dart';
import '../models/Post.dart';

class QRChallengePage extends StatefulWidget {
  final Post post;
  const QRChallengePage({super.key, required this.post});

  @override
  State<QRChallengePage> createState() => _QRChallengePageState();
}

class _QRChallengePageState extends State<QRChallengePage> {
    static   int _page = 0;
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  bool Feedselected = true;
  bool SubmissionSelected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(



         extendBody: true,
        bottomNavigationBar: CurvedNavigationBar(
          key: _bottomNavigationKey,
          index: 0,
          height: 60.0,
          items: <Widget>[
            Icon(
              Icons.fiber_new_rounded,
              size: 30,
              color: Colorsys.whitish,
            ),
            const Icon(Icons.list, size: 30, color: Colors.white),
            const Icon(Icons.home, size: 30, color: Colors.white),
            const Icon(Icons.star, size: 30, color: Colors.white),
            const Icon(Icons.perm_identity, size: 30, color: Colors.white),
          ],
          color: Colorsys.purple,
          buttonBackgroundColor: Colorsys.graydark,
          backgroundColor: Colors.transparent,
          animationCurve: Curves.easeInOut,
          animationDuration: const Duration(milliseconds: 200),
          onTap: (index) {
            setState(() {
              _page = index;
              debugPrint("$index");
            });
          },
          letIndexChange: (index) => true,
        ),
  
      body: 
      SafeArea(
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
                    text: "ScanQuest \n",
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
            child: Text(widget.post.EventName,
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
                color: Colorsys.whitish2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.star,
                  size: 30,
                  color: Colorsys.purple,
                ),
                Text(
                  "${widget.post.Points}",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
                    textStyle: TextStyle(
                        fontSize: 30,
                        color: Colorsys.graydark,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 14,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: Container(
            width: double.infinity,
            height: 160,
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
                Padding(
                  padding: const EdgeInsets.only(
                      left: 12.0, right: 12, top: 12, bottom: 16),
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
                                widget.post.description,
                            style: GoogleFonts.inter(
                              textStyle: TextStyle(
                                  fontSize: 13,
                                  color: Colorsys.graydark,
                                  fontWeight: FontWeight.w600),
                            )),
                      ])),
                ),
                Divider(
                  height: 0,
                  thickness: 2,
                  indent: 20,
                  endIndent: 20,
                  color: Colorsys.purple,
                ),
                FittedBox(
                  fit: BoxFit.contain,
                  child: Container(
                    alignment: Alignment.topLeft,
                    color: Colors.transparent,
                    height: 70,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(
                            Icons.location_on,
                            size: 20,
                            color: Colorsys.purple,
                          ),
                          SizedBox(
                            width: 158,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: RichText(
                                  textAlign: TextAlign.start,
                                  // textHeightBehavior: Tex,
                                  text: TextSpan(children: <TextSpan>[
                                    TextSpan(
                                        text: "",
                                        style: GoogleFonts.inter(
                                          textStyle: TextStyle(
                                              fontSize: 15,
                                              color: Colorsys.graydark,
                                              fontWeight: FontWeight.w600),
                                        )),
                                    TextSpan(
                                        text:
                                            widget.post.location,
                                        style: GoogleFonts.inter(
                                          textStyle: TextStyle(
                                              fontSize: 13,
                                              color: Colorsys.graydark,
                                              fontWeight: FontWeight.w600),
                                        )),
                                  ])),
                            ),
                          ),
                          VerticalDivider(
                            color: Colorsys.purple.withOpacity(1),
                            thickness: 2,
                            width: 50,
                            indent: 8,
                            endIndent: 8,
                          ),
                          Icon(Icons.timer, color: Colorsys.purple, size: 20),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: RichText(
                                textAlign: TextAlign.start,
                                // textHeightBehavior: Tex,
                                text: TextSpan(children: <TextSpan>[
                                  TextSpan(
                                      text: "",
                                      style: GoogleFonts.inter(
                                        textStyle: TextStyle(
                                            fontSize: 15,
                                            color: Colorsys.graydark,
                                            fontWeight: FontWeight.w600),
                                      )),
                                  TextSpan(
                                      text: widget.post.deadline,
                                      style: GoogleFonts.inter(
                                        textStyle: TextStyle(
                                            fontSize: 13,
                                            color: Colorsys.graydark,
                                            fontWeight: FontWeight.w600),
                                      )),
                                ])),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        Center(
          child: Container(
            height: 50,
            color: Colors.transparent,
            transform: Matrix4.translationValues(-20, 0, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  width: 45,
                ),
                SizedBox(
                  // height: 40,
                  // width: 60,
                  child: GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      child: SubmissionSelected
                          ? unselected("Submit")
                          : selected("Submit"),
                      onTap: () {
                        setState(() {
                          Feedselected = !Feedselected;
                          SubmissionSelected = !SubmissionSelected;
                        });
                      }),
                ),

              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20, bottom: 15),
          child: GestureDetector(
            onTap: ()  {
              debugPrint("QR");
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (BuildContext context) {
                return const qrview(); 
              }));
            },
            child: Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colorsys.purple,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        spreadRadius: 10,
                        blurRadius: 17,
                        offset: const Offset(0, 3))
                  ]),
              child: const Icon(Icons.qr_code_rounded,
                  size: 50, color: Colors.white),
            ),
          ),
        ),
        Text("Scan QR Code!",
            style: GoogleFonts.inter(
              textStyle: TextStyle(
                  fontSize: 18,
                  color: Colorsys.graydark,
                  fontWeight: FontWeight.w600),
            )),
      ]),
    ));
  }
}

// Widget Feed(){
//   return ListView.builder(itemBuilder: itemBuilder)
// }

Widget unselected(String text) {
  return AnimatedSwitcher(
    duration: const Duration(milliseconds: 300),
    // transitionBuilder: (child, animation) => ScaleTransition(scale: animation),
    child: Container(
      height: 30,
      width: 80,
      key: const ValueKey(1),
      color: const Color.fromARGB(0, 244, 67, 54),
      child: Padding(
        padding: const EdgeInsets.only(top: 5),
        child: Text(text,
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
              textStyle: TextStyle(
                  fontSize: 13,
                  color: Colorsys.graydark,
                  fontWeight: FontWeight.w600),
            )),
      ),
    ),
  );
}

Widget selected(String text) {
  return Container(
    key: const ValueKey(2),
    alignment: Alignment.center,
    height: 30,
    width: 80,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colorsys.purple,
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 14,
              spreadRadius: 9,
              offset: const Offset(0, 3))
        ]),
    child: Padding(
      padding: const EdgeInsets.only(bottom: 2),
      child: Text(text,
          textAlign: TextAlign.center,
          style: GoogleFonts.inter(
            textStyle: TextStyle(
                fontSize: 13,
                color: Colorsys.whitish2,
                fontWeight: FontWeight.w600),
          )),
    ),
  );
}
