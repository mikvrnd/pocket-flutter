import 'package:pocket_app/constants.dart';

import '../common.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final VoidCallback press;
  final Color color, textColor;

  const RoundedButton({
    required Key key,
    required this.text,
    required this.press,
    this.color = primaryColor,
    this.textColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: size.width * 0.8,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(29),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
          color: color,
          child: TextButton(
            child: Text(
              text, 
              style: TextStyle(color: Colors.white)
            ),
            onPressed: press,
          ),
        ),
      ),
    );
  }
}