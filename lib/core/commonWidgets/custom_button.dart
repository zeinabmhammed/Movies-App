import 'package:flutter/material.dart';
import '../responsive/responsive.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color textColor;
  final Color bgColor;
  final Color? borderColor; // ✨ اللون للحواف
  final VoidCallback onTap;
  final double width;
  final double height;
  final double borderRadius;
  final Widget? leadingIcon;
  final Widget? leadingIcons;


  const CustomButton({
    super.key,
    required this.text,
    required this.textColor,
    required this.bgColor,
    required this.onTap,
    this.borderColor,
    this.width = 389, // ✨ زودت الحجم شوية
    this.height = 55.72, // ✨ زودت الحجم شوية
    this.borderRadius = 16,
    this.leadingIcon,
    this.leadingIcons,

  });

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);

    return GestureDetector(
        onTap: onTap,
        child: Container(
            width: responsive.scaleWidth(width),
            height: responsive.scaleHeight(height),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(borderRadius),
              border: borderColor != null
                  ? Border.all(color: borderColor!, width: 2)
                  : null,
            ),
            child:
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if(leadingIcon != null) leadingIcon!,
                Text(
                  text,
                  style: TextStyle(
                    color: textColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            ),
        );
    }
}
