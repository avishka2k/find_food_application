import 'package:find_food_application/widgets/custom_textformfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class MyWidget extends StatefulWidget {
  const MyWidget();

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  TextEditingController _firstName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFormField(
          controller: _firstName,
          validator: (value) {
            if (value!.isEmpty) {
              return 'Request';
            }
            return null;
          },
        ),
      ],
    );
  }
}
