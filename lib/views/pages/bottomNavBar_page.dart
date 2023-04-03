import 'package:e_commerce/controllers/auth_controller.dart';
import 'package:e_commerce/services/auth_service.dart';
import 'package:e_commerce/views/pages/home_page.dart';
import 'package:e_commerce/views/pages/profile_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:provider/provider.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {

  
  final PersistentTabController  _persistentTabController = PersistentTabController(initialIndex: 0);
  
  List<Widget> _buildScreens() {
        return [
          HomePage(),
          Container(),
          Container(),
          Container(),
          const Profile(),
        ];
    }
    
    List<PersistentBottomNavBarItem> _navBarsItems() {
      final  theme = Theme.of(context) ;
        return [
            PersistentBottomNavBarItem(
                icon: Icon(CupertinoIcons.home),
                title: ("Home"),
                activeColorPrimary: theme.primaryColor,
                inactiveColorPrimary: CupertinoColors.systemGrey,
            ),
            PersistentBottomNavBarItem(
                icon: Icon(CupertinoIcons.bag),
                title: ("Shop"),
                activeColorPrimary: theme.primaryColor,
                inactiveColorPrimary: CupertinoColors.systemGrey,
            ),
            PersistentBottomNavBarItem(
                icon: Icon(CupertinoIcons.cart),
                title: ("Cart"),
                activeColorPrimary: theme.primaryColor,
                inactiveColorPrimary: CupertinoColors.systemGrey,
            ),
            PersistentBottomNavBarItem(
                icon: Icon(CupertinoIcons.square_favorites),
                title: ("Favorite"),
                activeColorPrimary: theme.primaryColor,
                inactiveColorPrimary: CupertinoColors.systemGrey,
            ),
            PersistentBottomNavBarItem(
                icon: const Icon(CupertinoIcons.profile_circled),
                title: ("Profile"),
                activeColorPrimary: theme.primaryColor,
                inactiveColorPrimary: CupertinoColors.systemGrey,
            ),
        ];
    }
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: PersistentTabView(
          context,
          controller: _persistentTabController,
          screens: _buildScreens(),
          items: _navBarsItems(),
          confineInSafeArea: true,
          backgroundColor: Colors.white, // Default is Colors.white.
          handleAndroidBackButtonPress: true, // Default is true.
          resizeToAvoidBottomInset: true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
          stateManagement: true, // Default is true.
          hideNavigationBarWhenKeyboardShows: true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
          decoration: NavBarDecoration(
            borderRadius: BorderRadius.circular(10.0),
            colorBehindNavBar: Colors.white,
          ),
          popAllScreensOnTapOfSelectedTab: true,
          popActionScreens: PopActionScreensType.all,
          itemAnimationProperties: ItemAnimationProperties( // Navigation Bar's items animation properties.
            duration: Duration(milliseconds: 200),
            curve: Curves.ease,
          ),
          screenTransitionAnimation: ScreenTransitionAnimation( // Screen transition animation on change of selected tab.
            animateTabTransition: true,
            curve: Curves.ease,
            duration: Duration(milliseconds: 200),
          ),
          navBarStyle: NavBarStyle.style1, // Choose the nav bar style with this property.
      ),
    );
  }
}
