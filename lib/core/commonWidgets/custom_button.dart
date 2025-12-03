import 'package:flutter/material.dart';
import '../responsive/responsive.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final Color bgcolor;
  final VoidCallback onTap;
  final double width;
  final double height;

  const CustomButton({
    super.key,
    this.width = 398,
    this.height = 55.72,
    required this.text,
    this.style,
    required this.bgcolor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: responsive.scaleWidth(width),
        height: responsive.scaleHeight(height),
        margin: const EdgeInsets.symmetric(horizontal: 12),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: bgcolor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(
          text,
          style: style,
        ),
      ),
    );
  }
}