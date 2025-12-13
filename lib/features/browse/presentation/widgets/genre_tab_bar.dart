import 'package:flutter/material.dart';
import 'package:movies_app/core/resources/color_manger.dart';
import '../../../../core/resources/responsive/responsive.dart';
import '../../../../core/resources/styles_manger.dart';

class GenreTabBar extends StatelessWidget {
  final TabController tabController;
  final List<String> genres;
  final String selectedGenre;
  final Function(String) onGenreSelected;

  const GenreTabBar({
    super.key,
    required this.tabController,
    required this.genres,
    required this.selectedGenre,
    required this.onGenreSelected,
  });

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);

    return SafeArea(
      bottom: false,
      child: TabBar(
        controller: tabController,
        isScrollable: true,
        indicator: const BoxDecoration(),
        dividerColor: Colors.transparent,
        tabAlignment: TabAlignment.start,
        labelPadding: EdgeInsets.symmetric(
          horizontal: responsive.scaleWidth(5)
      ),
        tabs: genres.map((genre) {
          final isSelected = genre == selectedGenre;

          return GestureDetector(
            onTap: () => onGenreSelected(genre),
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: responsive.scaleWidth(16),
                vertical: responsive.scaleHeight(8),
              ),
              decoration: BoxDecoration(
                color: isSelected ? ColorManager.yellow : Colors.transparent,
                borderRadius: BorderRadius.circular(responsive.scaleWidth(16)),
                border: Border.all(
                  color: isSelected ? Colors.transparent : ColorManager.yellow,
                  width: responsive.scaleWidth(2),
                ),
              ),
              child: Text(
                genre,
                style: s20Bold(
                  color: isSelected ? ColorManager.black : ColorManager.yellow,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
