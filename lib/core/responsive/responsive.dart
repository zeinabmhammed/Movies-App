import 'package:flutter/material.dart';

class Responsive {
  final BuildContext context;
  Responsive(this.context);

  double get width => MediaQuery.of(context).size.width;
  double get height => MediaQuery.of(context).size.height;

  bool get isMobile => width < 600;
  bool get isTablet => width >= 600 && width < 1024;
  bool get isDesktop => width >= 1024;

  double scaleWidth(double value) {
    if (isMobile) return value;
    if (isTablet) return value * 1.5;
    if (isDesktop) return value * 2;
    return value;
  }

  double scaleHeight(double value) {
    if (isMobile) return value;
    if (isTablet) return value * 1.5;
    if (isDesktop) return value * 2;
    return value;
  }

  int getGridCount({int mobile = 2, int tablet = 3, int desktop = 4}) {
    if (isMobile) return mobile;
    if (isTablet) return tablet;
    return desktop;
  }

  double scaledMovieCardWidth(double baseWidth) {
    if (isMobile) return baseWidth;
    if (isTablet) return baseWidth * 1.4;
    return baseWidth * 1.8;
  }

  double scaledMovieCardHeight(double baseHeight) {
    if (isMobile) return baseHeight;
    if (isTablet) return baseHeight * 1.4;
    return baseHeight * 1.8;
  }

  double gridAspectRatio() {
    double baseRatio = 191 / 279;

    if (isMobile) return baseRatio * 0.95;
    if (isTablet) return baseRatio * 1.05;
    return baseRatio * 1.15;
  }
}