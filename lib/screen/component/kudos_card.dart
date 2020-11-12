import 'package:flutter/material.dart';
import 'package:kudos/constant.dart';
import 'package:kudos/model/kudos.dart';

class KudosCard extends StatelessWidget {
  final Size size;
  final Kudos kudos;
  const KudosCard({Key key, @required this.size, @required this.kudos})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width * 0.6,
      child: Container(
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
          top: kDefaultPaddin / 2,
          bottom: kDefaultPaddin / 2,
          right: kDefaultPaddin / 2,
          left: kDefaultPaddin / 2,
        ),
        child: Column(
          children: [
            Container(
              color: Colors.blue,
              margin: EdgeInsets.only(bottom: kDefaultPaddin),
              height: 200,
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: kDefaultPaddin / 2),
                    child: Text(
                      kudos.name,
                      style: Theme.of(context).textTheme.bodyText1.copyWith(
                            color: Colors.black,
                          ),
                    ),
                  ),
                ),
                FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: kDefaultPaddin,
                  ),
                  color: kGreyLight,
                  child: Text(
                    "Pilih",
                    style: Theme.of(context).textTheme.bodyText1.copyWith(
                          color: Colors.blue,
                        ),
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
