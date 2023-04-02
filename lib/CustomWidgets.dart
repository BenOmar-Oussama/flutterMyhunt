

import 'dart:ui';

import 'package:flutter/material.dart';
import 'helper/Colorsys.dart';
import 'models/Post.dart';
import 'pages/SinglePost.dart';
import 'package:myhuntmigration/pages/SinglePost.dart';
import 'package:myhuntmigration/pages/SingleChallenge.dart';

Widget ScrollablePictureHorizontal(Post post , BuildContext context){
    return Container(
            height: 300,
            padding: const EdgeInsets.only(top: 20),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: post.photos.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SinglePost(
                                  post: post,
                                  image: post.photos[index],
                                )));
                  },
                  child: AspectRatio(
                    aspectRatio: 1.2 / 1,
                    child: Container(
                      margin: const EdgeInsets.only(right: 20),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(post.photos[index]),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.orange),
                      child: Stack(
                        children: <Widget>[
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Container(
                              margin: const EdgeInsets.all(20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  ClipRect(
                                    child: BackdropFilter(
                                      filter: ImageFilter.blur(
                                          sigmaX: 5, sigmaY: 5),
                                      child: Container(
                                        width: 30.0,
                                        height: 30.0,
                                        padding: const EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(4),
                                            color: Colors.grey[600]
                                                ?.withOpacity(0.1)),
                                        child: Center(
                                            child: Image.asset(
                                                'assets/icons/link.png')),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  ClipRect(
                                    child: BackdropFilter(
                                      filter: ImageFilter.blur(
                                          sigmaX: 5, sigmaY: 5),
                                      child: Container(
                                        width: 30.0,
                                        height: 30.0,
                                        padding: const EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(4),
                                            color: Colors.grey[600]
                                                ?.withOpacity(0.1)),
                                        child: Center(
                                            child: Image.asset(
                                                'assets/icons/heart.png')),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          );
     
  }