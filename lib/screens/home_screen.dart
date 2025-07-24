import 'package:facebook_responsive_ui/config/palette.dart';
import 'package:facebook_responsive_ui/widgets/more_options_list.dart';
import 'package:flutter/material.dart';
import 'package:facebook_responsive_ui/widgets/widgets.dart';
import 'package:flutter_material_design_icons/flutter_material_design_icons.dart';

import '../data/data.dart';
import '../models/models.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TrackingScrollController _trackingScrollController =
      TrackingScrollController();

  @override
  void dispose() {
    _trackingScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Responsive(
          mobileLayout: (context) {
            return _HomeScreenMobile(
              scrollControler: _trackingScrollController,
            );
          },
          desktopLayout: (context) {
            return _HomeScreenDesktop(
              scrollControler: _trackingScrollController,
            );
          },
          tabletLayout: (context) {
            return _HomeScreenMobile(
              scrollControler: _trackingScrollController,
            );
          },
        ),
      ),
    );
  }
}

class _HomeScreenMobile extends StatelessWidget {
  _HomeScreenMobile({
    super.key,
    required TrackingScrollController scrollControler,
  });

  final TrackingScrollController scrollController = TrackingScrollController();

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: scrollController,
      slivers: [
        SliverAppBar(
          backgroundColor: Colors.white,
          title: Text(
            'facebook',
            style: TextStyle(
              color: Palette.facebookBlue,
              fontSize: 28.0,
              fontWeight: FontWeight.bold,
              letterSpacing: -1.2,
            ),
          ),
          centerTitle: false,
          floating: true,
          actions: [
            CircleButton(
              icon: Icons.search,
              iconSize: 30.0,
              onPressed: () {
                return print('Search');
              },
            ),
            CircleButton(
              icon: MdiIcons.facebookMessenger,
              iconSize: 30.0,
              onPressed: () {
                return print('Messenger');
              },
            ),
          ],
        ),
        SliverToBoxAdapter(
          child: CreatePostContainer(currentUser: currentUser),
        ),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 5.0),
          sliver: SliverToBoxAdapter(child: Rooms(onlineUsers: onlineUsers)),
        ),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0),
          sliver: SliverToBoxAdapter(
            child: Stories(currentUser: currentUser, stories: stories),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
            final Post post = posts[index];
            return PostContainer(post: post);
          }, childCount: posts.length),
        ),
      ],
    );
  }
}

class _HomeScreenDesktop extends StatelessWidget {
  _HomeScreenDesktop({
    super.key,
    required TrackingScrollController scrollControler,
  });

  final TrackingScrollController scrollController = TrackingScrollController();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(flex: 2, child: Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.all(12),
            child: MoreOptionsList(currentUser: currentUser)
          ),
        ),),
        Spacer(),
        Container(
          width: 600,
          child: CustomScrollView(
            controller: scrollController,

            slivers: [
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 10.0),
                sliver: SliverToBoxAdapter(
                  child: Stories(currentUser: currentUser, stories: stories),
                ),
              ),
              SliverToBoxAdapter(
                child: CreatePostContainer(currentUser: currentUser),
              ),
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 5.0),
                sliver: SliverToBoxAdapter(
                  child: Rooms(onlineUsers: onlineUsers),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
                  final Post post = posts[index];
                  return PostContainer(post: post);
                }, childCount: posts.length),
              ),
            ],
          ),
        ),
        Spacer(),
        Flexible(
          flex: 2,
          child: Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: EdgeInsets.all(12),
              child: ContactsList(users: onlineUsers),
            ),
          ),
        ),
      ],
    );
  }
}
