import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/appAssets/app_icons.dart';
import 'package:movies_app/core/commonWidgets/custom_textField.dart';
import 'package:movies_app/core/resources/color_manger.dart';
import 'package:movies_app/features/profile/presentation/bloc/updateProfile/update_profile_bloc.dart';
import 'package:movies_app/features/profile/presentation/bloc/userProfile/user_profile_event.dart';
import '../../../../core/commonWidgets/custom_button.dart';
import '../../../../core/appAssets/app_images.dart';
import '../../../../core/resources/styles_manger.dart';
import '../../../../core/responsive/responsive.dart';
import '../bloc/deleteProfile/delete_profile_bloc.dart';
import '../bloc/deleteProfile/delete_profile_event.dart';
import '../bloc/deleteProfile/delete_profile_state.dart';
import '../bloc/updateProfile/update_profile_event.dart';
import '../bloc/updateProfile/update_profile_state.dart';
import '../bloc/userProfile/user_profile_bloc.dart';
import '../widgets/avatar_picker.dart';

class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({super.key});

  @override
  State createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  final nameController = TextEditingController();
  final phoneController = TextEditingController();

  late String userName;
  late String phone;
  late int avatarId;
  int? newAvatarId;

  bool initialized = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!initialized) {
      final args =
          ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
      userName = args['userName'];
      phone = args['phone'];
      avatarId = args['avatarImage'];
      nameController.text = userName;
      phoneController.text = phone;
      newAvatarId = avatarId;

      initialized = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    final resp = Responsive(context);
    return MultiBlocListener(
      listeners: [
        BlocListener<UpdateProfileBloc, UpdateProfileState>(
          listener: (context, state) {
            if (state is UpdateProfileSuccess) {
              context.read<UserProfileBloc>().add(GetProfileEvent());
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Profile updated successfully')),
              );
              Navigator.pop(context, true);
            } else if (state is UpdateProfileFailure) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.error)));
            }
          },
        ),
        BlocListener<DeleteProfileBloc, DeleteProfileState>(
          listener: (context, state) {
            if (state is DeleteProfileSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Account deleted successfully')),
              );
              Navigator.pop(context);
            } else if (state is DeleteProfileFailure) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.error)));
            }
          },
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: ColorManager.black,
          centerTitle: true,
          iconTheme: IconThemeData(color: ColorManager.yellow),
          title: Text(
            "Update Profile",
            style: s16Regular(color: ColorManager.yellow),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.only(bottom: resp.scaleHeight(40)),
          child: Column(
            children: [
              Center(
                child: Stack(
                  children: [
                    CircleAvatar(
                      radius: resp.scaleWidth(55),
                      backgroundImage: AssetImage(
                        AppImages.avatarMap[newAvatarId]!,
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            backgroundColor: Colors.transparent,
                            builder: (context) => AvatarPicker(
                              onAvatarSelected: (selectedAvatar) {
                                setState(() {
                                  newAvatarId = selectedAvatar;
                                });
                              },
                            ),
                          );
                        },
                        child: Container(
                          padding: EdgeInsets.all(resp.scaleWidth(6)),
                          decoration: BoxDecoration(
                            color: ColorManager.yellow,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.camera_alt,
                            size: resp.scaleWidth(20),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: resp.scaleHeight(24)),
              CustomTextField(
                controller: nameController,
                hint: "Full Name",
                hintStyle: s20Regular(color: ColorManager.white),
                style: s20Regular(color: ColorManager.white),
                prefixIcon: AppIcons.person,
              ),
              SizedBox(height: resp.scaleHeight(16)),
              CustomTextField(
                controller: phoneController,
                hint: "Phone Number",
                hintStyle: s20Regular(color: ColorManager.white),
                style: s20Regular(color: ColorManager.white),
                prefixIcon: AppIcons.phone,
              ),
              SizedBox(height: resp.scaleHeight(16)),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: resp.scaleWidth(12)),
                  child: Text(
                    "Reset Password",
                    style: s20Regular(color: ColorManager.white),
                  ),
                ),
              ),
              Spacer(),
              CustomButton(
                text: "Delete Account",
                style: s20Regular(color: ColorManager.white),
                bgColor: ColorManager.red,
                height: resp.scaleHeight(56),
                onTap: () {
                  final bloc = context.read<DeleteProfileBloc>();
                  bloc.add(DeleteProfileRequested());
                },
              ),
              SizedBox(height: resp.scaleHeight(16)),
              CustomButton(
                text: "Update Data",
                style: s20Regular(color: ColorManager.black),
                bgColor: ColorManager.yellow,
                height: resp.scaleHeight(56),
                onTap: () {
                  final bloc = context.read<UpdateProfileBloc>();
                  bloc.add(
                    UpdateProfileRequested(
                      nameController.text,
                      phoneController.text,
                      newAvatarId,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
