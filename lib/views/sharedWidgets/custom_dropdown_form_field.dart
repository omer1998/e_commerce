import 'package:flutter/material.dart';

class CustomDropdownFormField extends StatelessWidget {
  final List<String> options;
  final String hint;
  final Function(String?) onChanged;
  const CustomDropdownFormField(
      {super.key,
      required this.options,
      required this.hint,
      required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 45,
      child: DropdownButtonFormField(
        value: options[0],
        items: options
            .map((option) => DropdownMenuItem(
              // alignment: Alignment.centerRight,
                  child: Text(option),
                  value: option,
                ))
            .toList(),
        onChanged: onChanged,
        decoration: InputDecoration(
          label:Text(hint),
          hintText: hint,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
        ),
      ),
    );
  }
}
