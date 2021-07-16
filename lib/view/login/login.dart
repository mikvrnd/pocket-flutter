import 'package:flutter_svg/svg.dart';
import 'package:pocket_app/common.dart';
import 'package:pocket_app/components/account_check.dart';
import 'package:pocket_app/components/rounded_input_field.dart';
import 'package:pocket_app/components/rounded_password_field.dart';
import 'package:pocket_app/constants.dart';
import 'package:pocket_app/view/login/signup.dart';

class LoginPage extends StatefulWidget {

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  String login = '';
  String pwd = '';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      key: new Key('main'),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              AppLocalizations.of(context)!.login_text.toUpperCase(),
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.03),
            SvgPicture.asset(
              "assets/icons/login.svg",
              height: size.height * 0.35,
            ),
            SizedBox(height: size.height * 0.03),
            RoundedInputField(
              key: new Key('pseudo'),
              hintText: AppLocalizations.of(context)!.pseudo,
              onChanged: (value) {},
            ),
            RoundedPasswordField(
              key: new Key('pwd'),
              onChanged: (value) {},
            ),
            RoundedButton(
              key: new Key('login'),
              text: AppLocalizations.of(context)!.login_button.toUpperCase(),
              press: () {},
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              key: new Key('account_check'),
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignUpPage();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class Background extends StatelessWidget {
  final Widget child;
  const Background({
    required Key key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: size.height,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Positioned(
              top: 0,
              left: 0,
              child: Image.asset(
                "assets/images/main_top.png",
                width: size.width * 0.35,
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Image.asset(
                "assets/images/login_bottom.png",
                width: size.width * 0.4,
              ),
            ),
            child,
          ],
        ),
      )
    );
    
  }
}