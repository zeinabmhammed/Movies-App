import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../core/resources/appAssets/app_images.dart';

class RatingBadge extends StatelessWidget {
  final String rating;
  final double width;
  final double height;
  final double fontSize;

  const RatingBadge({
    super.key,
    required this.rating,
    this.width = 65,
    this.height = 40,
    this.fontSize = 13,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.6),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          const SizedBox(width: 4),
          Expanded(
            child: Text(
              rating,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: fontSize,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          const SizedBox(width:4 ),
          SvgPicture.asset(
            SvgAssets.favoriteIcon,
            width: fontSize + 2,
            height: fontSize + 2,
          ),
        ],
      ),
    );
  }
}