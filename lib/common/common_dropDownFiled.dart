import 'package:flutter/material.dart';

class LabeledDropdown extends StatelessWidget {
  final String label;
  final List<String> options;
  final String? initialValue;
  final Function(String?) onChanged;

  const LabeledDropdown({
    Key? key,
    required this.label,
    required this.options,
    required this.onChanged,
    this.initialValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text("$label "),
        DropdownButton<String>(
          value: initialValue,
          items: options.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: onChanged,
        ),
      ],
    );
  }
}

