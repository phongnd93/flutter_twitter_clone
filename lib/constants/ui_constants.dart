import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_twitter_clone/constants/assets_constants.dart';

class UIConstants {
  static AppBar appBar() {
    return AppBar(
      title: SvgPicture.asset(
        AssetsConstants.twitterLogo,
        color: Colors.blue,
        height: 30,
      ),
      centerTitle: true,
    );
  }
}
