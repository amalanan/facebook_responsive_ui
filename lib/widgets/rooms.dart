import 'package:facebook_responsive_ui/widgets/profile_avatar.dart';
import 'package:facebook_responsive_ui/widgets/widgets.dart';
import 'package:flutter/material.dart';

import '../config/palette.dart';
import '../models/models.dart';

class Rooms extends StatelessWidget {
  const Rooms({super.key, required this.onlineUsers});

  final List<User> onlineUsers;

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = Responsive.isDesktop(context);
    return Card(
      margin: EdgeInsets.symmetric(horizontal: isDesktop ? 5 : 0),
      elevation: isDesktop ? 1 : 0,
      shape:
          isDesktop
              ? RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
              : null,
      child: Container(
        height: 70,
        color: Colors.white,
        child: ListView.builder(
          padding: EdgeInsets.symmetric(horizontal: 4, vertical: 10),
          scrollDirection: Axis.horizontal,
          itemCount: 1 + onlineUsers.length,
          itemBuilder: (builder, index) {
            if (index == 0) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: _CreateRoomButton(),
              );
            }
            final User user = onlineUsers[index - 1];
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: ProfileAvatar(
                imageUrl: user.imageUrl,
                isActive: true,
                hasBorder: false,
              ),
            );
          },
        ),
      ),
    );
  }
}

class _CreateRoomButton extends StatelessWidget {
  const _CreateRoomButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 125, // You can adjust width as needed
      child: OutlinedButton(
        onPressed: () => print('create room'),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
          side: MaterialStateProperty.all<BorderSide>(
            BorderSide(width: 3, color: Palette.facebookBlue),
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          ),
          padding: MaterialStateProperty.all<EdgeInsets>(
            EdgeInsets.symmetric(horizontal: 12),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            /* ShaderMask(
              shaderCallback: (rect) {
                return Palette.createRoomGradient.createShader(rect);
              }*/
            Icon(Icons.video_call, size: 35.0, color: Colors.purple),
            SizedBox(width: 6),
            Text(
              'Create\nRoom',
              style: TextStyle(color: Colors.black, fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
