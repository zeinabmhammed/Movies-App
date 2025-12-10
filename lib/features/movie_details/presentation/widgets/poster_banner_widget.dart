import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movies_app/core/resources/assets_manger.dart';
import 'package:movies_app/core/resources/color_manger.dart';
import 'package:movies_app/core/widget/custom_elevated_button.dart';
import 'package:movies_app/features/movie_details/presentation/widgets/rating_section.dart';
import 'package:movies_app/domain/models/movie_details.dart';

class PosterBanner extends StatelessWidget {
  final MovieDetails movie;

  const PosterBanner({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          width: double.infinity,
          height: 790,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(movie.largeCoverImage),
              fit: BoxFit.cover,
            ),
          ),
        ),

        Positioned.fill(
          child: Container(
            padding: const EdgeInsets.fromLTRB(20, 40, 20, 10),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.black54, Colors.transparent, Colors.black],
                stops: [0.0, 0.5, 1.0],
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                        size: 35,
                      ),
                      onPressed: () => Navigator.pop(context),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.bookmark_border_sharp,
                        color: Colors.white,
                        size: 35,
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                        child: SvgPicture.asset(
                          SvgAssets.playIcon,
                          width: 97,
                          height: 97,
                        ),
                      ),
                      SizedBox(height: 175),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            movie.title,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            movie.year.toString(),
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.white54,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 8),

                      CustomElevatedButton(
                        text: 'Watch',
                        color: ColorManager.red,
                        onPressed: () {},
                      ),
                      const SizedBox(height: 16),

                      RatingSection(
                        rating: movie.rating,
                        likeCount: movie.likeCount,
                        watchLaterCount: movie.watchLaterCount,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
