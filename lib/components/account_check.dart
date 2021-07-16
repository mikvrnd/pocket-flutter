import 'package:pocket_app/constants.dart';

import '../common.dart';

class AlreadyHaveAnAccountCheck extends StatelessWidget {
  final bool login;
  final VoidCallback press;
  const AlreadyHaveAnAccountCheck({
    required Key key,
    this.login = true,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          login ? AppLocalizations.of(context)!.no_account : AppLocalizations.of(context)!.already_account,
          style: TextStyle(color: lPrimaryColor),
        ),
        GestureDetector(
          onTap: press,
          child: Text(
            login ? ' ' + AppLocalizations.of(context)!.signup : ' ' + AppLocalizations.of(context)!.login_text,
            style: TextStyle(
              color: lPrimaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }
}