import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final String name;
  final String? initialValue;

  const CustomTextField({
    Key? key,
    required this.label,
    required this.name,
    this.initialValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final FocusNode focusNode = FocusNode(canRequestFocus: false);

    return Column(
      children: [
        IgnorePointer(
          child: FormBuilderTextField(
            name: name,
            // readOnly: true,
            focusNode: focusNode,
            decoration: InputDecoration(
              border: const UnderlineInputBorder(),
              labelText: label,
              labelStyle: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
              prefixIcon: Padding(
                padding: EdgeInsets.fromLTRB(0, 15, 10, 15),
                child: Text(
                  '*',
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              prefixIconConstraints: BoxConstraints(minWidth: 0, minHeight: 0),
            ),
          ),
        ),
      ],
    );
  }
}
