import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movies_app/core/resources/color_manger.dart';
import 'package:movies_app/core/screens_wrapper/screens_wrapper.dart';
import 'package:movies_app/features/main_layout/home/presentation/screens/home_screen.dart';

import '../../core/resources/appAssets/app_images.dart';


class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const HomeScreen(),
    const MovieSearchWrapper(),
    const MovieBrowseWrapper(),
    const ProfileWrapper(),
  ];

  @override
  Widget build(BuildContext context) {
    const double blurSigma = 12.0;
    final Color barColor = ColorManager.grey;
    return Scaffold(
      extendBody: true,
      body: Stack(
        children: [
          Container(decoration: BoxDecoration(color: ColorManager.black)),
          IndexedStack(index: _currentIndex, children: _pages),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: blurSigma,
                    sigmaY: blurSigma,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: barColor,
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(
                        color: ColorManager.white.withOpacity(0.08),
                        width: 1,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: ColorManager.black.withOpacity(0.2),
                          blurRadius: 8,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 6,
                    ),
                    child: SizedBox(
                      height: 61,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _buildNavItem(
                            index: 0,
                            icon: SvgAssets.home,
                            selectedIcon: SvgAssets.homeSelected,
                          ),
                          _buildNavItem(
                            index: 1,
                            icon: SvgAssets.search,
                            selectedIcon: SvgAssets.searchSelected,
                          ),
                          _buildNavItem(
                            index: 2,
                            icon: SvgAssets.explore,
                            selectedIcon: SvgAssets.exploreSelected,
                          ),
                          _buildNavItem(
                            index: 3,
                            icon: SvgAssets.profile,
                            selectedIcon: SvgAssets.profileSelected,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem({
    required int index,
    required String icon,
    required String selectedIcon,
  }) {
    final bool isSelected = _currentIndex == index;

    return GestureDetector(
      onTap: () => setState(() => _currentIndex = index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            isSelected ? selectedIcon : icon,
            width: 26,
            height: 26,
            colorFilter: ColorFilter.mode(
              isSelected ? ColorManager.yellow : ColorManager.white,
              BlendMode.srcIn,
            ),
          ),
          const SizedBox(height: 5),
        ],
      ),
    );
  }
}
