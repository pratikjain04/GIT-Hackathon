import 'package:flutter/material.dart';

class Page1 extends StatefulWidget {
  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> {



  @override
  Widget build(BuildContext context) {

    double uni_height = MediaQuery.of(context).size.height;
    return Container(

      child: ListView.builder(
          itemCount: 2,
          itemBuilder: (BuildContext context, int index){
            return NotificationItem();
          }),
    );
  }
}

class NotificationItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    double uni_width = MediaQuery.of(context).size.width;
    double uni_height = MediaQuery.of(context).size.height;
    return Container(
        height: 100.0,
      child: Card(
        child: Row(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.notifications),
              onPressed: (){},
              color: Colors.green,
            ),
            Padding(padding: EdgeInsets.only(left: uni_width/20)),
            Text('Your MedRoom has Successfully\n been Booked!',
              style: TextStyle(
                  color: Colors.green,
                  fontSize: 18.0,
                  fontFamily: 'Nexa',
              ),),
          ],
        ),
      ),
    );
  }
}

