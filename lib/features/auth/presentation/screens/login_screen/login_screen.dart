import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/appAssets/app_images.dart';
import 'package:movies_app/core/appColors/app_colors.dart';
import 'package:movies_app/core/app_routes.dart';
import 'package:movies_app/core/commonWidgets/custom_button.dart';
import 'package:movies_app/core/responsive/responsive.dart';
import '../../../../../core/appAssets/app_icons.dart';
import '../../../../../core/commonWidgets/custom_textField.dart';
import '../../../../../core/commonWidgets/validators.dart';
import '../../bloc/auth_bloc/auth_bloc.dart';
import '../../bloc/auth_bloc/auth_event.dart';
import '../../bloc/auth_bloc/auth_state.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool hidePassword = true;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);

    return Scaffold(
        backgroundColor: AppColors.black,
        body: SafeArea(
            child: BlocConsumer<AuthBloc, AuthState>(
              listener: (context, state) {
                print("AuthBloc state changed: $state");
                if (state is AuthSuccess) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Login Successful"),
                      backgroundColor: Colors.green,
                    ),
                  );
                } else if (state is AuthFailure) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(state.error),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              },
              builder: (context, state) {
                if (state is AuthLoading) {
                  return const Center(child: CircularProgressIndicator());
                }
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: 50),

                      /// ---------------------- LOGO ----------------------
                      SizedBox(
                        height: responsive.scaleHeight(100),
                        child: Image.asset(
                          AppImages.forgotPassword,
                          fit: BoxFit.cover,
                        ),
                      ),

                      const SizedBox(height: 40),

                      Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            /// ---------------------- EMAIL FIELD ----------------------
                            CustomTextField(
                              hint: "Email",
                              controller: emailController,
                              prefixIcon: AppIcons.email,
                              keyboardType: TextInputType.emailAddress,
                            ),
                            const SizedBox(height: 20),

                            /// ---------------------- PASSWORD FIELD ----------------------
                            CustomTextField(
                              hint: "Password",
                              controller: passwordController,
                              prefixIcon: AppIcons.password,
                              isPassword: hidePassword,
                              suffixIcon: hidePassword ? AppIcons.eyeOff : AppIcons.eyeOff,
                              onSuffixTap: () {
                                setState(() => hidePassword = !hidePassword);
                              },
                            ),
                            const SizedBox(height: 15),
                          ],
                        ),
                      ),

                      /// ---------------------- FORGOT PASSWORD ----------------------
                      GestureDetector(
                        onTap:() {
                          Navigator.pushReplacementNamed(context, AppRoutes.forgetPassword);
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(right: 25),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              "Forgot Password?",
                              style: TextStyle(
                                color: AppColors.primary,
                                fontSize: responsive.scaleWidth(14),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 30),

                      /// ---------------------- LOGIN BUTTON ----------------------
                      CustomButton(
                        text: "Login",
                        bgColor: AppColors.primary,
                        textColor: AppColors.black,
                        width: 380,
                        height: 56,
                        onTap: () {
                          // 1. تحقق فقط من أن الحقول ليست فارغة
                          if (emailController.text.trim().isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Please enter your email"),
                                backgroundColor: Colors.red,
                              ),
                            );
                            return; // أوقف التنفيذ إذا كان البريد الإلكتروني فارغًا
                          }

                          if (passwordController.text.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Please enter your password"),
                                backgroundColor: Colors.red,
                              ),
                            );
                            return; // أوقف التنفيذ إذا كانت كلمة المرور فارغة
                          }

                          // 2. إذا كانت الحقول غير فارغة، أرسل الطلب إلى الـ BLoC
                          context.read<AuthBloc>().add(LoginRequested(
                            email: emailController.text.trim(),
                            password: passwordController.text, // لا تحتاج لـ trim() هنا
                          ));

                        },
                      ),

                      const SizedBox(height: 25),

                      /// ---------------------- DON'T HAVE ACCOUNT ----------------------
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don’t Have Account? ",
                            style: TextStyle(
                              color: AppColors.white,
                              fontSize: responsive.scaleWidth(15),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushReplacementNamed(context, AppRoutes.registerRoute);
                            },
                            child: Text(
                              "Create One",
                              style: TextStyle(
                                color: AppColors.primary,
                                fontSize: responsive.scaleWidth(15),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 25),

                      /// ---------------------- OR LINE ----------------------
                      Row(
                        children: [
                          Expanded(
                            child: Divider(
                              color: AppColors.primary,
                              thickness: 1,
                              endIndent: 15,
                              indent: 65,
                            ),
                          ),
                          Text(
                            "OR",
                            style: TextStyle(
                              color: AppColors.primary,
                              fontSize: responsive.scaleWidth(16),
                            ),
                          ),
                          Expanded(
                            child: Divider(
                              color: AppColors.primary,
                              thickness: 1,
                              indent: 15,
                              endIndent: 65,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 30),

                      /// ---------------------- GOOGLE LOGIN BUTTON ----------------------
                      CustomButton(
                        bgColor: AppColors.primary,
                        textColor: AppColors.black,
                        width: 380,
                        height: 56,
                        leadingIcon: Text(
                          "G",
                          style: TextStyle(fontSize: 35, fontWeight: FontWeight.w900),
                        ),
                        text: "   Login with Google",
                        onTap: () {},
                      ),

                      const SizedBox(height: 25),

                      /// ---------------------- LANGUAGE SELECTOR ----------------------
                      Image.asset(AppImages.language),
                      const SizedBox(height: 40),
                    ],
                  ),
                );
              },
            ),
            ),
        );
    }
}
