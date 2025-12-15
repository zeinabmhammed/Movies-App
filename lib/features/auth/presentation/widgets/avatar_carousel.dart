import 'dart:math';
import 'package:flutter/material.dart';

class AvatarCarousel extends StatefulWidget {
  final List<String> images;
  final double height;
  final double viewportFraction;
  final Function(int)? onAvatarSelected;
  final int initialIndex;

  const AvatarCarousel({
    super.key,
    required this.images,
    this.height = 150,
    this.viewportFraction = 0.35,
    this.initialIndex = 0,
    this.onAvatarSelected,
  });

  @override
  State<AvatarCarousel> createState() => _AvatarCarouselState();
}

class _AvatarCarouselState extends State<AvatarCarousel> {
  late final PageController _controller;
  late final ValueNotifier<double> _pageNotifier;

  // late List<String> _carouselImages;

  @override
  void initState() {
    super.initState();

    final int initialPage = (widget.images.length * 1000) + widget.initialIndex;

    _controller = PageController(
      viewportFraction: widget.viewportFraction,
      initialPage: initialPage,
    );

    _pageNotifier = ValueNotifier<double>(initialPage.toDouble());

    _controller.addListener(() {
      _pageNotifier.value = _controller.page ?? initialPage.toDouble();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _pageNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      child: PageView.builder(
        controller: _controller,
        scrollDirection: Axis.horizontal,

        itemBuilder: (context, index) {
          final int actualIndex = index % widget.images.length;

          return ValueListenableBuilder<double>(
            valueListenable: _pageNotifier,
            builder: (context, page, _) {
              final double value = page - index;

              final double scale = (1 - (value.abs() * 0.4)).clamp(0.6, 1.0);

              final double opacity = (1 - (value.abs() * 0.5)).clamp(0.2, 1.0);

              return Center(
                child: Opacity(
                  opacity: opacity,
                  child: Transform.scale(
                    scale: scale,
                    child: GestureDetector(
                      onTap: () {
                        _controller.animateToPage(
                          index,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                        widget.onAvatarSelected?.call(actualIndex);
                      },
                      child: CircleAvatar(
                        radius: widget.height * 0.55,
                        backgroundImage: AssetImage(widget.images[actualIndex]),
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

