import 'package:flutter/material.dart';

import '../config/palette.dart';

class CustomTabBar extends StatelessWidget {
  const CustomTabBar({
    super.key,
    required this.icons,
    required this.selectedIndex,
    required this.onTap,
    this.isButtomIndicator = false,
  });

  final List<IconData> icons;
  final int selectedIndex;
  final Function(int) onTap;
  final bool isButtomIndicator;

  @override
  Widget build(BuildContext context) {
    return TabBar(
      indicatorPadding: EdgeInsets.zero,
      indicator: BoxDecoration(
        border:
            isButtomIndicator
                ? Border(bottom: BorderSide(color: Palette.facebookBlue, width: 3))
                : Border(
                  top: BorderSide(color: Palette.facebookBlue, width: 3),
                ),
      ),
      tabs:
          icons
              .asMap()
              .map(
                (i, e) => MapEntry(
                  i,
                  Tab(
                    icon: Icon(
                      size: 30,
                      e,
                      color:
                          i == selectedIndex
                              ? Palette.facebookBlue
                              : Colors.black45,
                    ),
                  ),
                ),
              )
              .values
              .toList(),
      onTap: onTap,
    );
  }
}
