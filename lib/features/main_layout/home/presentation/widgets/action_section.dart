import 'package:flutter/material.dart';
import 'package:movies_app/core/resources/color_manger.dart';

class ActionSection extends StatelessWidget {
  final String title;
  final VoidCallback? onSeeMore;

  const ActionSection({
    super.key,
    required this.title,
    this.onSeeMore,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              color: ColorManager.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          InkWell(
            onTap: onSeeMore,
            child: Row(
              children: [
                Text(
                  'See More',
                  style: TextStyle(
                    color: ColorManager.yellow,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(width: 4),
                Icon(
                  Icons.arrow_forward_outlined,
                  size: 16,
                  color: ColorManager.yellow,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
