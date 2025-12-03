import 'package:flutter/material.dart';
import '../../../../core/appAssets/app_images.dart';
import '../../../../core/appColors/app_colors.dart';
import '../../../../core/responsive/responsive.dart';

class AvatarPicker extends StatelessWidget {
  final Function(int) onAvatarSelected;

  const AvatarPicker({super.key, required this.onAvatarSelected});

  @override
  Widget build(BuildContext context) {
    final resp = Responsive(context);
    final avatars = AppImages.avatarMap;

    return Container(
      padding: EdgeInsets.all(resp.scaleWidth(16)),
      margin: EdgeInsets.all(resp.scaleWidth(12)),
      height: resp.scaleHeight(389),
      decoration: BoxDecoration(
        color: AppColors.grey,
        borderRadius: BorderRadius.vertical(top: Radius.circular(resp.scaleWidth(20))),
      ),
      child: GridView.builder(
        itemCount: avatars.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: resp.getGridCount(mobile: 3, tablet: 3, desktop: 3),
          crossAxisSpacing: resp.scaleWidth(12),
          mainAxisSpacing: resp.scaleHeight(12),
          childAspectRatio: 1,
        ),
        itemBuilder: (context, index) {
          final avatarId = avatars.keys.elementAt(index);
          final avatar = avatars[avatarId];
          return GestureDetector(
            onTap: () {
              onAvatarSelected(avatarId);
              Navigator.of(context).pop();
            },
            child: Container(
              padding: EdgeInsets.all(resp.scaleWidth(8)),
              decoration: BoxDecoration(
                border: Border.all(
                  color: AppColors.primary,
                  width: resp.scaleWidth(2),
                ),
                borderRadius: BorderRadius.circular(resp.scaleWidth(12)),
              ),
              child: CircleAvatar(
                radius: resp.scaleWidth(35),
                backgroundImage: AssetImage(avatar!),
              ),
            ),
          );
        },
      ),
    );
  }
}