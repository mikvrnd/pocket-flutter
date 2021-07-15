import 'package:flutter/material.dart';
import 'package:pocket_app/constants.dart';

class HomePage extends StatelessWidget {

  // Messages m = Messages();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: size.height*.45,
            decoration: BoxDecoration(
              color: primaryColor
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Bienvenue sur Pocket',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  Expanded(
                    child: GridView.count(
                      padding: EdgeInsets.only(top: 100),
                      crossAxisCount: 2,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () => print('se connecter pressed'),
                          child: Container(
                            margin: EdgeInsets.only(right: 5),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20)
                            ),
                            child: Center(child: Text('Se connecter')),
                          ),
                        ),
                        GestureDetector(
                          onTap: () => print('se connecter pressed'),
                          child: Container(
                            margin: EdgeInsets.only(right: 5),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20)
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ),
          ),
        ],  
      ),
    );
  }
}
