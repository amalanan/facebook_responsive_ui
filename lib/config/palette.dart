import 'package:flutter/material.dart';

class Palette {
  static const Color scaffold = Color(0xfff0f2f5);

  static const Color facebookBlue = Color(0xff1777f2);

  static const LinearGradient createRoomGradient = LinearGradient(
    colors: [Color(0xff496AE1), Color(0xffCE48B1)],
  );

  static const Color online = Color(0xff4BCB1F);

  static const LinearGradient storyGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Colors.transparent, Colors.black26],
  );
}
