class AppImages {
  AppImages._();

  static String avatar1 = "assets/images/avatar1.png";
  static String avatar2 = "assets/images/avatar2.png";
  static String avatar3 = "assets/images/avatar3.png";
  static String avatar4 = "assets/images/avatar4.png";
  static String avatar5 = "assets/images/avatar5.png";
  static String avatar6 = "assets/images/avatar6.png";
  static String avatar7 = "assets/images/avatar7.png";
  static String avatar8 = "assets/images/avatar8.png";
  static String avatar9 = "assets/images/avatar9.png";
  static String movie1 = "assets/images/Movies1.png";
  static String movie2 = "assets/images/Movies2.png";
  static String movie3 = "assets/images/Movies3.png";
  static String movie4 = "assets/images/Movies4.png";
  static String movie5 = "assets/images/Movies5.png";
  static String movie6 = "assets/images/Movies6.png";
  static String forgotPassword = "assets/images/login.png";
  static String language = "assets/images/Language Switch.png";
  static String forgotPasswordBro = "assets/images/Forgot password-bro.png";
  static String maskGroup = "assets/images/Mask group .png";
  static String empty = "assets/images/empty.png";
  static String exitWithIcon = "assets/images/exitWithIcon.png";

  static Map<int, String> avatarMap = {
    1: avatar1,
    2: avatar2,
    3: avatar3,
    4: avatar4,
    5: avatar5,
    6: avatar6,
    7: avatar7,
    8: avatar8,
    9: avatar9,
  };
}
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
  static const String playIcon = "$svgPath/play.svg";
  static const String watchLaterIcon = "$svgPath/watchLater.svg";
  static const String heartIcon = "$svgPath/heart.svg";


}