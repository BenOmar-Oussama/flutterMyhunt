import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myhuntmigration/data/Sample.dart';
import 'package:myhuntmigration/pages/PictureChallengePage.dart';
import 'package:myhuntmigration/pages/HomePage.dart';
import 'package:myhuntmigration/pages/QRChallengePage.dart';

import 'helper/Colorsys.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    //systemNavigationBarColor: Colors.transparent,
  ));
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static int _page = 0;
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colorsys.whitish,
        //Check if remove later
        //extendBodyBehindAppBar: true,
        body: [
            ChallengePage(post : Sample.postOne),
            QRChallengePage(post : Sample.postOne),
          SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              LevelContainer(context),          
            ],
          ),
        ), 
            ChallengePage(post : Sample.postOne),
            ChallengePage(post : Sample.postOne),
        ][_page],
        
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
        ));
  }
}
