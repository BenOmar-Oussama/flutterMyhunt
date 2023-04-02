import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'Challenge.dart';


import 'pages/PhotographyView.dart';

class EventTypePic extends StatefulWidget {
  final Challenge challenge;
  const EventTypePic({super.key, required this.challenge});

  @override
  State<EventTypePic> createState() => _EventTypePicState();
}

class _EventTypePicState extends State<EventTypePic> {
  int _page = 0;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: 0,
        height: 60.0,
        items: <Widget>[
          Icon(
            Icons.add,
            size: 30,
            color: Colors.white,
          ),
          Icon(Icons.list, size: 30, color: Colors.white),
          Icon(Icons.compare_arrows, size: 30, color: Colors.white),
          Icon(Icons.call_split, size: 30, color: Colors.white),
          Icon(Icons.perm_identity, size: 30, color: Colors.white),
        ],
        color: Color.fromARGB(255, 32, 23, 141),
        buttonBackgroundColor: Color.fromARGB(255, 32, 23, 141),
        backgroundColor: Colors.white,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 200),
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
        letIndexChange: (index) => true,
      ),
      appBar: AppBar(
        leading: const Icon(Icons.menu),
        // leading: Icon(Icons.arrow_back_ios_new),
        // backgroundColor: Color.fromARGB(0, 255, 255, 255),
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
        elevation: 0,
        centerTitle: true,
        
      ),
      body: eventpage(context, widget.challenge),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.camera),
        onPressed: () async {
          await availableCameras().then((value) => Navigator.of(context).push(
              MaterialPageRoute(
                  builder: (context) => TakePictureScreen(camera: value))));
        },
      ),
    );
  }
}

Widget eventpage(BuildContext context, Challenge challenge) {
  final _width = MediaQuery.of(context).size.width;
  final _height = MediaQuery.of(context).size.height;

  return Container(
    child: Stack(
      children: <Widget>[
        Container(
          height: 200,
          
          decoration: BoxDecoration(
              color: Color.fromARGB(255, 0, 0, 0),
              borderRadius: BorderRadius.only(bottomRight: Radius.circular(10) , bottomLeft: Radius.circular(10) )
              ),
        ),
        Scaffold(
          backgroundColor: Color.fromARGB(0, 155, 155, 155),
          body: Container(
            child: Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: EdgeInsets.only(top: _height / 50),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        CircleAvatar(
                          backgroundImage:
                               AssetImage('assets/profile_img.jpeg'),
                          
                          radius: _height / 15,
                        ),
                        SizedBox(
                          height: _height / 30,
                        ),
                        Text(
                          challenge.challengeName,
                          style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: _height / 2.2),
                  child: Container(
                    color: Colors.white,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: _height / 4,
                      left: _width / 30,
                      right: _width / 30),
                  child: Column(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black45,
                                  blurRadius: 2.0,
                                  offset: Offset(0.0, 2.0))
                            ]),
                        child: Padding(
                          padding: EdgeInsets.all(_width / 20),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                headerChild('Submissions', 114),
                                headerChild('Reward', 20),
                                headerChild('Building', 7),
                              ]),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: _height / 20),
                        child: Column(
                          children: <Widget>[
                            infoChild(
                                _width*1.2, Icons.email, 'zulfiqar108@gmail.com'),
                            infoChild(_width*1.2, Icons.call, '+12-1234567890'),
                            infoChild(_width*1.2, Icons.notification_add, 'Notify me'),
                            infoChild(
                                _width, Icons.chat_bubble, 'Show Event Feed'),
                            // new Padding(
                            //   padding: new EdgeInsets.only(top: _height / 30),
                            //   child: new Container(
                            //     width: _width / 3,
                            //     height: _height / 20,
                            //     decoration: new BoxDecoration(
                            //         color: const Color(0xFF26CBE6),
                            //         borderRadius: new BorderRadius.all(
                            //             new Radius.circular(_height / 40)),
                            //         boxShadow: [
                            //           new BoxShadow(
                            //               color: Colors.black87,
                            //               blurRadius: 2.0,
                            //               offset: new Offset(0.0, 1.0))
                            //         ]),
                            //     child: new Center(
                            //       child: new Text('FOLLOW ME',
                            //           style: new TextStyle(
                            //               fontSize: 12.0,
                            //               color: Colors.white,
                            //               fontWeight: FontWeight.bold)),
                            //     ),
                            //   ),
                            // )
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

Widget headerChild(String header, int value) => Expanded(
        child: Column(
      children: <Widget>[
        Text(header),
        SizedBox(
          height: 8.0,
        ),
        Text(
          '$value',
          style: TextStyle(
              fontSize: 14.0,
              color: const Color(0xFF26CBE6),
              fontWeight: FontWeight.bold),
        )
      ],
    ));

Widget infoChild(double width, IconData icon, data) => Padding(
      padding: EdgeInsets.only(bottom: 8.0),
      child: Material(
        child: InkWell(
          child: Row(
            children: <Widget>[
              SizedBox(
                width: width / 10,
              ),
              Icon(
                icon,
                color: const Color(0xFF26CBE6),
                size: 36.0,
              ),
              SizedBox(
                width: width / 20,
              ),
              Text(data)
            ],
          ),
          onTap: () {
            print('Info Object selected');
          },
        ),
      ),
    );
