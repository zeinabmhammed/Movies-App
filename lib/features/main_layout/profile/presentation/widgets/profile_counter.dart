import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/resources/responsive/responsive.dart';
import '../bloc/watchList/watch_list_bloc.dart';
import '../bloc/watchList/watch_list_state.dart';
import '../bloc/history/history_bloc.dart';
import '../bloc/history/history_state.dart';

class ProfileCounters extends StatelessWidget {
  int watchListCount;
  int historyCount;

  ProfileCounters({
    super.key,
    required this.watchListCount,
    required this.historyCount,
  });

  @override
  Widget build(BuildContext context) {
    final resp = Responsive(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        BlocBuilder<WatchListBloc, WatchListState>(
          builder: (context, state) {
            int count = 0;
            if (state is WatchListCountLoaded) count = state.count;
            return Text(
              '$watchListCount',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: resp.scaleWidth(24),
              ),
            );
          },
        ),
        BlocBuilder<HistoryBloc, HistoryState>(
          builder: (context, state) {
            int count = 0;
            if (state is HistoryCountLoaded) count = state.count;
            return Text(
              '$historyCount',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: resp.scaleWidth(24),
              ),
            );
          },
        ),
      ],
    );
  }
}
