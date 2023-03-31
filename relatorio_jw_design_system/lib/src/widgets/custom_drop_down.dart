// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:relatorio_jw_design_system/relatorio_jw_design_system.dart';

class CustomDropDown extends StatelessWidget {
  final void Function(Object?)? onChanged;
  final String labelText;
  final Object? value;
  final String? Function(Object?)? validator;
  final List<DropdownMenuItem<Object?>>? items;

  const CustomDropDown({
    Key? key,
    required this.onChanged,
    required this.labelText,
    this.value,
    this.validator,
    this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<Object?>(
      validator: validator,
      value: value,
      items: items,
      onChanged: onChanged,
      decoration: InputDecoration(labelText: labelText),
      icon: const Icon(Icons.keyboard_arrow_down, color: CustomColors.greyDark),
    );
  }
}
