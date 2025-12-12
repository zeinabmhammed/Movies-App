import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movies_app/features/profile/presentation/widgets/profile_counter.dart';
import '../../../../core/appAssets/app_icons.dart';
import '../../../../core/commonWidgets/custom_button.dart';
import '../../../../core/resources/color_manger.dart';
import '../../../../core/resources/styles_manger.dart';
import '../../../../core/responsive/responsive.dart';

class ProfileHeaderWidget extends StatelessWidget {
  final String userName;
  final String avatarImage;
  final int watchListCount;
  final int historyCount;
  final VoidCallback onEditProfileTap;
  final VoidCallback onExitTap;
  final void Function(bool showWatchList) onTabChanged;
  final bool showWatchList;

  const ProfileHeaderWidget({
    super.key,
    required this.userName,
    required this.avatarImage,
    required this.watchListCount,
    required this.historyCount,
    required this.onEditProfileTap,
    required this.onExitTap,
    required this.onTabChanged,
    required this.showWatchList,
  });

  @override
  Widget build(BuildContext context) {
    final resp = Responsive(context);

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(resp.scaleWidth(16)),
          child: Row(
            children: [
              Column(
                children: [
                  CircleAvatar(
                    radius: resp.scaleWidth(40),
                    backgroundImage: AssetImage(avatarImage),
                  ),
                  SizedBox(height: resp.scaleHeight(8)),
                  Text(
                    userName,
                    style: s20Bold(color: ColorManager.white),
                  ),
                ],
              ),
              SizedBox(width: resp.scaleWidth(16)),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ProfileCounters(
                      watchListCount: watchListCount,
                      historyCount: historyCount,
                    ),
                    SizedBox(height: resp.scaleHeight(8)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "Watch list",
                          style: s24Bold(color: ColorManager.white),
                        ),
                        Text(
                          "History",
                          style: s24Bold(color: ColorManager.white),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: resp.scaleHeight(16)),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8,right: 4),
                  child: CustomButton(
                    text: "Edit Profile",
                    style: s20Regular(color: ColorManager.black),
                    bgColor: ColorManager.yellow,
                    height: resp.scaleHeight(56),
                    onTap: onEditProfileTap,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 8,right: 4),
                  child: CustomButton(
                    text: "Exit",
                    style: s20Regular(color: ColorManager.white),
                    bgColor: ColorManager.red,
                    height: resp.scaleHeight(56),
                    onTap: onExitTap,
                  ),
                ),
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () => onTabChanged(true),
                child: Column(
                  children: [
                    SvgPicture.asset(
                      AppIcons.watchListLogo,
                      height: resp.scaleHeight(24),
                      width: resp.scaleWidth(15.6),
                    ),
                    SizedBox(height: resp.scaleHeight(14)),
                    Text(
                      "Watch list",
                      style: s20Regular(color: ColorManager.white),
                    ),
                    Container(
                      height: resp.scaleHeight(2),
                      color: showWatchList
                          ? ColorManager.yellow
                          : Colors.transparent,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () => onTabChanged(false),
                child: Column(
                  children: [
                    SvgPicture.asset(
                      AppIcons.folder,
                      height: resp.scaleHeight(42),
                      width: resp.scaleWidth(42),
                    ),
                    SizedBox(height: resp.scaleHeight(4)),
                    Text(
                      "History",
                      style: s20Regular(color: ColorManager.white),
                    ),
                    Container(
                      height: resp.scaleHeight(2),
                      color: !showWatchList
                          ? ColorManager.yellow
                          : Colors.transparent,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
