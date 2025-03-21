import 'package:flutter/material.dart';
import 'package:fruit_hup_dashboard/core/utils/app_text_styles.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    required this.textInputType,
    this.suffixicon,
    this.onSaved,
    this.obscureText = false,
    this.maxLines,
  });

  final String hintText;
  final int? maxLines;
  final TextInputType textInputType;
  final Widget? suffixicon;
  final void Function(String?)? onSaved;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
      obscureText: obscureText,
      onSaved: onSaved,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'الحقل مطلوب';
        }
        return null;
      },

      keyboardType: textInputType,
      decoration: InputDecoration(
        suffixIcon: suffixicon,
        hintStyle: TextStyles.bold13.copyWith(color: Color(0xff949D9E)),
        hintText: hintText,
        filled: true,
        fillColor: Color(0xffF9FAFA),
        border: buildBorder(),
        enabledBorder: buildBorder(),
        focusedBorder: buildBorder(),
      ),
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
      borderSide: BorderSide(width: 1, color: Color(0xffE6E9E9)),
    );
  }
}
