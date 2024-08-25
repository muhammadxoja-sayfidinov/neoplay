import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainNavigationPage extends StatefulWidget {
  const MainNavigationPage({super.key});

  @override
  State<MainNavigationPage> createState() => _MainNavigationPageState();
}

class _MainNavigationPageState extends State<MainNavigationPage> {
  bool isDrawerOpen = false; // Start with the drawer closed
  String selectedPage = 'Asosiy'; // Default selected page

  void toggleDrawer() {
    setState(() {
      isDrawerOpen = !isDrawerOpen;
    });
  }

  void navigateToPage(String page) {
    setState(() {
      selectedPage = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(

        children: [
          // Main content
          Positioned.fill(
            child: Column(
              children: [

                Expanded(child: _buildPageContent()),
              ],
            ),
          ),
          // Drawer
          Positioned(
            left: 0,
            top: 0,
            bottom: 0,
            child: AnimatedContainer(
              duration: Duration(milliseconds: 300),
              width: isDrawerOpen ? 240.w : 90.w, // Fixed width based on state
              height: 1080.h, // Fixed height using ScreenUtil
              padding: EdgeInsets.symmetric(vertical: 80.h, horizontal: isDrawerOpen ? 17.w : 12.w), // Adjusted padding based on state
              decoration: BoxDecoration(
                color: Color(0xFF1C1C1E),
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
                            icon: Icons.home,
                            text: 'Asosiy',
                            isOpen: isDrawerOpen,
                            isSelected: selectedPage == 'Asosiy',
                            onTap: () => navigateToPage('Asosiy'),
                          ),
                          _buildDrawerItem(
                            icon: Icons.search,
                            text: 'Izlash',
                            isOpen: isDrawerOpen,
                            isSelected: selectedPage == 'Izlash',
                            onTap: () => navigateToPage('Izlash'),
                          ),
                          _buildDrawerItem(
                            icon: Icons.bookmark,
                            text: 'Saqlangan',
                            isOpen: isDrawerOpen,
                            isSelected: selectedPage == 'Saqlangan',
                            onTap: () => navigateToPage('Saqlangan'),
                          ),
                          _buildDrawerItem(
                            icon: Icons.notifications,
                            text: 'Bildirishnoma',
                            isOpen: isDrawerOpen,
                            isSelected: selectedPage == 'Bildirishnoma',
                            onTap: () => navigateToPage('Bildirishnoma'),
                          ),
                          _buildDrawerItem(
                            icon: Icons.person,
                            text: 'Profil',
                            isOpen: isDrawerOpen,
                            isSelected: selectedPage == 'Profil',
                            onTap: () => navigateToPage('Profil'),
                          ),
                          _buildDrawerItem(
                            icon: Icons.settings,
                            text: 'Sozlamalar',
                            isOpen: isDrawerOpen,
                            isSelected: selectedPage == 'Sozlamalar',
                            onTap: () => navigateToPage('Sozlamalar'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ),
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
    return Container(
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: isOpen ? 17.w : 0),
          height: 60.h, // Fixed height for each item to match the design
          decoration: BoxDecoration(
            color: isSelected & isOpen ? Colors.red.shade600 : Colors.transparent,
            border: isSelected
                ? Border(left: BorderSide(width: 5.w , color: Colors.red))
                : null,
            borderRadius: BorderRadius.horizontal(
              left: Radius.circular(20.r),
              right: Radius.circular(20.r),
            ),
          ),
          child: Row(
            mainAxisAlignment: isOpen ? MainAxisAlignment.start : MainAxisAlignment.center,
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
      ),
    );
  }

  Widget _buildPageContent() {
    return Center(
      child: Text(
        selectedPage,
        style: TextStyle(fontSize: 32.sp),
      ),
    );
  }
}
