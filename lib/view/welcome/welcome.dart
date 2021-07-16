import 'dart:math';

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pocket_app/view/login/login.dart';
import 'package:pocket_app/view/login/signup.dart';

import '../../common.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawerEnableOpenDragGesture: false,
      body: Body(),
      endDrawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: Text('Item 1'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: Text('Item 2'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
          ],
        ),
      ),
    );
  }
}

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // This size provide us total height and width of our screen
    return Background(
      key: new Key('main'),
      child: Container(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                AppLocalizations.of(context)!.welcome,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Theme.of(context).primaryColor
                ),
              ),
              SizedBox(height: size.height * 0.1),
              RoundedButton(
                key: new Key('login'),
                text: AppLocalizations.of(context)!.login_button.toUpperCase(),
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return LoginPage();
                      },
                    ),
                  );
                },
              ),
              RoundedButton(
                key: new Key('signup'),
                text: AppLocalizations.of(context)!.signup.toUpperCase(),
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
              )
            ],
          ),
        ),
      ),
      
    );
  }
}

class Background extends StatefulWidget {
  final Widget child;
  const Background({
    required Key key,
    required this.child,
  }) : super(key: key);

  @override
  _BackgroundState createState() => _BackgroundState();
}

class _BackgroundState extends State<Background> with SingleTickerProviderStateMixin {

  bool toggle = false;
  bool isDarkMode = AdaptiveThemeMode.dark.isDark;

  late AnimationController _controller;
  late Animation _animation;

  Alignment alignmentBtn1 = Alignment(1, -0.98);
  Alignment alignmentBtn2 = Alignment(1, -0.98);

  double dimension = 50.0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
      reverseDuration: Duration(milliseconds: 300)
    );

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
      reverseCurve: Curves.easeIn
    );

    _controller.addListener(() {
      setState(() {
        
      });
    });
  
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: Stack(
        children: <Widget>[
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Container(
                child: Stack(
                  children: <Widget>[
                    AnimatedAlign(
                      alignment: alignmentBtn1,
                      curve: toggle ? Curves.easeIn: Curves.elasticOut,
                      duration: toggle ? Duration(milliseconds: 200) : Duration(milliseconds: 400),
                      child: AnimatedContainer(
                        duration: toggle ? Duration(milliseconds: 200) : Duration(milliseconds: 400),
                        curve: toggle ? Curves.easeIn : Curves.elasticOut,
                        height: dimension,
                        width: dimension,
                        decoration: BoxDecoration(
                          color: Theme.of(context).accentColor,
                          shape: BoxShape.circle
                        ),
                        child: Material(
                          color: Colors.transparent,
                          child: IconButton(
                            icon: SvgPicture.asset('assets/icons/menu.svg'),
                            onPressed: () => print('pressed'),
                          ),
                        ),
                      ), 
                    ),
                    AnimatedAlign(
                      alignment: alignmentBtn2,
                      curve: toggle ? Curves.easeIn: Curves.elasticOut,
                      duration: toggle ? Duration(milliseconds: 200) : Duration(milliseconds: 400),
                      child: AnimatedContainer(
                        duration: toggle ? Duration(milliseconds: 200) : Duration(milliseconds: 400),
                        curve: toggle ? Curves.easeIn : Curves.elasticOut,
                        height: dimension,
                        width: dimension,
                        decoration: BoxDecoration(
                          color: isDarkMode ? Theme.of(context).accentColor : Colors.black,
                          shape: BoxShape.circle
                        ),
                        child: Material(
                          color: Colors.transparent,
                          child: IconButton(
                            icon: isDarkMode ? Icon(Icons.dark_mode) : Icon(Icons.light_mode) ,
                            onPressed: () {
                              if (isDarkMode) {
                                AdaptiveTheme.of(context).setLight();
                              } else {
                                AdaptiveTheme.of(context).setDark();
                              }
                              setState(() {
                                isDarkMode = !isDarkMode;
                              });
                            },
                          ),
                        ),
                      ), 
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        child: Transform.rotate(
                          angle: _animation.value * pi,
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 400),
                            curve: Curves.easeOut,
                            height: toggle ? 70 : 60,
                            width: toggle ? 70 : 60,
                            decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              shape: BoxShape.circle
                            ),
                            child: Material(
                              color: Colors.transparent,
                              child: IconButton(
                                icon: SvgPicture.asset('assets/icons/menu.svg'),
                                onPressed: () {
                                  setState(() {
                                    if (!toggle) {
                                      _controller.forward();
                                      Future.delayed(Duration(milliseconds: 10), () {
                                        alignmentBtn1 = Alignment(1, -0.77);
                                        alignmentBtn2 = Alignment(0.5, -0.98);
                                      });
                                    } else {
                                      _controller.reverse();
                                      Future.delayed(Duration(milliseconds: 10), () {
                                        alignmentBtn1 = Alignment(1, -0.98);
                                        alignmentBtn2 = Alignment(1, -0.98);
                                      });
                                    }
                                    toggle = !toggle;
                                  });
                                },
                              ),
                            ),
                          )
                        ),
                      )
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            height: size.height,
              width: double.infinity,
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Positioned(
                    top: 0,
                    left: 0,
                    child: Image.asset(
                      "assets/images/main_top.png",
                      width: size.width * 0.3,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    child: Image.asset(
                      "assets/images/main_bottom.png",
                      width: size.width * 0.2,
                    ),
                  ),
                  widget.child,
                ],
              ),
          ),
          
        ],
      ),
    );
  }
}