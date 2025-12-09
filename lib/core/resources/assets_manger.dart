
const String imagePath = "assets/images";
const String svgPath = "assets/svg";

abstract class ImageAssets {
  static const String homeBackground = "$imagePath/homeBackground.png";


}
class SvgAssets{
  // bottom navigation bar icons
  //not selected
  static const String home = "$svgPath/homeIcon.svg";
  static const String search = "$svgPath/searchIcon.svg";
  static const String explore = "$svgPath/explore.svg";
  static const String profile = "$svgPath/Profile.svg";

  // selected
  static const String homeSelected = "$svgPath/coloredHomeIcon.svg";
  static const String searchSelected = "$svgPath/coloredSearch.svg";
  static const String exploreSelected = "$svgPath/coloredExplore.svg";
  static const String profileSelected = "$svgPath/coloredProfile.svg";

  // icons
 static const String favoriteIcon = "$svgPath/favorite.svg";


}