import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neoplay/presentation/screens/main_pages/main_screen.dart';
import 'package:neoplay/presentation/screens/main_pages/profile_screen.dart';
import 'package:neoplay/presentation/screens/main_pages/saved_screen.dart';
import 'package:neoplay/presentation/screens/main_pages/search_screen.dart';
import 'package:neoplay/presentation/screens/main_pages/setting_screen.dart';

import 'catalog_sceen.dart';
import 'notification_screen.dart';

class MainNavigationPage extends StatefulWidget {
  const MainNavigationPage({super.key});

  @override
  State<MainNavigationPage> createState() => _MainNavigationPageState();
}

class _MainNavigationPageState extends State<MainNavigationPage> {
  bool isDrawerOpen = false; // Start with the drawer closed
  int selectedPage = 1; // Default selected page

  void toggleDrawer() {
    setState(() {
      isDrawerOpen = !isDrawerOpen;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget body = const ProfileScreen();
    switch (selectedPage) {
      case 0:
        body = SearchScreen();
        break;
      case 1:
        body = MainScreen();
        break;
      case 2:
        body = const CatalogSceen();
        break;
      case 3:
        body = const SavedScreen();
        break;
      case 4:
        body = const NotificationScreen();
        break;
      case 5:
        body = const ProfileScreen();
        break;
      case 6:
        body = const SettingScreen();
        break;
    }
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Main content
          Positioned.fill(
            child: Column(
              children: [
                Expanded(
                    child: Padding(
                  padding: EdgeInsets.only(left: 162.w, right: 85.w),
                  child: body,
                )),
              ],
            ),
          ),
          // Drawer
          Positioned(
            left: 0,
            top: 0,
            bottom: 0,
            child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                width:
                    isDrawerOpen ? 240.w : 90.w, // Fixed width based on state
                height: 1080.h, // Fixed height using ScreenUtil
                padding: EdgeInsets.symmetric(
                    vertical: 80.h,
                    horizontal: isDrawerOpen
                        ? 17.w
                        : 12.w), // Adjusted padding based on state
                decoration: BoxDecoration(
                  color: const Color(0xFF1C1C1E),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(60.r),
                    bottomRight: Radius.circular(60.r),
                  ),
                ),
                child: GestureDetector(
                  onTap: toggleDrawer,
                  child: Column(
                    children: [
                      // Gap between items
                      Expanded(
                        child: ListView(
                          padding: EdgeInsets.zero,
                          children: [
                            _buildDrawerItem(
                              icon: Icons.search,
                              text: 'Izlash',
                              isOpen: isDrawerOpen,
                              isSelected: selectedPage == 0,
                              onTap: () => setState(() => selectedPage = 0),
                            ),
                            _buildDrawerItem(
                              icon: Icons.home,
                              text: 'Asosiy',
                              isOpen: isDrawerOpen,
                              isSelected: selectedPage == 1,
                              onTap: () => setState(() => selectedPage = 1),
                            ),
                            _buildDrawerItem(
                              icon: Icons.category,
                              text: 'Katalog',
                              isOpen: isDrawerOpen,
                              isSelected: selectedPage == 2,
                              onTap: () => setState(() => selectedPage = 2),
                            ),
                            _buildDrawerItem(
                              icon: Icons.save,
                              text: 'Saqlangan',
                              isOpen: isDrawerOpen,
                              isSelected: selectedPage == 3,
                              onTap: () => setState(() => selectedPage = 3),
                            ),
                            _buildDrawerItem(
                              icon: Icons.notifications,
                              text: 'Bildirishnoma',
                              isOpen: isDrawerOpen,
                              isSelected: selectedPage == 4,
                              onTap: () => setState(() => selectedPage = 4),
                            ),
                            _buildDrawerItem(
                              icon: Icons.person,
                              text: 'Profile',
                              isOpen: isDrawerOpen,
                              isSelected: selectedPage == 5,
                              onTap: () => setState(() => selectedPage = 5),
                            ),
                            _buildDrawerItem(
                              icon: Icons.settings,
                              text: 'Sozlamalar',
                              isOpen: isDrawerOpen,
                              isSelected: selectedPage == 6,
                              onTap: () => setState(() => selectedPage = 6),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )),
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerItem({
    required IconData icon,
    required String text,
    required bool isOpen,
    required bool isSelected,
    required Function() onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: isOpen ? 17.w : 0),
        height: 60.h, // Fixed height for each item to match the design
        decoration: BoxDecoration(
          color: isSelected & isOpen ? Colors.red.shade600 : Colors.transparent,
          border: isSelected
              ? Border(left: BorderSide(width: 5.w, color: Colors.red))
              : null,
          borderRadius: BorderRadius.horizontal(
            left: Radius.circular(20.r),
            right: Radius.circular(20.r),
          ),
        ),
        child: Row(
          mainAxisAlignment:
              isOpen ? MainAxisAlignment.start : MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.white, size: 30.sp),
            if (isOpen) ...[
              SizedBox(width: 17.w), // Adjust space between icon and text
              Text(
                text,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.sp,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
