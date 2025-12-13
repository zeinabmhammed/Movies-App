import 'package:flutter/material.dart';
import 'package:movies_app/core/resources/color_manger.dart';

class ScreenshotsSection extends StatelessWidget {
  final List<String> screenShots;

  const ScreenshotsSection({super.key, required this.screenShots});

  @override
  Widget build(BuildContext context) {
    if (screenShots.isEmpty) return const SizedBox();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Screen Shots",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: ColorManager.white,
          ),
        ),
        const SizedBox(height: 17),
        ...screenShots.map((shot) {
          int index = screenShots.indexOf(shot);
          return Container(
            height: 167,
            width: double.infinity,
            margin: EdgeInsets.only(
              bottom: index != screenShots.length - 1 ? 9 : 0,
            ),
            decoration: BoxDecoration(
              color: Colors.grey[700],
              borderRadius: BorderRadius.circular(16),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                shot,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Center(
                    child: Text(
                      "Image not available",
                      style: TextStyle(color: ColorManager.white),
                    ),
                  );
                },
              ),
            ),
          );
        }),
      ],
    );
  }
}
