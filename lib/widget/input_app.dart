import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InputApp extends StatefulWidget {
  final Function(String) onChanged;
  final bool exp;
  final String labelText;
  final String initialValue;

  const InputApp({
    Key? key,
    required this.onChanged,
    this.exp = false,
    required this.labelText,
    this.initialValue = '',
  }) : super(key: key);

  @override
  State<InputApp> createState() => _InputAppState();
}

class _InputAppState extends State<InputApp> {
  late TextEditingController controller;

  @override
  void initState() {
     controller = TextEditingController(text: widget.initialValue);
    super.initState();
    void dispose() {
      controller.dispose();
      super.dispose();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: widget.exp ? 0.0 : 16),
      child: TextField(
        controller: controller, 
        onChanged: (value) {
          widget.onChanged(value); // Call the callback with the updated value
        },
        decoration: InputDecoration(
            border: const OutlineInputBorder(), labelText: widget.labelText),
      ),
    );
  }
}
