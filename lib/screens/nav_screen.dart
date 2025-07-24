import 'package:facebook_responsive_ui/data/data.dart';
import 'package:facebook_responsive_ui/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_material_design_icons/flutter_material_design_icons.dart';
import '../widgets/widgets.dart';

class NavScreen extends StatefulWidget {
  const NavScreen({super.key});

  @override
  State<NavScreen> createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  final List<Widget> _screens = [
    HomeScreen(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
  ];
  final List<IconData> _icons = [
    Icons.home,
    Icons.ondemand_video,
    MdiIcons.accountCircleOutline,
    MdiIcons.accountGroupOutline,
    MdiIcons.bellOutline,
    Icons.menu,
  ];
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return DefaultTabController(
      length: _icons.length,
      child: Scaffold(
        appBar:
            Responsive.isDesktop(context)
                ? PreferredSize(
                  preferredSize: Size(screenSize.width, 100),
                  child: CustomAppBar(
                    currentUser: currentUser,
                    icons: _icons,
                    selectedIndex: _selectedIndex,
                    onTap:
                        (index) => setState(() {
                          _selectedIndex = index;
                        }),
                  ),
                )
                : null,
        body: IndexedStack(index: _selectedIndex, children: _screens),
        bottomNavigationBar:
            !Responsive.isDesktop(context)
                ? Container(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: CustomTabBar(
                      icons: _icons,
                      selectedIndex: _selectedIndex,
                      onTap:
                          (index) => setState(() {
                            _selectedIndex = index;
                          }),
                    ),
                  ),
                )
                : SizedBox.shrink(),
      ),
    );
  }
}
