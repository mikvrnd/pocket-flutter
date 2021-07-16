import 'package:flutter/cupertino.dart';
import 'package:pocket_app/components/text_field_container.dart';
import 'package:pocket_app/constants.dart';

import '../common.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final TextEditingController controller;
  final ValueChanged<String> onChanged;

  const RoundedInputField({
    required Key key,
    required this.hintText,
    required this.controller,
    this.icon = Icons.person,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      key: new Key('textfield'),
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        cursorColor: lPrimaryColor,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: lPrimaryColor,
          ),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}