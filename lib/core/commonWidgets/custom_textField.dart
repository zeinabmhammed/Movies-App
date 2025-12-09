import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movies_app/core/appColors/app_colors.dart';
import '../responsive/responsive.dart';

class CustomTextField extends StatelessWidget {
  final String hint;
  final TextEditingController? controller;
  final String? prefixIcon;
  final String? suffixIcon;
  final VoidCallback? onSuffixTap;
  final ValueChanged<String>? onChanged;
  final bool isPassword;
  final TextInputType keyboardType;

  // ⭐ هنا أضفنا الـ validator
  final String? Function(String?)? validator;

  const CustomTextField({
    super.key,
    required this.hint,
    this.controller,
    this.prefixIcon,
    this.suffixIcon,
    this.onSuffixTap,
    this.onChanged,
    this.isPassword = false,
    this.keyboardType = TextInputType.text,
    this.validator, // ⭐ الجديد
  });

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    double baseWidth = 380;
    double baseHeight = 56.72;

    return Container(
        width: responsive.scaleWidth(baseWidth),
        height: responsive.scaleHeight(baseHeight),

        // ⭐ هنا بدل TextField → TextFormField
        child: TextFormField(
            controller: controller,
            obscureText: isPassword,
            keyboardType: keyboardType,
            onChanged: onChanged,

            // ⭐ أهم إضافة
            validator: validator,

            style: const TextStyle(color: AppColors.white),

            decoration: InputDecoration(
              hintText: hint,
              hintStyle: const TextStyle(color: AppColors.white),
              floatingLabelBehavior: FloatingLabelBehavior.auto,
              prefixIcon: prefixIcon != null
                  ? Padding(
                padding: const EdgeInsets.all(12),
                child: SvgPicture.asset(prefixIcon!, width: 24, height: 24),
              )
                  : null,
              suffixIcon: suffixIcon != null
                  ? GestureDetector(
                onTap: onSuffixTap,
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: SvgPicture.asset(suffixIcon!, width: 24, height: 24),
                ),
              )
                  : null,
              prefixIconConstraints: const BoxConstraints(
                minWidth: 0,
                minHeight: 0,
              ),
              suffixIconConstraints: const BoxConstraints(
                minWidth: 0,
                minHeight: 0,
              ),
              filled: true,
              fillColor: AppColors.grey,
              contentPadding: const EdgeInsets.symmetric(
                vertical: 14,
                horizontal: 16,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide.none,
              ),
            ),
            ),
        );
    }
}
