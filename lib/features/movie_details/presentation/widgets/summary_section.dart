import 'package:flutter/material.dart';
import 'package:movies_app/core/resources/color_manger.dart';

class SummarySection extends StatelessWidget {
  final String descriptionFull;
  final String summary;
  final String descriptionIntro;

  const SummarySection({
    super.key,
    required this.descriptionFull,
    required this.summary,
     required this.descriptionIntro,
  });

  @override
  Widget build(BuildContext context) {
    final String textToShow = descriptionFull.isNotEmpty
        ? descriptionFull
        : (summary.isNotEmpty == true
        ? summary
        : (descriptionIntro));

    if (textToShow.isEmpty) return const Placeholder();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Summary",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: ColorManager.white,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          textToShow,
          style: const TextStyle(
            fontSize: 16,
            height: 1.5,
            color: Colors.white70,
          ),
        ),
      ],
    );
  }
}
