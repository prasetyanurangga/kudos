import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kudos/constant.dart';
import 'package:kudos/model/user.dart';
import 'package:kudos/screen/component/user_card.dart';
import 'package:kudos/screen/component/user_icon.dart';
import 'package:kudos/screen/detail_screen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController scrollC = new ScrollController();
  bool lastItem = false;

  int selectedIndex = 0;

  void onTapNavBar(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final bottomNavigationItem = <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: Icon(Icons.home, size: 35),
        label: "Home",
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.alarm, size: 35),
        label: "History",
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.notifications, size: 35),
        label: "Notification",
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.person, size: 35),
        label: "Profile",
      ),
    ];

    final bottomNavBar = BottomNavigationBar(
      elevation: 20,
      items: bottomNavigationItem,
      currentIndex: selectedIndex,
      selectedItemColor: Colors.blue,
      unselectedItemColor: kTextLightColor,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      onTap: onTapNavBar,
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        toolbarHeight: 85,
        actions: [
          Padding(
            padding: const EdgeInsets.all(kDefaultPaddin / 2),
            child: UserIcon(
              icon: SvgPicture.asset("assets/avatars/001-boy.svg"),
            ),
          ),
        ],
      ),
      bottomNavigationBar: bottomNavBar,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(kDefaultPaddin),
              child: Text(
                "Bertemu dengan team baru",
                style: Theme.of(context).textTheme.headline3.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.w800,
                    ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: kDefaultPaddin,
                right: kDefaultPaddin,
                bottom: kDefaultPaddin,
              ),
              child: Text(
                "Team terakhir",
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    .copyWith(color: Colors.black, fontWeight: FontWeight.w700),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
              child: Stack(
                children: [
                  SizedBox(
                    height: 88,
                    child: NotificationListener(
                      child: ListView.builder(
                        controller: scrollC,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          if (!users[index].isBtn) {
                            return UserCard(user: users[index]);
                          }
                        },
                        itemCount: users.length,
                      ),
                      onNotification: (t) {
                        if (t is ScrollUpdateNotification) {
                          if (scrollC.offset ==
                              scrollC.position.maxScrollExtent) {
                            setState(() {
                              lastItem = true;
                            });
                          } else {
                            setState(() {
                              lastItem = false;
                            });
                          }
                        }
                      },
                    ),
                  ),
                  AnimatedOpacity(
                    duration: Duration(milliseconds: 400),
                    opacity: lastItem ? 0.0 : 1.0,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: SizedBox(
                        width: 50,
                        height: 88,
                        child: FlatButton(
                          padding: EdgeInsets.all(kDefaultPaddin / 4),
                          color: Colors.grey[350].withOpacity(0.25),
                          onPressed: () {
                            if (!lastItem) {
                              scrollC.animateTo(scrollC.position.pixels + 80,
                                  duration: Duration(seconds: 1),
                                  curve: Curves.easeIn);
                            }
                          },
                          child: Icon(
                            Icons.chevron_right,
                            size: 40,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                      color: kTextLightColor.withOpacity(0.5),
                      spreadRadius: 3,
                      blurRadius: 10,
                      offset: Offset(0, 3))
                ],
              ),
              padding: EdgeInsets.all(kDefaultPaddin),
              margin: EdgeInsets.all(kDefaultPaddin),
              child: Row(
                children: [
                  Container(
                    child: Icon(
                      Icons.lightbulb_outline,
                      color: Colors.yellow[700],
                      size: 25,
                    ),
                    margin: EdgeInsets.only(
                      right: kDefaultPaddin / 4,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      "Beri kudos kepada teammu",
                      style: Theme.of(context).textTheme.bodyText1.copyWith(
                            color: Colors.black,
                          ),
                    ),
                  ),
                  SizedBox(
                    width: 40,
                    height: 40,
                    child: FlatButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      onPressed: () {},
                      color: Colors.blue,
                      padding: EdgeInsets.all(kDefaultPaddin / 8),
                      child: Icon(
                        Icons.chevron_right,
                        size: 30,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                      color: kTextLightColor.withOpacity(0.5),
                      spreadRadius: 3,
                      blurRadius: 10,
                      offset: Offset(0, 3))
                ],
              ),
              padding: EdgeInsets.all(kDefaultPaddin),
              margin: EdgeInsets.only(
                bottom: kDefaultPaddin,
                left: kDefaultPaddin,
                right: kDefaultPaddin,
                top: 0.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: kDefaultPaddin / 4),
                    child: Text(
                      "Kamu butuh temen team baru lagi?",
                      style: Theme.of(context).textTheme.headline5.copyWith(
                            fontWeight: FontWeight.w800,
                            color: Colors.black,
                          ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: kDefaultPaddin / 4),
                    child: Text(
                      "Kami bakal bantuin kamu temuin mereka",
                      style: Theme.of(context).textTheme.bodyText1.copyWith(
                            color: Colors.black,
                          ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: kDefaultPaddin / 2),
                    child: Row(
                      children: [
                        Expanded(
                          child: FlatButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            padding: const EdgeInsets.symmetric(
                              vertical: kDefaultPaddin,
                            ),
                            color: Colors.blue,
                            child: Text(
                              "Cari Sekarang",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  .copyWith(
                                    color: Colors.white,
                                  ),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                PageRouteBuilder(
                                  opaque: false,
                                  pageBuilder: (BuildContext context, _, __) {
                                    return DetailScreen();
                                  },
                                  transitionsBuilder: (___,
                                      Animation<double> animation,
                                      ____,
                                      Widget child) {
                                    return FadeTransition(
                                      opacity: animation,
                                      child: child,
                                    );
                                  },
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
