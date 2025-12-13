import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movies_app/core/resources/color_manger.dart';

import '../../../../core/resources/appAssets/app_images.dart';


class RatingSection extends StatelessWidget {
  final double rating;
  final int likeCount;
  final double watchLaterCount;

  const RatingSection({
    super.key,
    required this.rating,
    required this.likeCount,
    required this.watchLaterCount,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildRatingChip(SvgAssets.heartIcon, likeCount.toStringAsFixed(0)),
        _buildRatingChip(
          SvgAssets.watchLaterIcon,
          watchLaterCount.toStringAsFixed(0),
        ),
        _buildRatingChip(SvgAssets.favoriteIcon, rating.toString()),
      ],
    );
  }

  Widget _buildRatingChip(String svgPath, String label) {
    return Container(
      width: 115,
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: ColorManager.grey,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(svgPath, width: 20, height: 20),
          const SizedBox(width: 10),
          Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}
