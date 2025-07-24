import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebook_responsive_ui/widgets/profile_avatar.dart';
import 'package:facebook_responsive_ui/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_material_design_icons/flutter_material_design_icons.dart';

import '../config/palette.dart';
import '../models/models.dart';

class PostContainer extends StatelessWidget {
  const PostContainer({super.key, required this.post});

  final Post post;

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = Responsive.isDesktop(context);
    return Card(
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: isDesktop ? 5 : 0),
      elevation: isDesktop ? 1 : 0,
      shape:
          isDesktop
              ? RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
              : null,

      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8),
        color: Colors.white,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _PostHeader(post: post),
                  SizedBox(height: 4),
                  Text(post.caption),
                  post.imageUrl != null
                      ? SizedBox.shrink()
                      : SizedBox(height: 6),
                ],
              ),
            ),
            post.imageUrl != null
                ? Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: CachedNetworkImage(imageUrl: post.imageUrl!),
                )
                : SizedBox.shrink(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: _PostStates(post: post),
            ),
          ],
        ),
      ),
    );
  }
}

class _PostHeader extends StatelessWidget {
  const _PostHeader({super.key, required this.post});

  final Post post;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ProfileAvatar(
          imageUrl: post.user.imageUrl,
          isActive: false,
          hasBorder: false,
        ),
        SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                post.user.name,
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              Row(
                children: [
                  Text(
                    '${post.timeAgo} * ',
                    style: TextStyle(color: Colors.grey[600], fontSize: 12),
                  ),
                  Icon(Icons.public, color: Colors.grey[600], size: 12),
                ],
              ),
            ],
          ),
        ),
        IconButton(
          icon: Icon(Icons.more_horiz),
          onPressed: () {
            return print('More');
          },
        ),
      ],
    );
  }
}

class _PostStates extends StatelessWidget {
  const _PostStates({super.key, required this.post});

  final Post post;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              padding: EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Palette.facebookBlue,
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.thumb_up, size: 10, color: Colors.white),
            ),
            SizedBox(width: 4),
            Expanded(
              child: Text(
                '${post.likes}',
                style: TextStyle(color: Colors.grey[600]),
              ),
            ),
            Text(
              '${post.comments} Comments',
              style: TextStyle(color: Colors.grey[600]),
            ),
            SizedBox(width: 8),
            Text(
              '${post.shares} Shares',
              style: TextStyle(color: Colors.grey[600]),
            ),
          ],
        ),
        Divider(),
        Row(
          children: [
            _PostButton(
              icon: Icon(
                MdiIcons.thumbUpOutline,
                color: Colors.grey[600],
                size: 20,
              ),
              label: 'Like',
              onTap: () {
                return print('like');
              },
            ),
            _PostButton(
              icon: Icon(
                MdiIcons.commentOutline,
                color: Colors.grey[600],
                size: 20,
              ),
              label: 'Comment',
              onTap: () {
                return print('Comment');
              },
            ),
            _PostButton(
              icon: Icon(
                MdiIcons.shareOutline,
                color: Colors.grey[600],
                size: 25,
              ),
              label: 'Share',
              onTap: () {
                return print('Share');
              },
            ),
          ],
        ),
      ],
    );
  }
}

class _PostButton extends StatelessWidget {
  const _PostButton({
    super.key,
    required this.icon,
    required this.label,
    required this.onTap,
  });

  final Icon icon;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        color: Colors.white,
        child: InkWell(
          onTap: onTap,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 12),
            height: 25,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [icon, SizedBox(width: 4), Text(label)],
            ),
          ),
        ),
      ),
    );
  }
}
