import 'package:flutter/material.dart';
import '../responsive/responsive.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color? textColor;
  final Color? bgColor;
  final Color? borderColor;
  final TextStyle? style;

  final VoidCallback onTap;
  final double width;
  final double height;
  final double borderRadius;
  final Widget? leadingIcon;
  final Widget? leadingIcons;

  const CustomButton({
    super.key,
    this.width = 398,
    this.height = 55.72,
    required this.text,
    this.textColor,
    this.bgColor,
    this.style,
    required this.onTap,
    this.borderColor,
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (leadingIcon != null) leadingIcon!,
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
