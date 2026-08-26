import 'package:flutter/material.dart';

// ويدجت مخصص لحقول إدخال النصوص (Custom Text Form Field)
class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    this.labelText,
    this.icon,
    this.obscureText = false,
    this.controller,
    this.validator,
  });

  final String hintText;
  final String? labelText;
  final IconData? icon;
  final bool obscureText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      // التحقق من صحة البيانات (Validation)
      validator: validator ?? (value) {
        if (value == null || value.isEmpty) {
          return 'This field is required';
        }
        return null;
      },
      decoration: InputDecoration(
        // أيقونة في بداية الحقل (اختيارية)
        prefixIcon: icon != null ? Icon(icon) : null,
        hintText: hintText,
        labelText: labelText ?? hintText,
        
        // شكل الحدود في الحالة العادية
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.green),
        ),
        // شكل الحدود عند الضغط على الحقل
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.blue),
        ),
        // شكل الحدود في حالة وجود خطأ
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.red),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
