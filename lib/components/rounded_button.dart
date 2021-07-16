import '../common.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final VoidCallback press;

  const RoundedButton({
    required Key key,
    required this.text,
    required this.press,
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
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
          color: Theme.of(context).primaryColor,
          child: TextButton(
            child: Text(
              text, 
              style: TextStyle(color: Theme.of(context).backgroundColor)
            ),
            onPressed: press,
          ),
        ),
      ),
    );
  }
}