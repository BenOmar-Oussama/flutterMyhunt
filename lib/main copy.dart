
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myhuntmigration/data/Sample.dart';
import 'package:myhuntmigration/helper/Colorsys.dart';
import 'package:myhuntmigration/models/Post.dart';
import 'package:myhuntmigration/pages/SingleChallenge.dart';

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
      backgroundColor: Colors.white,
      //Check if remove later
      //extendBodyBehindAppBar: true,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            elevation: 0,
            backgroundColor: Colors.white,
            leading: IconButton(
              icon: Icon(
                Icons.menu,
                color: Colorsys.darkGray,
              ),
              onPressed: () {},
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              <Widget>[
                LevelContainer(),
                const SizedBox(
                  height: 40,
                ),
                Container(
                  padding: const EdgeInsets.all(20),
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40)),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey,
                          blurRadius: 5.0,
                          offset: Offset(2.0, -2.0))
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "UpComing Challenges!",
                        style: TextStyle(
                            color: Colorsys.darkGray,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(color: Colorsys.lightGrey))),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "Recommended",
                                    style: TextStyle(
                                        color: Colorsys.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  ),
                                  Container(
                                    width: 50,
                                    padding: const EdgeInsets.only(bottom: 10),
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                color: Colorsys.purple,
                                                width: 3))),
                                  )
                                ],
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Text(
                                "SSE",
                                style: TextStyle(
                                    color: Colorsys.grey,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Text(
                                "ITS",
                                style: TextStyle(
                                    color: Colorsys.grey,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Text(
                                "SAHSS",
                                style: TextStyle(
                                    color: Colorsys.grey,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Text(
                                "SAO",
                                style: TextStyle(
                                    color: Colorsys.grey,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Text(
                                "SBA",
                                style: TextStyle(
                                    color: Colorsys.grey,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Text(
                                "SAC",
                                style: TextStyle(
                                    color: Colorsys.grey,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Text(
                                "OAS",
                                style: TextStyle(
                                    color: Colorsys.grey,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      makePost(Sample.postOne),
                      makePost(Sample.postTwo),
                      makePost(Sample.postOne),
                      makePost(Sample.postTwo),
                      makePost(Sample.postOne),
                      makePost(Sample.postTwo),
                      makePost(Sample.postOne),
                      makePost(Sample.postTwo),
                      const SizedBox(
                        height: 50,
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
      extendBody: true,
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: 0,
        height: 60.0,
        items: const <Widget>[
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
        color: Colorsys.purple,
        buttonBackgroundColor: Colorsys.darkGray,
        backgroundColor: Colors.transparent,
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 200),
        onTap: (index) {
          setState(() {
            _page = index;
            debugPrint("$index");
            if(index == 4){
              // Navigator.push(
              //       context,
              //       MaterialPageRoute(
              //           builder: (context) => profilePage(bottomBarIndex: index)));
            }
          });
        },
        letIndexChange: (index) => true,
      ),
    );
  }

  Widget makePost(Post post) {
    return Container(
      margin: const EdgeInsets.only(bottom: 30),
      child: Column(
        children: <Widget>[
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => UserSingle(post: post)));
              },
              child: Row(
                children: <Widget>[
                  Hero(
                      transitionOnUserGestures: true,
                      tag: post.user.username,
                      child: Stack(
                          alignment: AlignmentDirectional.topStart,
                          children: [
                            Container(
                              height: 45.0,
                              width: 45.0,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colorsys.darkGray,
                                        blurRadius: 10.0,
                                        offset: const Offset(2.0, 2.0))
                                  ]),
                              child: Icon(post.ChallengeType),
                            ),
                          ])),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children: [
                            Text(
                              post.user.name,
                              style: const TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w700),
                            ),
                            const Spacer(),
                            Text(
                              "${post.Points}🌟",
                              style: const TextStyle(
                                  fontSize: 13, fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              post.location,
                              style:
                                  TextStyle(fontSize: 13, color: Colorsys.grey),
                            ),
                            Text(
                              "In ${post.deadline}",
                              style:
                                  TextStyle(fontSize: 13, color: Colorsys.grey),
                            )
                          ],
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

  Widget LevelContainer() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SizedBox(
            height: 10,
          ),
          RichText(
              text: TextSpan(children: <TextSpan>[
            TextSpan(
              text: "Hi StudentName!\n",
              style: TextStyle(
                  fontSize: 30,
                  color: Colorsys.darkGray,
                  fontWeight: FontWeight.bold),
            ),
            TextSpan(
              text: "You have completed 0 challenges today.\n",
              style: TextStyle(
                  fontSize: 16,
                  color: Colorsys.darkGray,
                  fontWeight: FontWeight.bold),
            ),
          ])),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Text(
                "Current Level:",
                style: TextStyle(
                    fontSize: 16,
                    color: Colorsys.darkGray,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                " 6",
                style: TextStyle(
                    fontSize: 30,
                    color: Colorsys.darkGray,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          
        ],
      ),
    );
  }
}
