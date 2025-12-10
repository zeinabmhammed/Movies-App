import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:movies_app/core/resources/assets_manger.dart';
import 'package:movies_app/core/resources/color_manger.dart';
import 'package:movies_app/domain/models/movie.dart';
import 'rating_badge.dart';

class TopCarousel extends StatefulWidget {
  final PageController pageController;
  final List<Movie> movies;
  final void Function(dynamic movieId) onTapMovie;

  const TopCarousel({
    super.key,
    required this.pageController,
    required this.movies,
    required this.onTapMovie,
  });

  @override
  State<TopCarousel> createState() => _TopCarouselState();
}

class _TopCarouselState extends State<TopCarousel> {
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    widget.pageController.addListener(() {
      if (widget.pageController.position.haveDimensions) {
        int next = widget.pageController.page!.round();
        if (_currentPage != next) {
          setState(() {
            _currentPage = next;
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 351 + 121 + 215,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            child: _currentPage < widget.movies.length
                ? Image.network(
                    widget.movies[_currentPage].largeCoverImage ??
                        'https://via.placeholder.com/600x400',
                    fit: BoxFit.cover,
                  )
                : Container(),
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
              child: Container(color: ColorManager.black.withOpacity(0.2)),
            ),
          ),

          Positioned(
            top: 6,
            left: 38,
            child: Image.asset(
              ImageAssets.homeBackground,
              height: 670,
              fit: BoxFit.cover,
            ),
          ),

          SizedBox(
            height: 351 + 180,
            child: PageView.builder(
              controller: widget.pageController,
              itemCount: widget.movies.length,
              pageSnapping: true,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                final movie = widget.movies[index];
                double value = 1.0;
                if (widget.pageController.position.haveDimensions) {
                  value = widget.pageController.page! - index;
                  value = (1 - (value.abs() * 0.15)).clamp(0.85, 1.1);
                }
                return Center(
                  child: GestureDetector(
                    onTap: () => widget.onTapMovie(movie.id),
                    child: Transform.scale(
                      scale: value,
                      child: Stack(
                        children: [
                          Container(
                            height: 351,
                            width: 234,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.3),
                                  blurRadius: 8,
                                  offset: const Offset(0, 5),
                                ),
                              ],
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.network(
                                movie.largeCoverImage ??
                                    'https://via.placeholder.com/234x351',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Positioned(
                            top: 10,
                            left: 10,
                            child: RatingBadge(
                              rating: movie.rating.toString(),
                              width: 65,
                              height: 32,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
