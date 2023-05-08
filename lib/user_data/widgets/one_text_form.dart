import 'package:flutter/material.dart';

class OneTextFormWidget extends StatelessWidget {
  const OneTextFormWidget({
    super.key,
    this.controller,
    this.labelText,
    this.canEdit = false,
    this.prefixIcon,
  });

  final TextEditingController? controller;
  final String? labelText;
  final bool? canEdit;
  final Icon? prefixIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      enabled: canEdit,
      decoration: InputDecoration(
        labelText: labelText,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.background,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color(0x00000000),
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color(0x00000000),
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color(0x00000000),
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        filled: true,
        fillColor: Theme.of(context).colorScheme.background,
        prefixIcon: prefixIcon,
      ),
      style: Theme.of(context).textTheme.bodyMedium,
    );
  }
}
