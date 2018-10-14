import 'package:flutter/material.dart';

class Page2 extends StatefulWidget {
  @override
  _Page2State createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  @override
  Widget build(BuildContext context) {
    double uni_height = MediaQuery.of(context).size.height;
    double uni_width = MediaQuery.of(context).size.width;

    return Stack(
      children: <Widget>[
        Image(
          image: AssetImage(
            'assets/Room1.jpg',
          ),
          colorBlendMode: BlendMode.darken,
          color: Colors.black54,
        ),
        Padding(
          padding: EdgeInsets.only(top: uni_height / 5, left: uni_width / 12),
          child: Container(
            height: uni_height / 2.8,
            width: uni_width / 1.2,
            child: Card(
              elevation: 10.0,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: uni_height / 7, left: uni_width / 2.6),
          child: ClipOval(
            child: Container(
              height: uni_height / 6.9565,
              width: uni_width / 3.913,
              child: Image(
                image: AssetImage('assets/Pratik.jpeg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Padding(
          padding:
              EdgeInsets.only(top: uni_height / 3.2, left: uni_width / 2.8),
          child: Column(
            children: <Widget>[
              Text(
                'Pratik Jain',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0,
                    fontFamily: 'Flamante'),
              ),
              Padding(padding: EdgeInsets.only(top: uni_height / 35)),
              Text(
                'pratik@gmail.com',
                style: TextStyle(fontSize: 14.0, fontFamily: 'Nexa'),
              ),
              Padding(padding: EdgeInsets.only(top: uni_height / 35)),
              Text(
                '9832110053',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14.0,
                    fontFamily: 'Nexa'),
              ),
            ],
          ),
        ),
        Padding(
          padding:
              EdgeInsets.only(top: uni_height / 1.65, left: uni_width / 7.5),
          child: Row(
            children: <Widget>[
              ImageIcon(
                new AssetImage('assets/hospital.png'),
                size: (uni_height * uni_width) / 3000,
                color: Colors.black45,
              ),
              Padding(
                padding: EdgeInsets.only(left: uni_width / 20),
              ),
              Text(
                'MedRooms',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30.0,
                    fontFamily: 'Flamante',
                    color: Colors.black45),
              )
            ],
          ),
        )
      ],
    );
  }
}
