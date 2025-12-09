import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/features/browse/presentation/bloc/movie_browse_bloc.dart';
import 'package:movies_app/features/browse/presentation/screens/movie_browse_screen.dart';
import 'package:movies_app/features/profile/presentation/bloc/deleteProfile/delete_profile_bloc.dart';
import 'package:movies_app/features/profile/presentation/bloc/userProfile/user_profile_bloc.dart';
import '../../features/profile/presentation/bloc/history/history_bloc.dart';
import '../../features/profile/presentation/bloc/history/history_event.dart';
import '../../features/profile/presentation/bloc/updateProfile/update_profile_bloc.dart';
import '../../features/profile/presentation/bloc/userProfile/user_profile_event.dart';
import '../../features/profile/presentation/bloc/watchList/watch_list_bloc.dart';
import '../../features/profile/presentation/bloc/watchList/watch_list_event.dart';
import '../../features/profile/presentation/screens/update_profile.dart';
import '../../features/profile/presentation/screens/user_profile_screen.dart';
import '../../features/search/presentation/bloc/movie_search_bloc.dart';
import '../../features/search/presentation/screens/movie_search_screen.dart';
import '../../injection_container.dart';

class MovieBrowseWrapper extends StatelessWidget {
  const MovieBrowseWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<MovieBrowseBloc>(),
      child: const MovieBrowseScreen(),
    );
  }
}

class MovieSearchWrapper extends StatelessWidget {
  const MovieSearchWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<MovieSearchBloc>(),
      child: const MovieSearchScreen(),
    );
  }
}

class ProfileWrapper extends StatelessWidget {
  const ProfileWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<UserProfileBloc>(
          create: (_) => sl<UserProfileBloc>()..add(GetProfileEvent()),
        ),
        BlocProvider<HistoryBloc>(
          create: (_) => sl<HistoryBloc>()..add(LoadHistoryEvent()),
        ),
        BlocProvider<WatchListBloc>(
          create: (_) => sl<WatchListBloc>()..add(LoadWatchListEvent()),
        ),
      ],
      child: const ProfileScreen(),
    );
  }
}

class UpdateProfileWrapper extends StatelessWidget {
  const UpdateProfileWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<UpdateProfileBloc>(
          create: (_) => sl<UpdateProfileBloc>(),
        ),
        BlocProvider<DeleteProfileBloc>(
          create: (_) => sl<DeleteProfileBloc>(),
        ),
        BlocProvider<UserProfileBloc>(
          create: (_) => sl<UserProfileBloc>()..add(GetProfileEvent()),
        )
      ],
      child: UpdateProfileScreen(),
    );
  }
}