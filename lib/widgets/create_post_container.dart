import 'package:facebook_responsive_ui/widgets/widgets.dart';
import 'package:flutter/material.dart';
import '../models/models.dart';

class CreatePostContainer extends StatelessWidget {
  const CreatePostContainer({super.key, required this.currentUser});

  final User currentUser;

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = Responsive.isDesktop(context);
    return Card(
      margin: EdgeInsets.symmetric(horizontal: isDesktop ? 5 : 0),
      elevation: isDesktop ? 1 : 0,
     shape: isDesktop ? RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)): null,
      child: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(12, 8, 12, 0),
          child: Column(
            children: [
              Row(
                children: [
                  ProfileAvatar(imageUrl: currentUser.imageUrl, isActive: false,hasBorder: false,),
                  SizedBox(width: 8.0),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration.collapsed(
                        hintText: 'What\'s on your mind?',
                      ),
                    ),
                  ),
                ],
              ),
              Divider(height: 15, thickness: 0.5),
              SizedBox(
                height: 40,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.videocam, color: Colors.red),
                        SizedBox(width: 4),
                        Text('Live'),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.photo_library, color: Colors.green),
                        SizedBox(width: 4),
                        Text('Photo'),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.video_call, color: Colors.purpleAccent),
                        SizedBox(width: 4),
                        Text('Room'),
                      ],
                    ),
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
