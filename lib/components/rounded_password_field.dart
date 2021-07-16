import 'package:pocket_app/components/text_field_container.dart';
import 'package:pocket_app/constants.dart';

import '../common.dart';

class RoundedPasswordField extends StatefulWidget {
  final ValueChanged<String> onChanged;
  final TextEditingController controller;

  const RoundedPasswordField({
    required Key key,
    required this.onChanged,
    required this.controller,
  }) : super(key: key);

  @override
  _RoundedPasswordFieldState createState() => _RoundedPasswordFieldState();
}

class _RoundedPasswordFieldState extends State<RoundedPasswordField> {

  bool _obscureText = true;

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      key: new Key('textfield'),
      child: TextField(
        controller: widget.controller,
        obscureText: _obscureText,
        onChanged: widget.onChanged,
        cursorColor: lPrimaryColor,
        decoration: InputDecoration(
          hintText: AppLocalizations.of(context)!.password,
          icon: Icon(
            Icons.lock,
            color: lPrimaryColor,
          ),
          suffixIcon: IconButton(
            onPressed: _toggle,
            icon: Icon(Icons.visibility),
            color: lPrimaryColor,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}