import 'package:flutter/material.dart';
import 'package:movies_app/core/resources/color_manger.dart';
import 'package:movies_app/features/auth/presentation/widgets/avatar_carousel.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/resources/appAssets/app_icons.dart';
import '../../../../../core/resources/appAssets/app_images.dart';
import '../../../../../core/resources/commonWidgets/custom_button.dart';
import '../../../../../core/resources/commonWidgets/custom_textField.dart';
import '../../../../../core/resources/responsive/responsive.dart';
import '../../../../../core/routes_manger/routes.dart';
import '../../bloc/auth_bloc/auth_bloc.dart';
import '../../bloc/auth_bloc/auth_event.dart';
import '../../bloc/auth_bloc/auth_state.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  int selectedAvatar = 1;

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final confirmController = TextEditingController();
  final phoneController = TextEditingController();

  bool isPassword = true;
  bool isConfirmPassword = true;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);

    return Scaffold(
      backgroundColor: ColorManager.black,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: responsive.scaleWidth(20),
            vertical: responsive.scaleHeight(10),
          ),
          child: Form(
            key: _formKey,
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
                    SizedBox(width: responsive.scaleWidth(120)),
                    Text(
                      "Register",
                      style: TextStyle(
                        fontSize: responsive.scaleWidth(16),
                        fontWeight: FontWeight.w400,
                        color: ColorManager.yellow,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: responsive.scaleHeight(6)),

                AvatarCarousel(
                  images: [
                    AppImages.avatar1,
                    AppImages.avatar2,
                    AppImages.avatar3,
                    AppImages.avatar4,
                    AppImages.avatar5,
                    AppImages.avatar6,
                    AppImages.avatar7,
                    AppImages.avatar8,
                    AppImages.avatar9,
                  ],
                  onAvatarSelected: (id) {
                    selectedAvatar = id;
                  },
                ),
                SizedBox(height: responsive.scaleHeight(6)),

                CustomTextField(
                  hint: "Name",
                  prefixIcon: AppIcons.identification,
                  controller: nameController,
                ),
                SizedBox(height: responsive.scaleHeight(16)),

                CustomTextField(
                  hint: "Email",
                  prefixIcon: AppIcons.email,
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(height: responsive.scaleHeight(16)),

                CustomTextField(
                  hint: "Password",
                  controller: passController,
                  isPassword: isPassword,
                  prefixIcon: AppIcons.password,
                  suffixIcon: isPassword ? AppIcons.eyeOff : AppIcons.eyeOff,
                  onSuffixTap: () {
                    setState(() {
                      isPassword = !isPassword;
                    });
                  },
                ),
                SizedBox(height: responsive.scaleHeight(16)),

                CustomTextField(
                  hint: "Confirm Password",
                  controller: confirmController,
                  isPassword: isConfirmPassword,
                  prefixIcon: AppIcons.password,
                  suffixIcon: isConfirmPassword
                      ? AppIcons.eyeOff
                      : AppIcons.eyeOff,
                  onSuffixTap: () {
                    setState(() {
                      isConfirmPassword = !isConfirmPassword;
                    });
                  },
                ),
                SizedBox(height: responsive.scaleHeight(16)),

                CustomTextField(
                  hint: "Phone Number",
                  controller: phoneController,
                  prefixIcon: AppIcons.phone,
                  keyboardType: TextInputType.phone,
                ),
                SizedBox(height: responsive.scaleHeight(30)),

                BlocConsumer<AuthBloc, AuthState>(
                  listener: (context, state) {
                    if (state is AuthSuccess) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Account created successfully"),
                        ),
                      );
                      Navigator.pushReplacementNamed(
                        context,
                        Routes.loginRoute,
                      );
                    } else if (state is AuthFailure) {
                      ScaffoldMessenger.of(
                        context,
                      ).showSnackBar(SnackBar(content: Text(state.error)));
                    }
                  },
                  builder: (context, state) {
                    if (state is AuthLoading) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    return CustomButton(
                      text: "Create Account",
                      borderColor: ColorManager.yellow,
                      textColor: ColorManager.black,
                      bgColor: ColorManager.yellow,
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          context.read<AuthBloc>().add(
                            RegisterRequested(
                              name: nameController.text.trim(),
                              email: emailController.text.trim(),
                              password: passController.text.trim(),
                              confirmPassword: confirmController.text.trim(),
                              phone:
                                  "+20" +
                                  phoneController.text.trim().substring(1),
                              avatarId: selectedAvatar,
                            ),
                          );
                        }
                      },
                    );
                  },
                ),

                SizedBox(height: responsive.scaleHeight(16)),

                Center(
                  child: GestureDetector(
                    onTap: () => Navigator.pushReplacementNamed(
                      context,
                      Routes.loginRoute,
                    ),
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Already have an account? ",
                            style: TextStyle(
                              color: ColorManager.white,
                              fontSize: responsive.scaleWidth(16),
                            ),
                          ),
                          TextSpan(
                            text: "Login",
                            style: TextStyle(
                              color: ColorManager.yellow,
                              fontSize: responsive.scaleWidth(16),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                Image.asset(AppImages.language),
                // SizedBox(height: responsive.scaleHeight(30)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
