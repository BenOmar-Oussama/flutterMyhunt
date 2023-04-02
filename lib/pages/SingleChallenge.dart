import 'package:camera/camera.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:myhuntmigration/helper/Colorsys.dart';
import 'package:myhuntmigration/models/Post.dart';

import 'CameraView.dart';
import 'QRcodePage.dart';

class UserSingle extends StatefulWidget {
  final Post post;

  const UserSingle({
    super.key,
    required this.post,
  });

  @override
  State<UserSingle> createState() => _UserSingleState();
}

class _UserSingleState extends State<UserSingle> {
  int _page = 0;
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        backgroundColor: Colors.white,
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 200),
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
        letIndexChange: (index) => true,
      ),
      backgroundColor: Colorsys.lightGrey,
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
              delegate: SliverChildListDelegate(<Widget>[
            Column(
              children: <Widget>[
                Container(
                  height: 0,
                  color: Colors.white,
                ),
                Material(
                  //color: Colors.white,
                  child: InkWell(
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Colorsys.darkGray,
                                blurRadius: 40.0,
                                offset: const Offset(-2.0, -2.0))
                          ],
                          borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(15),
                              bottomRight: Radius.circular(15)),
                          color: Colors.white),
                      child: Column(
                        children: <Widget>[
                          const SizedBox(
                            height: 20,
                          ),
                          Hero(
                              transitionOnUserGestures: true,
                              tag: widget.post.user.username,
                              child: GestureDetector(
                                onTap: ()
                                    //CameraView
                                    async {
                                  if (widget.post.ChallengeType ==
                                      Icons.camera_alt_outlined) {
                                    await availableCameras().then((value) =>
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    TakePictureScreen(post: widget.post,
                                                        camera: value))));
                                  } else {
                                    //qr view
                                    Navigator.of(context).push(MaterialPageRoute(
                                        builder: (BuildContext context) {
                                      return const QRViewExample();
                                    }));
                                  }
                                },
                                child: Container(
                                  height: 60.0,
                                  width: 60.0,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle,
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colorsys.darkGray,
                                            blurRadius: 15.0,
                                            offset: const Offset(2.0, 2.0))
                                      ]),
                                  child: Icon(
                                    widget.post.ChallengeType,
                                    size: 30,
                                  ),
                                ),
                              )),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            widget.post.user.name,
                            style: TextStyle(
                                fontSize: 20,
                                color: Colorsys.black,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            widget.post.user.username,
                            style: TextStyle(fontSize: 15, color: Colorsys.grey),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              makeFollowWidgets(
                                  count: widget.post.relatedPhotos.length,
                                  name: "submissions"),
                              Container(
                                width: 2,
                                height: 15,
                                margin: const EdgeInsets.symmetric(horizontal: 20),
                                color: Colorsys.lightGrey,
                              ),
                              makeFollowWidgets(
                                  count: widget.post.following, name: "Following"),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          makeActionButtons()
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                          color: Colorsys.grey300,
                        ))),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "Feed",
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
                              "Likes",
                              style: TextStyle(
                                  color: Colorsys.grey,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15),
                            )
                          ],
                        ),
                      ),
                      makefeed(widget.post)
                    ],
                  ),
                ),
              ],
            ),
          ]))
        ],
      ),
    );
  }

  Widget makefeed(Post post) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(top: 20),
            height: 200,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: widget.post.relatedPhotos.length,
              itemBuilder: (context, index) {
                return AspectRatio(
                  aspectRatio: 1.4 / 1,
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        child: Stack(
                          alignment: AlignmentDirectional.bottomStart,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(right: 20),
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          widget.post.relatedPhotos[index]),
                                      fit: BoxFit.cover),
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.transparent),
                              child: Stack(
                                  alignment: AlignmentDirectional.bottomCenter,
                                  children: const <Widget>[]),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Icon(
                            Icons.favorite,
                            color: Colors.grey,
                            size: 30,
                          ),
                          const Text(
                            "10",
                            textAlign: TextAlign.right,
                            style: TextStyle(
                                fontSize: 13,
                                color: Colors.grey,
                                fontWeight: FontWeight.bold),
                          ),
                          const Spacer(),
                          Text(
                            "${post.deadline} ago",
                            textAlign: TextAlign.right,
                            style:
                                TextStyle(fontSize: 13, color: Colorsys.grey),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),

                      const Divider(
                        height: 10,
                        color: Color.fromARGB(141, 0, 0, 0),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      // Container(
                      //   height: 32,
                      //   margin: EdgeInsets.only(right: 20),
                      //   child: ListView.builder(
                      //     scrollDirection: Axis.vertical,
                      //     itemCount: widget.post.relatedPhotos[index].length,
                      //     itemBuilder: (context, tagIndex) => Container(
                      //       margin: EdgeInsets.only(right: 10),
                      //       padding: EdgeInsets.symmetric(
                      //           horizontal: 25, vertical: 5),
                      //       decoration: BoxDecoration(
                      //           borderRadius: BorderRadius.circular(5),
                      //           color: Colorsys.grey300),
                      //     ),
                      //   ),
                      // )
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }

  Widget makeFollowWidgets({count, name}) {
    return Row(
      children: <Widget>[
        Text(
          count.toString(),
          style: TextStyle(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colorsys.black),
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          name,
          style: TextStyle(fontSize: 15, color: Colorsys.darkGray),
        ),
      ],
    );
  }

  Widget makeActionButtons() {
    return Transform.translate(
      offset: const Offset(0, 20),
      child: Container(
        height: 65,
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.symmetric(horizontal: 50),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                  color: Color.fromARGB(255, 224, 224, 224),
                  blurRadius: 20,
                  offset: Offset(0, 10))
            ]),
        child: Row(
          children: <Widget>[
            Expanded(
              child: MaterialButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  height: double.infinity,
                  elevation: 0,
                  onPressed: () {},
                  color: Colorsys.purple,
                  child: const Text(
                    "Follow",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  )),
            ),
            Expanded(
              child: MaterialButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  height: double.infinity,
                  elevation: 0,
                  onPressed: () {},
                  color: Colors.transparent,
                  child: Text(
                    "Message",
                    style: TextStyle(
                        color: Colorsys.black, fontWeight: FontWeight.w400),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
