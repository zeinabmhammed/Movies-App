import 'package:flutter/material.dart';
import 'package:movies_app/core/appColors/app_colors.dart';
import 'package:movies_app/core/app_routes.dart';
import 'package:movies_app/core/commonWidgets/custom_button.dart';
import 'package:movies_app/domain/entities/onboarding_entity.dart';
import 'package:shared_preferences/shared_preferences.dart'; // <--- تم إضافة هذا السطر
import '../../../../core/responsive/responsive.dart';
import '../../../../data/datasources/onboarding_local_data_source.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int currentIndex = 0;
  late final List<OnboardingEntity> data;

  @override
  void initState() {
    super.initState();
    data = OnboardingLocalDataSourceImpl().getOnboardingData();
    _controller.addListener(() {
      if (mounted) { // التحقق من أن الـ widget ما زال في الـ tree
        setState(() {
          currentIndex = _controller.page!.round();
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose(); // تنظيف الـ controller عند الخروج
    super.dispose();
  }

  void next() {
    if (currentIndex < data.length - 1) {
      _controller.nextPage(
          duration: const Duration(milliseconds: 350), curve: Curves.easeInOut);
    }
  }

  void back() {
    if (currentIndex > 0) {
      _controller.previousPage(
          duration: const Duration(milliseconds: 350), curve: Curves.easeInOut);
    }
  }

  // ---- بداية الدالة الجديدة التي ستحتوي على المنطق ----
  Future<void> _finishOnboarding() async {
    // 1. احصل على نسخة من SharedPreferences
    final prefs = await SharedPreferences.getInstance();

    // 2. احفظ القيمة true للإشارة إلى أن الـ Onboarding قد تم رؤيته
    await prefs.setBool('hasSeenOnboarding', true);

    // 3. انتقل إلى شاشة التسجيل/الدخول وامنع المستخدم من الرجوع
    if (mounted) { // التحقق مرة أخرى قبل الانتقال
      Navigator.pushReplacementNamed(context, AppRoutes.loginRoute);
    }
  }
  // ---- نهاية الدالة الجديدة ----


  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);

    return Scaffold(
      backgroundColor: AppColors.black,
      body: Stack(
        children: [
          // PageView
          PageView.builder(
            controller: _controller,
            itemCount: data.length,
            itemBuilder: (context, index) {
              final item = data[index];

              return Column(
                children: [
                  SizedBox(
                    height: index == 0
                        ? responsive.height // أول شاشة full screen
                        : responsive.height * 0.75, // من التانية 3/4
                    width: responsive.width,
                    child: Image.asset(
                      item.imagePath,
                      fit: BoxFit.cover,
                    ),
                  ),

                  if (index != 0)
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        color: Colors.transparent,
                      ),
                    ),
                ],
              );
            },
          ),

          // SCREEN 1 → Next only
          if (currentIndex == 0)
            Positioned(
              bottom: responsive.scaleHeight(30),
              left: responsive.scaleWidth(20),
              right: responsive.scaleWidth(20),
              child: Column(
                children: [
                  Text(
                    data[currentIndex].title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: responsive.scaleWidth(28),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: responsive.scaleHeight(6)),
                  if (data[currentIndex].descriptionText.isNotEmpty)
                    Text(
                      data[currentIndex].descriptionText,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: responsive.scaleWidth(16),
                        height: 1.4,
                      ),
                    ),
                  SizedBox(height: responsive.scaleHeight(20)),
                  CustomButton(
                    text: data[currentIndex].buttonText,
                    textColor: AppColors.black,
                    bgColor: AppColors.primary,
                    width: responsive.scaleWidth(400),
                    height: responsive.scaleHeight(60),
                    onTap: next,
                  ),
                ],
              ),
            ),

          // SCREEN 2 → Bottom Sheet + Next only
          if (currentIndex == 1)
            _buildBottomSheet(
              responsive,
              child: Column(
                children: [
                  Text(
                    data[currentIndex].title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: responsive.scaleWidth(28),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: responsive.scaleHeight(6)),
                  if (data[currentIndex].descriptionText.isNotEmpty)
                    Text(
                      data[currentIndex].descriptionText,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: responsive.scaleWidth(16),
                        height: 1.4,
                      ),
                    ),
                  SizedBox(height: responsive.scaleHeight(20)),
                  CustomButton(
                    text: "Next",
                    textColor: AppColors.black,
                    bgColor: AppColors.primary,
                    width: responsive.scaleWidth(400),
                    height: responsive.scaleHeight(60),
                    onTap: next,
                  ),
                ],
              ),
            ),

          // SCREEN 3 → 5 → Bottom Sheet + Next/Back
          if (currentIndex >= 2 && currentIndex <= 4)
            _buildBottomSheet(
              responsive,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    data[currentIndex].title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: responsive.scaleWidth(28),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: responsive.scaleHeight(6)),
                  if (data[currentIndex].descriptionText.isNotEmpty)
                    Text(
                      data[currentIndex].descriptionText,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: responsive.scaleWidth(16),
                        height: 1.4,
                      ),
                    ),
                  SizedBox(height: responsive.scaleHeight(20)),
                  CustomButton(
                    text: "Next",
                    textColor: AppColors.black,
                    bgColor: AppColors.primary,
                    width: responsive.scaleWidth(400),
                    height: responsive.scaleHeight(60),
                    onTap: next,
                  ),
                  SizedBox(height: responsive.scaleHeight(6)),
                  CustomButton(
                    text: "Back",
                    textColor: AppColors.primary,
                    bgColor: AppColors.black,
                    borderColor: AppColors.primary,
                    width: responsive.scaleWidth(400),
                    height: responsive.scaleHeight(60),
                    onTap: back,
                  ),
                ],
              ),
            ),

          // SCREEN 6 → Finish + Back
          if (currentIndex == 5)
            _buildBottomSheet(
              responsive,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    data[currentIndex].title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: responsive.scaleWidth(28),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: responsive.scaleHeight(6)),
                  if (data[currentIndex].descriptionText.isNotEmpty)
                    Text(
                      data[currentIndex].descriptionText,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: responsive.scaleWidth(16),
                        height: 1.4,
                      ),
                    ),
                  SizedBox(height: responsive.scaleHeight(20)),
                  CustomButton(
                    text: "Finish",
                    textColor: AppColors.black,
                    bgColor: AppColors.primary,
                    width: responsive.scaleWidth(400),
                    height: responsive.scaleHeight(60),
                    // -------- تم تعديل هذا الجزء فقط --------
                    onTap: _finishOnboarding, // استدعاء الدالة الجديدة
                    // ----------------------------------------
                  ),
                  SizedBox(height: responsive.scaleHeight(12)),
                  CustomButton(
                    text: "Back",
                    textColor: AppColors.primary,
                    bgColor: AppColors.black,
                    borderColor: AppColors.primary,
                    width: responsive.scaleWidth(400),
                    height: responsive.scaleHeight(60),
                    onTap: back,
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildBottomSheet(Responsive responsive, {required Widget child}) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        padding: EdgeInsets.all(responsive.scaleWidth(20)),
        decoration: BoxDecoration(
          color: AppColors.black,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(responsive.scaleWidth(25)),
            topRight: Radius.circular(responsive.scaleWidth(25)),
          ),
        ),
        child: child,
      ),
    );
  }
}
