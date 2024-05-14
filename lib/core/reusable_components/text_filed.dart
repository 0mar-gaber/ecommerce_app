import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

typedef Validate = String? Function(String?)?;

class EditText extends StatelessWidget {
  final String lapel;
  final bool obscureText;
  final IconButton? iconButton;
  final IconButton? prefixIconButton;
  final TextInputType keyboardType;
  final GlobalKey<FormState> formKay;
  final Validate validate;
  final TextEditingController controller;
  final int? maxLength ;

  const EditText({
    super.key,
    required this.lapel,
    required this.obscureText,
    this.iconButton,
    required this.keyboardType,
    required this.formKay,
    this.validate,
    this.prefixIconButton,
    required this.controller,
    this.maxLength
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validate,
      keyboardType: keyboardType,
      obscureText: obscureText,
      maxLength: maxLength,
      style: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
        color: Theme.of(context).colorScheme.primary,
      ),
      cursorColor: const Color.fromRGBO(0, 65, 130, 1.0),
      cursorErrorColor: Colors.red,
      decoration: InputDecoration(
        fillColor: Theme.of(context).colorScheme.background,
        filled: true,
        errorStyle: const TextStyle(color: Colors.red), // Set the color of the error message text to red
        contentPadding: REdgeInsets.only(
          left: 20,
          right: 23,
          bottom: 23,
        ),
        hintText: lapel,
        hintStyle:TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w300,
          color: Theme.of(context).colorScheme.primary.withOpacity(.6),
        ),
        suffixIcon: iconButton,
        prefixIcon: prefixIconButton,
        floatingLabelBehavior: FloatingLabelBehavior.never,

        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(25.r),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(25.r),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.r),
          borderSide:  BorderSide(color: const Color.fromRGBO(0, 65, 130, 1.0),width: .7.w),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.r),
          borderSide:  BorderSide(color: const Color.fromRGBO(0, 65, 130, 1.0),width: .7.w),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.r),
          borderSide:  BorderSide(color: const Color.fromRGBO(0, 65, 130, 1.0),width: .7.w),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide:  BorderSide(color: const Color.fromRGBO(0, 65, 130, 1.0),width: .7.w),
          borderRadius: BorderRadius.circular(25.r),
        ),
      ),
    );
  }
}
