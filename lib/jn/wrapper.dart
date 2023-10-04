import 'package:find_food_application/widgets/custom_textformfield.dart';
import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          CustomTextFormField(
            validator: (value) {
              if (value!.isEmpty) {
                return 'Request';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}
