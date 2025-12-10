import 'package:movies_app/core/appAssets/app_images.dart';

import '../../domain/entities/onboarding_entity.dart';

abstract class OnboardingDataSource {
  List<OnboardingEntity> getOnboardingData();
}

class OnboardingLocalDataSourceImpl implements OnboardingDataSource {
  @override
  List<OnboardingEntity> getOnboardingData() {
    return [
      OnboardingEntity(
        imagePath: AppImages.movie1,
        title: "Find Your Next\n Favorite Movie Here",
        descriptionText: "Get access to a huge library of movies\n to suit all tastes. You will surely like it.",
        buttonText: "Explore Now"
      ),
      OnboardingEntity(
        imagePath: AppImages.movie2,
        title: "Discover Movies",
        descriptionText: "Explore a vast collection of movies in all\n qualities and genres. Find your next\n favorite film with ease.",
        buttonText: "Next"
      ),
      OnboardingEntity(
        imagePath: AppImages.movie3,
        title: "Explore All Genres",
        descriptionText: 'Discover movies from every genre, in all\n available qualities. Find something new\n and exciting to watch every day.', buttonText: "Next"
      ),
      OnboardingEntity(
        imagePath: AppImages.movie4,
        title: "Create Watchlists",
        descriptionText: 'Save movies to your watchlist to keep\n track of what you want to watch next.\n Enjoy films in various qualities and\n genres..',
          buttonText: "Next"
      ),
      OnboardingEntity(
        imagePath: AppImages.movie5,
        title: "Rate, Review, and Learn",
        descriptionText: 'Share your thoughts on the movies\n you''ve watched. Dive deep into film\n details and help others discover great\n movies with your reviews.',
          buttonText: "Next"
      ),
      OnboardingEntity(
        imagePath: AppImages.movie6,
        title: "Start Watching Now",
        descriptionText: "",
        buttonText: "Finish"
      ),

    ];
  }
}