import 'package:flutter/material.dart';
import 'package:myhuntmigration/EventTakePicture.dart';
import 'Challenge.dart';

Widget item(int index, double screenWidth, List<Challenge> challenges) {
  return GestureDetector(
    child: Padding(
      padding: const EdgeInsets.all(4.0),
      child: AnimatedContainer(
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth / 30,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        duration: Duration(milliseconds: 300 + (index * 200)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: challenges[index].ogColor),
              child: Center(
                  child: Text(
                challenges[index].challengeIcon,
                style: const TextStyle(fontSize: 20),
              )),
            ),
            const SizedBox(
              width: 15,
            ),
            Column(
              children: [
                Text(
                  "${challenges[index].getChallengeName}",
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.arrow_forward_ios,
                      size: 10,
                    ),
                    Text(
                      "${challenges[index].getEventName}",
                      style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Color.fromARGB(255, 83, 83, 83)),
                    ),
                  ],
                ),
              ],
            ),
            const Spacer(),
            Text(
              "${challenges[index].getPoints}pts",
              style: const TextStyle(
                fontSize: 20,
                color: Color.fromARGB(197, 61, 61, 61),
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios,
              color: Color.fromARGB(87, 105, 105, 105),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget item2(int index, List<Challenge> challenges, BuildContext context) {
  return ListTile(
    //       leading: CircleAvatar(
    //       backgroundColor: challenges[index].ogColor,
    //       child: Text(challenges[index].challengeIcon),
    // ),

    leading: AspectRatio(
      aspectRatio: 1,
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(9.0)),
        child: Container(
          color: challenges[index].ogColor,
          child: Center(
              child: Text(
            challenges[index].challengeIcon,
            style: const TextStyle(fontSize: 30),
          )),
        ),
      ),
    ),
    title: Text(challenges[index].getChallengeName),
    subtitle: Text(challenges[index].getEventName),
    trailing: const Icon(Icons.arrow_forward_ios),
    onTap: () {
      if (challenges[index].challengeIcon == "📸") {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (BuildContext context) {
          return EventTypePic(
            challenge: challenges[index],
          );
        }));
      } else {
        // Navigator.of(context)
        //     .push(MaterialPageRoute(builder: (BuildContext context) {
        //   return QRViewExample();
        // }));
      }
    },
  );
}
