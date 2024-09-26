import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:neoplay/core/constants/style.dart';
import 'package:neoplay/presentation/screens/Login%20and%20registration/enable_protection.dart';
import 'package:neoplay/presentation/screens/main_pages/SettingsScreen/buys_subscription.dart';
import 'package:neoplay/presentation/screens/main_pages/SettingsScreen/setting_devices.dart';
import 'package:neoplay/presentation/screens/main_pages/SettingsScreen/setting_manage_profiles.dart';
import 'package:neoplay/presentation/screens/main_pages/main_screen.dart';
import 'package:neoplay/presentation/screens/main_pages/saved_screen.dart';
import 'package:neoplay/presentation/screens/main_pages/search_screen.dart';

import 'PlayerScreen/profile_screen.dart';
import 'catalog_sceen.dart';
import 'notification_screen.dart';

class MainNavigationPage extends StatefulWidget {
  const MainNavigationPage({super.key});

  @override
  State<MainNavigationPage> createState() => _MainNavigationPageState();
}

class _MainNavigationPageState extends State<MainNavigationPage> {
  static bool isDrawerOpen = false;
  static bool settingDrawerOpen = false;
  int selectedPage = 1;
  int settingSelectedPage = 0;
  int _focusedDrawerItem = 0;
  int _focusedCategoryItem = 0;
  int _focusedSettingItem = 0;

  static final FocusNode drawerFocusNode = FocusNode();
  final FocusNode contentFocusNode = FocusNode();
  final FocusNode filterFocusNode = FocusNode();
  final FocusNode SettingFocusNode = FocusNode();

  void toggleDrawer() {
    setState(() {
      isDrawerOpen = !isDrawerOpen;
      if (isDrawerOpen) {
        drawerFocusNode.requestFocus();
      } else {
        contentFocusNode.requestFocus();
      }
    });
  }

  void _selectPage(int index) {
    setState(() {
      selectedPage = index;
      isDrawerOpen = false;
    });
    contentFocusNode.requestFocus();
  }

  void _settingSelectPage(int index) {
    setState(() {
      settingSelectedPage = index;
      isDrawerOpen = false;
    });
    contentFocusNode.requestFocus();
  }

  bool openText = false;

