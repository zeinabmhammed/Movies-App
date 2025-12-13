import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/resources/appAssets/app_icons.dart';
import '../../../../../core/resources/appAssets/app_images.dart';
import '../../../../../core/resources/color_manger.dart';
import '../../../../../core/resources/commonWidgets/custom_button.dart';
import '../../../../../core/resources/commonWidgets/custom_textField.dart';
import '../../../../../core/resources/responsive/responsive.dart';
import '../../../../../core/routes_manger/routes.dart';
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
      backgroundColor: ColorManager.black,
      body: SafeArea(
        child: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) async {
            print("AuthBloc state changed: $state");
            if (state is AuthSuccess) {

              Navigator.pushReplacementNamed(context, Routes.mainRoute);

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: const Text("Login Successful"),
                  backgroundColor: ColorManager.green,
                ),
              );
            } else if (state is AuthFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.error),
                  backgroundColor: ColorManager.red,
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
                        CustomTextField(
                          hint: "Email",
                          controller: emailController,
                          prefixIcon: AppIcons.email,
                          keyboardType: TextInputType.emailAddress,
                        ),
                        const SizedBox(height: 20),

                        CustomTextField(
                          hint: "Password",
                          controller: passwordController,
                          prefixIcon: AppIcons.password,
                          isPassword: hidePassword,
                          suffixIcon: hidePassword
                              ? AppIcons.eyeOff
                              : AppIcons.eyeOff,
                          onSuffixTap: () {
                            setState(() => hidePassword = !hidePassword);
                          },
                        ),
                        const SizedBox(height: 15),
                      ],
                    ),
                  ),

                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacementNamed(
                        context,
                        Routes.forgetPassword,
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 25),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "Forgot Password?",
                          style: TextStyle(
                            color: ColorManager.yellow,
                            fontSize: responsive.scaleWidth(14),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),

                  CustomButton(
                    text: "Login",
                    bgColor: ColorManager.yellow,
                    textColor: ColorManager.black,
                    width: 380,
                    height: 56,
                    onTap: () {
                      if (emailController.text.trim().isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: const Text("Please enter your email"),
                            backgroundColor: ColorManager.red,
                          ),
                        );
                        return;
                      }

                      if (passwordController.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: const Text("Please enter your password"),
                            backgroundColor: ColorManager.red,
                          ),
                        );
                        return;
                      }

                      context.read<AuthBloc>().add(
                        LoginRequested(
                          email: emailController.text.trim(),
                          password: passwordController.text,
                        ),
                      );
                    },
                  ),

                  const SizedBox(height: 25),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don’t Have Account? ",
                        style: TextStyle(
                          color: ColorManager.white,
                          fontSize: responsive.scaleWidth(15),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacementNamed(
                            context,
                            Routes.registerRoute,
                          );
                        },
                        child: Text(
                          "Create One",
                          style: TextStyle(
                            color: ColorManager.yellow,
                            fontSize: responsive.scaleWidth(15),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 25),

                  Row(
                    children: [
                      Expanded(
                        child: Divider(
                          color: ColorManager.yellow,
                          thickness: 1,
                          endIndent: 15,
                          indent: 65,
                        ),
                      ),
                      Text(
                        "OR",
                        style: TextStyle(
                          color: ColorManager.yellow,
                          fontSize: responsive.scaleWidth(16),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          color: ColorManager.yellow,
                          thickness: 1,
                          indent: 15,
                          endIndent: 65,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 30),

                  CustomButton(
                    bgColor: ColorManager.yellow,
                    textColor: ColorManager.black,
                    width: 380,
                    height: 56,
                    leadingIcon: Text(
                      "G",
                      style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.w900,
                        color: ColorManager.black,
                      ),
                    ),
                    text: "   Login with Google",
                    onTap: () {
                    },
                  ),

                  const SizedBox(height: 25),

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
