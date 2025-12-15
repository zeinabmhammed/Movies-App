import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/resources/appAssets/app_images.dart';
import '../../../../../core/resources/color_manger.dart';
import '../../../../../core/routes_manger/routes.dart';
import '../bloc/history/history_bloc.dart';
import '../bloc/history/history_event.dart';
import '../bloc/userProfile/user_profile_bloc.dart';
import '../bloc/userProfile/user_profile_event.dart';
import '../bloc/userProfile/user_profile_state.dart';
import '../bloc/watchList/watch_list_bloc.dart';
import '../bloc/watchList/watch_list_event.dart';
import '../bloc/watchList/watch_list_state.dart';
import '../widgets/history_list.dart';
import '../widgets/profile_header_widget.dart';
import '../widgets/watch_list.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool showWatchList = true;

  @override
  void initState() {
    super.initState();
    context.read<HistoryBloc>().add(LoadHistoryEvent());
    context.read<WatchListBloc>().add(LoadWatchListEvent());
    context.read<UserProfileBloc>().add(GetProfileEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.grey,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            BlocBuilder<UserProfileBloc, ProfileState>(
              builder: (context, state) {
                String userName = "User";
                String phone = "0000000000";
                int historyCount = 0;
                int avatarId = 1;

                if (state is ProfileLoaded) {
                  userName = state.user.name;
                  phone = state.user.phone;
                  historyCount = state.historyCount;
                  avatarId = state.user.imageId;
                }

                return BlocSelector<WatchListBloc, WatchListState, int>(
                  selector: (watchState) {
                    if (watchState is WatchListLoaded) {
                      print("WatchList length: ${watchState.movies.length}");
                      return watchState.movies.length;
                    }
                    return 0;
                  },
                  builder: (context, watchListCount) {
                    return ProfileHeaderWidget(
                      userName: userName,
                      avatarImage:
                          AppImages.avatarMap[avatarId] ?? AppImages.avatar1,
                      watchListCount: watchListCount,
                      historyCount: historyCount,
                      showWatchList: showWatchList,
                      onEditProfileTap: () async {
                        final updated = await Navigator.pushNamed(
                          context,
                          Routes.updateProfileRoute,
                          arguments: {
                            'userName': userName,
                            'phone': phone,
                            'avatarId': avatarId,
                          },
                        );
                        if (updated == true) {
                          context.read<UserProfileBloc>().add(
                            GetProfileEvent(),
                          );
                          context.read<WatchListBloc>().add(
                            LoadWatchListEvent(),
                          );
                        }
                      },
                      onExitTap: () {},
                      onTabChanged: (showWatch) {
                        setState(() {
                          showWatchList = showWatch;
                        });
                        if (!showWatch) {
                          context.read<HistoryBloc>().add(LoadHistoryEvent());
                        } else {
                          context.read<WatchListBloc>().add(
                            LoadWatchListEvent(),
                          );
                        }
                      },
                    );
                  },
                );
              },
            ),
            Expanded(
              child: Container(
                color: ColorManager.black,
                child: Center(
                  child: showWatchList ? WatchListWidget() : HistoryList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
