import 'package:flutter/material.dart';
import 'package:movies_app/core/appAssets/app_images.dart';
import '../../../../../core/commonWidgets/custom_button.dart';
import '../../../../../core/commonWidgets/custom_textField.dart';
import '../../../../../core/resources/color_manger.dart';
import '../../../../../core/responsive/responsive.dart';
import '../../../../../core/appAssets/app_icons.dart';
import '../../../../../core/routes_manger/routes.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);

    return Scaffold(
      backgroundColor: ColorManager.black,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: responsive.scaleWidth(20),
            vertical: responsive.scaleHeight(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pushReplacementNamed(
                      context,
                      Routes.loginRoute,
                    ),
                    child: Icon(
                      Icons.arrow_back,
                      color: ColorManager.yellow,
                      size: responsive.scaleWidth(28),
                    ),
                  ),
                  const Spacer(),
                  Text(
                    "Forget Password",
                    style: TextStyle(
                      color: ColorManager.yellow,
                      fontSize: responsive.scaleWidth(20),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                ],
              ),

              SizedBox(height: responsive.scaleHeight(40)),

              Image.asset(
                AppImages.forgotPasswordBro,
                fit: BoxFit.cover,
                //width: responsive.scaleWidth(250),
              ),

              SizedBox(height: responsive.scaleHeight(40)),

              CustomTextField(
                hint: "Email",
                prefixIcon: AppIcons.email,
                keyboardType: TextInputType.emailAddress,
              ),

              SizedBox(height: responsive.scaleHeight(30)),

              CustomButton(
                text: "Verify Email",
                bgColor: ColorManager.yellow,
                textColor: ColorManager.black,
                width: 380,
                height: 56,
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
