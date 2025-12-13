import 'package:flutter/material.dart';
import '../../../../core/resources/appAssets/app_images.dart';
import '../../../../core/resources/color_manger.dart';
import '../../../../core/resources/responsive/responsive.dart';
import '../../../../core/routes_manger/routes.dart';

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
    Navigator.of(context).pushReplacementNamed(Routes.onBoardingRoute);
  }

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);

    return Scaffold(
      backgroundColor: ColorManager.black,
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