import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movies_app/core/resources/color_manger.dart';
import 'package:movies_app/features/movie_details/presentation/widgets/rating_section.dart';
import 'package:movies_app/domain/models/movie_details.dart';

import '../../../../core/resources/appAssets/app_images.dart';
import '../../../../core/resources/commonWidgets/custom_elevated_button.dart';
import '../../../main_layout/profile/presentation/bloc/watchList/watch_list_bloc.dart';
import '../../../main_layout/profile/presentation/bloc/watchList/watch_list_event.dart';
import '../../../main_layout/profile/presentation/bloc/watchList/watch_list_state.dart';

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
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                        size: 35,
                      ),
                      onPressed: () => Navigator.pop(context),
                    ),

                    BlocBuilder<WatchListBloc, WatchListState>(
                      builder: (context, state) {
                        bool isSaved = false;

                        if (state is WatchListLoaded) {
                          isSaved = state.movies.any((m) => m.id == movie.id);
                        }

                        if (state is WatchListStatus) {
                          isSaved = state.isSaved;
                        }

                        return IconButton(
                          icon: Icon(
                            isSaved ? Icons.bookmark : Icons.bookmark_border,
                            color: isSaved ? Colors.yellow : Colors.white,
                            size: 35,
                          ),
                          onPressed: () {
                            final bloc = context.read<WatchListBloc>();

                            if (isSaved) {
                              bloc.add(
                                RemoveFromWatchListEvent(movie.toMovie()),
                              );
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Removed from Watch List"),
                                ),
                              );
                            } else {
                              bloc.add(AddToWatchListEvent(movie.toMovie()));
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Added to Watch List"),
                                ),
                              );
                            }
                          },
                        );
                      },
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
                      const SizedBox(height: 175),

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
                          const SizedBox(height: 10),
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

                      const SizedBox(height: 8),

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
