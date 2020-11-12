import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kudos/constant.dart';
import 'package:kudos/model/kudos.dart';
import 'package:kudos/model/user.dart';
import 'package:kudos/screen/component/kudos_card.dart';
import 'package:kudos/screen/component/user_card.dart';
import 'package:kudos/screen/component/user_icon.dart';

class DetailScreen extends StatefulWidget {
  DetailScreen({Key key}) : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  final ScrollController scrollC = new ScrollController();
  bool lastItem = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        toolbarHeight: 85,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.chevron_left,
            size: 40,
            color: Colors.black,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(kDefaultPaddin / 2),
            child: UserIcon(
              icon: SvgPicture.asset("assets/avatars/001-boy.svg"),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(kDefaultPaddin),
              child: Text(
                "Berikan kudos kepada team kamu",
                style: Theme.of(context).textTheme.headline4.copyWith(
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
                "Beri Kepada",
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    .copyWith(color: Colors.black, fontWeight: FontWeight.w700),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
              child: SizedBox(
                height: 88,
                child: NotificationListener(
                  child: ListView.builder(
                    controller: scrollC,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      if (!users2[index].isBtn) {
                        return UserCard(user: users2[index]);
                      } else {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: kDefaultPaddin / 4),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 60,
                                width: 60,
                                child: OutlineButton(
                                  color: Colors.blue,
                                  borderSide: BorderSide(
                                    color: Colors.blue,
                                  ),
                                  padding: EdgeInsets.all(kDefaultPaddin / 2),
                                  shape: CircleBorder(),
                                  child: Icon(
                                    Icons.add,
                                    color: Colors.blue,
                                  ),
                                  onPressed: () {},
                                ),
                              ),
                              Container(
                                margin:
                                    EdgeInsets.only(top: kDefaultPaddin / 4),
                                child: Text(
                                  "Tambah",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1
                                      .copyWith(
                                        color: Colors.black,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }
                    },
                    itemCount: users2.length,
                  ),
                  onNotification: (t) {
                    if (t is ScrollUpdateNotification) {
                      if (scrollC.offset == scrollC.position.maxScrollExtent) {
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
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: kDefaultPaddin,
                right: kDefaultPaddin,
                top: kDefaultPaddin,
                bottom: kDefaultPaddin / 2,
              ),
              child: Text(
                "Pilih Template Kartu",
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    .copyWith(color: Colors.black, fontWeight: FontWeight.w700),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: kDefaultPaddin / 2),
              child: SizedBox(
                height: 330,
                child: ListView.builder(
                  itemBuilder: (context, index) =>
                      KudosCard(size: size, kudos: kudoss[index]),
                  itemCount: kudoss.length,
                  scrollDirection: Axis.horizontal,
                ),
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
              margin: EdgeInsets.symmetric(
                horizontal: kDefaultPaddin,
                vertical: kDefaultPaddin,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      "Bikin kartu kudos versi kamu sendiri yuk!",
                      style: Theme.of(context).textTheme.headline6.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.w800,
                          ),
                    ),
                  ),
                  SizedBox(
                    width: 60,
                    height: 60,
                    child: FlatButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      onPressed: () {},
                      color: Colors.blue,
                      padding: EdgeInsets.all(kDefaultPaddin / 4),
                      child: Icon(
                        Icons.chevron_right,
                        size: 40,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
