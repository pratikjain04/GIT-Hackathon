import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        duration: Duration(milliseconds: 2500), vsync: this);
    animation = CurvedAnimation(parent: controller, curve: Curves.decelerate);

    controller.addListener(() => setState(() {}));
    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double uni_height = MediaQuery.of(context).size.height;
    double uni_width = MediaQuery.of(context).size.width;

    return Scaffold(
        body: Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Container(
          color: Color(0xFF3C4D5D).withOpacity(0.75),
        ),
        Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: uni_height / 2 - uni_height / 3.2),
            ),
            Container(
                height: (animation.value * 120),
                width: (animation.value * 120),
                child: Image(
                  image: AssetImage('assets/logo.png'),
                  fit: BoxFit.cover,
                )),

            Text(
              'Presents',
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'ArimaMadurai',
                  fontSize: 35.0),
            ),
            Text(
              'GetPlaced',
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Optimus',
                  fontSize: 50.0,
                  fontWeight: FontWeight.normal),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(top: uni_height / 3),
          child: Center(
            child: Container(
              width: uni_width / 1.09,
              height: uni_height / 12.8,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
                elevation: 30.0,
                onPressed: () {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      '/CollegeSelection', (Route<dynamic> route) => false);
                },
                color: Color(0xFFFF000F),
                child: Row(
                  children: <Widget>[
                    Image(
                        image: AssetImage('assets/whitegooglelogo.png'),
                        height: uni_height / 32,
                        width: uni_width / 18),
                    Padding(padding: EdgeInsets.all(uni_width / 14.4)),
                    Text(
                      'Sign In with Google',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: uni_width / 20,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    ));
  }
}