  @override
  Widget build(BuildContext context) {
    Widget body = const ProfileScreen();

    if (selectedPage == 6) {
      switch (settingSelectedPage) {
        case 0:
          body = SettingManageProfiles();
          break;
        case 1:
          body = EnableProtection();
          break;
        case 2:
          body = const BuysSubscription();
          break;
        case 3:
          body = const SettingDevices();
          break;
      }
    }

    switch (selectedPage) {
      case 0:
        body = SearchScreen();
        break;
      case 1:
        body = MainScreen();
        break;
      case 2:
        body = const CatalogScreen();
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
    }

    return Scaffold(
      backgroundColor: Colors.black,
      body: Shortcuts(
        shortcuts: <LogicalKeySet, Intent>{
          LogicalKeySet(LogicalKeyboardKey.arrowUp):
              const _MoveIntent(Direction.up),
          LogicalKeySet(LogicalKeyboardKey.arrowDown):
              const _MoveIntent(Direction.down),
          LogicalKeySet(LogicalKeyboardKey.arrowLeft):
              const _MoveIntent(Direction.left),
          LogicalKeySet(LogicalKeyboardKey.arrowRight):
              const _MoveIntent(Direction.right),
          LogicalKeySet(LogicalKeyboardKey.select): const _ActivateIntent(),
        },
        child: Actions(
          actions: <Type, Action<Intent>>{
            _MoveIntent: CallbackAction<_MoveIntent>(
              onInvoke: (intent) => _handleMove(intent.direction),
            ),
            _ActivateIntent: CallbackAction<_ActivateIntent>(
              onInvoke: (intent) => _handleActivate(),
            ),
          },
          child: FocusScope(
            autofocus: true,
            child: Stack(
              children: [
                // Main content
                Positioned.fill(
                  child: Focus(
                    focusNode: contentFocusNode,
                    child: Column(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: 162.w,
                            ),
                            child: body,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // Drawer
                Positioned(
                  left: 0,
                  top: 0,
                  bottom: 0,
                  child: AnimatedContainer(
                    onEnd: () {
                      setState(() {
                        const Duration(milliseconds: 500);
                        openText = isDrawerOpen;
                      });
                    },
                    duration: const Duration(milliseconds: 300),
                    height: 1080.h,
                    padding: EdgeInsets.symmetric(
                        vertical: 80.h, horizontal: isDrawerOpen ? 17.w : 12.w),
                    decoration: BoxDecoration(
                      color: const Color(0xFF1C1C1E),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(60.r),
                        bottomRight: Radius.circular(60.r),
                      ),
                    ),
                    child: Focus(
                      focusNode: drawerFocusNode,
                      child: GestureDetector(
                        onTap: toggleDrawer,
                        child: Row(
                          children: [
                            // Gap between items
                            SizedBox(
                              width: isDrawerOpen ? 240.w : 90.w,
                              child: ListView.builder(
                                padding: EdgeInsets.zero,
                                itemCount: 7,
                                itemBuilder: (context, index) {
                                  return _buildDrawerItem(
                                    icon: _getDrawerIcon(index),
                                    text: _getDrawerText(index),
                                    isOpen: isDrawerOpen,
                                    isSelected: selectedPage == index,
                                    onTap: () => _selectPage(index),
                                    isFocused: _focusedDrawerItem == index,
                                  );
                                },
                              ),
                            ),
                            // Category section for "Catalog"
                            selectedPage == 2 && !contentFocusNode.hasFocus
                                ? Row(
                                    children: [
                                      41.horizontalSpace,
                                      SizedBox(
                                        width: 300.w,
                                        child: Focus(
                                          focusNode: filterFocusNode,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Kategoriyalar",
                                                style: CustomTextStyle.style500
                                                    .copyWith(
                                                        fontSize: 28.sp,
                                                        color: Colors.white),
                                              ),
                                              32.verticalSpace,
                                              Expanded(
                                                child: ListView.builder(
                                                  itemCount: 5,
                                                  itemBuilder:
                                                      (context, index) {
                                                    return _buildCategoryItem(
                                                      text: _getCategoryText(
                                                          index),
                                                      isFocused:
                                                          _focusedCategoryItem ==
                                                              index,
                                                      onTap: () {
                                                        setState(() {
                                                          _focusedCategoryItem =
                                                              index;
                                                        });
                                                      },
                                                    );
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                : selectedPage == 6 && settingDrawerOpen == true
                                    ? Row(
                                        children: [
                                          41.horizontalSpace,
                                          SizedBox(
                                            width: 300.w,
                                            child: Focus(
                                              focusNode: SettingFocusNode,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Sozlamalar",
                                                    style: CustomTextStyle
                                                        .style500
                                                        .copyWith(
                                                            fontSize: 28.sp,
                                                            color:
                                                                Colors.white),
                                                  ),
                                                  32.verticalSpace,
                                                  Expanded(
                                                    child: ListView.builder(
                                                      itemCount: 4,
                                                      itemBuilder:
                                                          (context, index) {
                                                        return _buildSittingItem(
                                                          text: _getSettingText(
                                                              index),
                                                          isFocused:
                                                              _focusedSettingItem ==
                                                                  index,
                                                          onTap: () {
                                                            setState(() {
                                                              _focusedSettingItem =
                                                                  index;
                                                              _settingSelectPage(
                                                                  _focusedSettingItem);
                                                            });
                                                          },
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                                    : Container(),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  IconData _getDrawerIcon(int index) {
    switch (index) {
      case 0:
        return Icons.search;
      case 1:
        return Icons.home;
      case 2:
        return Icons.category;
      case 3:
        return Icons.save;
      case 4:
        return Icons.notifications;
      case 5:
        return Icons.person;
      case 6:
        return Icons.settings;
      default:
        return Icons.home;
    }
  }

  String _getDrawerText(int index) {
    switch (index) {
      case 0:
        return 'Izlash';
      case 1:
        return 'Asosiy';
      case 2:
        return 'Katalog';
      case 3:
        return 'Saqlangan';
      case 4:
        return 'Bildirishnoma';
      case 5:
        return 'Profile';
      case 6:
        return 'Sozlamalar';
      default:
        return 'Asosiy';
    }
  }

  String _getCategoryText(int index) {
    // Add category names here
    switch (index) {
      case 0:
        return 'Barchasi';
      case 1:
        return 'Filmlar';
      case 2:
        return 'Seriallar';
      case 3:
        return 'Multfilmlar';
      case 4:
        return 'Animelar';

      default:
        return 'Barchasi';
    }
  }

  String _getSettingText(int index) {
    // Add category names here
    switch (index) {
      case 0:
        return 'Profillarni boshqarish';
      case 1:
        return 'FilmPin kod o’rnatishlar';
      case 2:
        return 'Obuna sotib olish';
      case 3:
        return 'Qurilmalar';

      default:
        return 'Profillarni boshqarish';
    }
  }

  Widget _buildDrawerItem({
    required IconData icon,
    required String text,
    required bool isOpen,
    required bool isSelected,
    required bool isFocused,
    required Function() onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: isOpen ? 15.w : 0),
        height: 60.h,
        decoration: BoxDecoration(
          color: isSelected & isOpen
              ? Colors.red.shade600
              : isFocused
                  ? Colors.grey.shade800
                  : Colors.transparent,
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
            if (openText && isOpen) ...[
              Flexible(
                child: Wrap(
                  children: [
                    SizedBox(width: 17.w),
                    Text(
                      text,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.sp,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ]
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryItem({
    required String text,
    required bool isFocused,
    required Function() onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 32.w),
        height: 60.h,
        decoration: BoxDecoration(
          color: isFocused && filterFocusNode.hasFocus
              ? Colors.red.shade600
              : Colors.transparent,
          borderRadius: BorderRadius.circular(50.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              text,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.sp,
              ),
            ),
            isFocused
                ? SvgPicture.asset(
                    "assets/images/check.svg",
                    width: 24.w,
                  )
                : SizedBox(),
          ],
        ),
      ),
    );
  }

  Widget _buildSittingItem({
    required String text,
    required bool isFocused,
    required Function() onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 32.w),
        alignment: Alignment.centerLeft,
        height: 60.h,
        decoration: BoxDecoration(
          color: isFocused && SettingFocusNode.hasFocus
              ? Colors.red.shade600
              : Colors.transparent,
          borderRadius: BorderRadius.circular(50.r),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.sp,
          ),
        ),
      ),
    );
  }

  void _handleMove(Direction direction) {
    if (direction == Direction.left) {
      if (settingDrawerOpen == false && selectedPage == 6) {
        setState(() {
          settingDrawerOpen = true;
          _focusedSettingItem = settingSelectedPage;
        });
      } else if (!isDrawerOpen) {
        setState(() {
          isDrawerOpen = true;
          _focusedDrawerItem = selectedPage;
        });
      }

      if (filterFocusNode.hasFocus || SettingFocusNode.hasFocus) {
        setState(() {
          drawerFocusNode.requestFocus();
        });
      }
      drawerFocusNode.requestFocus();
    } else if (direction == Direction.up) {
      setState(() {
        if (filterFocusNode.hasFocus && _focusedCategoryItem > 0) {
          _focusedCategoryItem = _focusedCategoryItem - 1;
        } else if (SettingFocusNode.hasFocus && _focusedSettingItem > 0) {
          _focusedSettingItem = _focusedSettingItem - 1;
        } else if (isDrawerOpen) {
          _focusedDrawerItem = (_focusedDrawerItem > 0)
              ? _focusedDrawerItem - 1
              : _focusedDrawerItem;
        }
      });
    } else if (direction == Direction.down) {
      setState(() {
        if (filterFocusNode.hasFocus && _focusedCategoryItem < 4) {
          _focusedCategoryItem = _focusedCategoryItem + 1;
        } else if (SettingFocusNode.hasFocus && _focusedSettingItem < 3) {
          _focusedSettingItem = _focusedSettingItem + 1;
        } else if (isDrawerOpen) {
          _focusedDrawerItem = (_focusedDrawerItem < 6)
              ? _focusedDrawerItem + 1
              : _focusedDrawerItem;
        }
      });
    } else if (direction == Direction.right) {
      if (selectedPage == 2) {
        setState(() {
          filterFocusNode.requestFocus();
        });
      } else if (selectedPage == 6) {
        setState(() {
          SettingFocusNode.requestFocus();
        });
      } else if (isDrawerOpen) {
        toggleDrawer();
        contentFocusNode.requestFocus();
      }
    }
  }

  void _handleActivate() {
    if (isDrawerOpen && _focusedDrawerItem != 2 && _focusedDrawerItem != 6) {
      _selectPage(_focusedDrawerItem);
    } else if (_focusedDrawerItem == 2) {
      setState(() {
        selectedPage = 2;
        isDrawerOpen = false;
        filterFocusNode.requestFocus();
      });
    } else if (isDrawerOpen = true && _focusedDrawerItem == 6) {
      setState(() {
        selectedPage = 6;
        isDrawerOpen = false;
        settingDrawerOpen = true;
        SettingFocusNode.requestFocus();
      });
    }
    if (SettingFocusNode.hasFocus) {
      setState(() {
        _settingSelectPage(_focusedSettingItem);
        settingDrawerOpen = false;
      });
    }
  }
}

enum Direction { up, down, left, right }

class _MoveIntent extends Intent {
  const _MoveIntent(this.direction);

  final Direction direction;
}

class _ActivateIntent extends Intent {
  const _ActivateIntent();
}
