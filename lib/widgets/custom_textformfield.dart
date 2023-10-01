// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  TextEditingController? controller;
  String? Function(String?)? validator;

  CustomTextFormField({
    Key? key,
    this.controller,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          blurRadius: 100,
          offset: const Offset(0, 20),
          color: Colors.red.withOpacity(0.1),
        )
      ]),
      child: TextFormField(
        cursorColor: Colors.red,
        controller: controller,
        keyboardType: TextInputType.emailAddress,
        validator: validator,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                // width: 0.2.w,
                color: Colors.grey.withOpacity(0.5),
              ),
              borderRadius: BorderRadius.circular(15)),
          hintText: 'Last Name',
          labelText: 'Last Name',
          labelStyle: const TextStyle(
            color: Colors.grey,
          ),
          focusedErrorBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.red,
              ),
              borderRadius: BorderRadius.circular(15)),
          errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.red,
              ),
              borderRadius: BorderRadius.circular(15)),
        ),
      ),
    );
  }
}
