import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movies_app/core/resources/assets_manger.dart';
import 'package:movies_app/core/resources/color_manger.dart';
import 'package:movies_app/core/resources/values_manger.dart';
import 'package:movies_app/features/main_layout/home/cubit/movie_cubit.dart';
import 'package:movies_app/features/main_layout/home/cubit/movie_state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _pageController = PageController(
    viewportFraction: 0.55,
    initialPage: 0,
  );
  @override
  void initState() {
    super.initState();
    context.read<MovieCubit>().fetchMovies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieCubit, MovieState>(
      builder: (context, state) {
        if (state is MovieLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is MovieError) {
          return Center(child: Text('Error: ${state.message}'));
        } else if (state is MovieLoaded) {
          final movies = state.movies;

          return SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: AppSize.s351 +
                      AppMargin.m121+
                      215,
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Positioned(
                        left: 38,
                        top: 6,
                        child: Image.asset(
                          ImageAssets.homeBackground,
                          fit: BoxFit.cover,
                          height: 700,
                        ),
                      ),
                      SizedBox(
                        height: 351 + 180,
                        child: PageView.builder(
                          controller: _pageController,
                          scrollDirection: Axis.horizontal,
                          itemCount: movies.length,
                          pageSnapping: true,
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            final movie = movies[index];
                            return AnimatedBuilder(
                              animation: _pageController,
                              builder: (context, child) {
                                double value = 1.0;
                                if (_pageController.position.haveDimensions) {
                                  value = _pageController.page! - index;
                                  value = (1 - (value.abs() * 0.15)).clamp(0.85, 1.1,);
                                }
                                return Center(
                                  child: Transform.scale(
                                    scale: value,
                                    child: Stack(
                                      children: [
                                        Container(
                                          height: 351,
                                          width: 234,
                                          margin: const EdgeInsets.only(
                                            top: 121,
                                          ),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              20,
                                            ),
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
                                          top: 132,
                                          left: 9,
                                          child: Container(
                                            width: 65,
                                            height: 40,
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 9,
                                              vertical: 11,
                                            ),
                                            decoration: BoxDecoration(
                                              color: ColorManager.black
                                                  .withOpacity(0.6),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Row(
                                              children: [
                                                const SizedBox(width: 4),
                                                Expanded(
                                                  child: Text(
                                                    movie.rating.toString(),
                                                    style: const TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 13,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(width: 2),
                                                SvgPicture.asset(
                                                  SvgAssets.favoriteIcon,
                                                  width: 15,
                                                  height: 15,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Action',
                        style: TextStyle(
                          color: ColorManager.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            'See More',
                            style: TextStyle(
                              color: ColorManager.yellow,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(width: 4),
                          Icon(
                            Icons.arrow_forward_outlined,
                            size: 16,
                            color: ColorManager.yellow,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  height: 220,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: movies.length,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    itemBuilder: (context, index) {
                      final movie = movies[index];
                      return Container(
                        margin: EdgeInsets.only(
                          right: index == movies.length - 1 ? 0 : 16,
                        ),
                        width: 146,
                        height: 220,
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.network(
                                movie.smallCoverImage ??
                                    'https://via.placeholder.com/146x220',
                                width: 146,
                                height: 220,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                              top: 8,
                              left: 8,
                              child: Container(
                                width: 45,
                                height: 30,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 4,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.6),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        movie.rating.toString(),
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    const SizedBox(width: 2),
                                    SvgPicture.asset(
                                      SvgAssets.favoriteIcon,
                                      width: 12,
                                      height: 12,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        }

        // Default state: empty return
        return const SizedBox();
      },
    );
  }
}
