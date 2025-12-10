import 'package:flutter/material.dart';
import 'package:movies_app/core/appAssets/app_images.dart';
import '../../../../../core/app_routes.dart';
import '../../../../../core/appColors/app_colors.dart';
import '../../../../../core/responsive/responsive.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    _navigateToNextScreen();
  }

  void _navigateToNextScreen() async {
    await Future.delayed(const Duration(seconds: 3));

    if (!mounted) return;
    Navigator.of(context).pushReplacementNamed(AppRoutes.onBoardingRoute);
  }

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);

    return Scaffold(
      backgroundColor: AppColors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            const Spacer(),
            Image.asset(
              AppImages.forgotPassword,
              width: responsive.scaleWidth(150),
              height: responsive.scaleWidth(150),
            ),
            //SizedBox(height: responsive.scaleHeight(10)),
            const Spacer(),
            Image.asset(
              AppImages.maskGroup,
              width: responsive.scaleWidth(150),
              height: responsive.scaleWidth(150),
            ),
            //SizedBox(height: responsive.scaleHeight(10)),
          ],
        ),
      ),
    );
  }
}