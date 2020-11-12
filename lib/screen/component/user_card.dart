import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kudos/constant.dart';
import 'package:kudos/model/user.dart';
import 'package:kudos/screen/component/user_icon.dart';

class UserCard extends StatelessWidget {
  final User user;
  const UserCard({
    Key key,
    @required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin / 4),
      child: Column(
        children: [
          UserIcon(
            icon: SvgPicture.asset(user.image),
          ),
          Container(
            margin: EdgeInsets.only(top: kDefaultPaddin / 4),
            child: Text(
              user.name,
              style: Theme.of(context).textTheme.bodyText1.copyWith(
                    color: Colors.black,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
