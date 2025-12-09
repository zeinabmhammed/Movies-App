import 'package:flutter/material.dart';
import '../../../../core/appColors/app_colors.dart';
import '../../../../core/responsive/responsive.dart';
import '../../../../domain/entities/onboarding_entity.dart';

class OnboardingItemWidget extends StatelessWidget {
  final OnboardingEntity entity;
  final int pageIndex;

  const OnboardingItemWidget({
    super.key,
    required this.entity,
    required this.pageIndex,
  });

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    final isBottomSheetStyle = pageIndex > 0;

    return Stack(
      children: [
        // 1. الصورة الخلفية
        Image.asset(
          entity.imagePath,
          fit: BoxFit.cover,
        ),
        // 2. المحتوى النصي والـ Bottom Sheet
        // نستخدم Align لضمان أن الحاوية تطفو في الأسفل وتأخذ حجم المحتوى فقط
       /* Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            // 💡 شرط لتحديد إذا كان Bottom Sheet أم نص عادي
            // 💡 نضيف الحواف المستديرة
            decoration: BoxDecoration(
              color: isBottomSheetStyle ? AppColors.black.withOpacity(0.95) : Colors.transparent,
              borderRadius: isBottomSheetStyle
                  ? BorderRadius.only(
                topLeft: Radius.circular(responsive.scaleWidth(24)),
                topRight: Radius.circular(responsive.scaleWidth(24)),
              )
                  : BorderRadius.zero,
            ),

            // 💡 الـ Padding يتم وضعه هنا فقط للبطاقة
            padding: EdgeInsets.symmetric(
              horizontal: responsive.scaleWidth(24),
              vertical: isBottomSheetStyle ? responsive.scaleHeight(24) : 0,
            ),

            // 💡 الـ Column يأخذ أقل ارتفاع ممكن (Shrink-Wrap)
            child: Column(
              mainAxisSize: MainAxisSize.min, // هذا يضمن أن الحاوية تأخذ حجم أبنائها فقط
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // 💡 المحتوى النصي: يظهر فوق الأزرار
                if (!isBottomSheetStyle) // نصوص الشاشة الأولى
                  SizedBox(height: responsive.scaleHeight(100)), // مسافة لرفع النص في الشاشة الأولى

                Text(
                  entity.title ?? '',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: AppColors.white,
                    fontSize: responsive.scaleWidth(28),
                    fontWeight: FontWeight.w900,
                    height: 1.1,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: responsive.scaleHeight(10)),
                Text(
                  entity.descriptionText,
                  style: TextStyle(
                    color: AppColors.white.withOpacity(0.8),
                    fontSize: responsive.scaleWidth(14),
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.center,
                ),

                // مسافة أسفل النص (لتفادي تداخل الأزرار التي هي خارج هذا الـ Widget)
                SizedBox(height: isBottomSheetStyle ? responsive.scaleHeight(60) : 0),
              ],
            ),
          ),
        ),*/
      ],
    );
  }
}