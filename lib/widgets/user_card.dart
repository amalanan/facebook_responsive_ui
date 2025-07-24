import 'package:facebook_responsive_ui/widgets/profile_avatar.dart';
import 'package:flutter/material.dart';

import '../models/models.dart';

class UserCard extends StatelessWidget {
  const UserCard({super.key, required this.user});

  final User user;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          ProfileAvatar(
            imageUrl: user.imageUrl,
            isActive: false,
            hasBorder: false,
          ),
          SizedBox(width: 6),
          Flexible(
            child: Text(
              user.name,
              style: TextStyle(fontSize: 16),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
