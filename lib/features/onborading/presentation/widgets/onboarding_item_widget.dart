import 'package:flutter/material.dart';
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

    return Stack(
      children: [
        Image.asset(
          entity.imagePath,
          fit: BoxFit.cover,
        ),
      ],
    );
  }
}