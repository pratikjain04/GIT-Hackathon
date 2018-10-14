import 'package:flutter/material.dart';
import '../../Room/room.dart';
import '../RoomView.dart';

//THE HOME

class Page0 extends StatefulWidget {
  @override
  _Page0State createState() => _Page0State();
}

class _Page0State extends State<Page0> {
  @override
  Widget build(BuildContext context) {
    double uni_height = MediaQuery.of(context).size.height;
    return Container(
      child: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) {
                return CardItemWidget(testRoom[index]);
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: (uni_height / 42.666)),
          )
        ],
      ),
    );
  }
}

class CardItemWidget extends StatelessWidget {
  Room _room;

  CardItemWidget(this._room);

  @override
  Widget build(BuildContext context) {
    double uni_width = MediaQuery.of(context).size.width;
    double uni_height = MediaQuery.of(context).size.height;

    return Container(
      padding: EdgeInsets.only(
          top: uni_height / 42.666,
          left: uni_width / 24,
          right: uni_width / 24
      ),
      child: new Card(
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _room.roomImages != null
                ? new Image.asset(
                    _room.roomImages[0],
                    fit: BoxFit.cover,
                  )
                : new Container(),
            Padding(
              padding: EdgeInsets.only(
                  top: uni_height / 40,
                  left: uni_width / 22.5,
                  bottom: uni_height / 80,
                  right: uni_width / 22.5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  new Flexible(
                    child: new Text(
                      _room.roomName,
                      style: new TextStyle(fontSize: 20.0),
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(right: uni_width / 45),
                        child: new Icon(Icons.star),
                      ),
                      new Text(_room.rating.toString()),
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: uni_width / 22.5),
              child: new Text(
                "Distance: 2.0 kms",
                style: new TextStyle(fontSize: 18.0),
              ),
            ),
            new ButtonBar(
              children: <Widget>[
                new FlatButton(
                  onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => new RoomViewWrapper(_room))),
                  child: new Text("View details",
                      style: new TextStyle(color: Colors.green)),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
