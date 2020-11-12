import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kudos/constant.dart';

class UserIcon extends StatelessWidget {
  final SvgPicture icon;
  const UserIcon({
    Key key,
    @required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: 60,
      child: FlatButton(
        padding: EdgeInsets.all(kDefaultPaddin / 2),
        color: kGreyLight,
        shape: CircleBorder(),
        child: icon,
        onPressed: () {},
      ),
    );
  }
}
