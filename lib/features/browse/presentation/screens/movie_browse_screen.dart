import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/responsive/responsive.dart';
import '../../../search/presentation/widgets/movie_card.dart';
import '../bloc/movie_browse_bloc.dart';
import '../bloc/movie_browse_event.dart';
import '../bloc/movie_browse_state.dart';
import '../widgets/genre_tab_bar.dart';

class MovieBrowseScreen extends StatefulWidget {
  const MovieBrowseScreen({super.key});

  @override
  State<MovieBrowseScreen> createState() => _MovieBrowseScreenState();
}

class _MovieBrowseScreenState extends State<MovieBrowseScreen>
    with TickerProviderStateMixin {
  TabController? _tabController;
  String? selectedGenre;

  @override
  void initState() {
    super.initState();
    context.read<MovieBrowseBloc>().add(LoadBrowseMoviesEvent());
  }

  void _onGenreSelected(String genre) {
    setState(() {
      selectedGenre = genre;
    });
    context.read<MovieBrowseBloc>().add(FilterMoviesByGenreEvent(genre));
  }

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          left: responsive.scaleWidth(16),
          right: responsive.scaleWidth(16),
          bottom: responsive.scaleHeight(16),
        ),
        child: BlocBuilder<MovieBrowseBloc, MovieBrowseState>(
          builder: (context, state) {
            if (state is MovieBrowseLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is MovieBrowseLoaded) {
              final sortedGenres = List<String>.from(state.genres)..sort();
              sortedGenres.insert(0, "All");
              selectedGenre ??= sortedGenres.isNotEmpty
                  ? sortedGenres.first
                  : null;
              _tabController ??= TabController(
                length: sortedGenres.length,
                vsync: this,
              );

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GenreTabBar(
                    tabController: _tabController!,
                    genres: sortedGenres,
                    selectedGenre: selectedGenre!,
                    onGenreSelected: _onGenreSelected,
                  ),
                  Expanded(
                    child: GridView.builder(
                      padding: EdgeInsets.only(top: responsive.scaleHeight(20)),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: responsive.getGridCount(),
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 8,
                        childAspectRatio: responsive.gridAspectRatio(),
                      ),
                      itemCount: state.filteredMovies.length,
                      itemBuilder: (context, index) {
                        final movie = state.filteredMovies[index];
                        return MovieCard(movie: movie);
                      },
                    ),
                  ),
                ],
              );
            } else if (state is MovieBrowseError) {
              return Center(child: Text(state.message));
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
