import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../Projects/PracticeZone.dart';


class PracticeZoneModel extends StatefulWidget {
  @override
  _PracticeZoneModelState createState() => _PracticeZoneModelState();
}

class _PracticeZoneModelState extends State<PracticeZoneModel> {

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: practiceZones.length,
        itemBuilder: (BuildContext context, int index) {
          return PracticeCardWidget(practiceZone: practiceZones[index]);
        },
      ),
    );
  }
}

class PracticeCardWidget extends StatelessWidget {

  PracticeZone practiceZone;

  PracticeCardWidget({
    Key key,
    this.practiceZone
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 3.0, left: 5.0, right: 5.0),
        child: Container(
          height: 140.0,
          width: 100.0,
          child: Card(
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  FlatButton(
                    child: Text(
                      practiceZone.probName,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                          fontStyle: FontStyle.italic
                      ),
                    ),
                    onPressed: () => launchURL(practiceZone.url),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 5.0),
                    child: Text(
                      'by ' + practiceZone.source,
                      style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w300,
                          fontSize: 15.0
                      ),
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.only(top: 5.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(left: 80.0),
                            child: Text(
                              'Difficulty Level: ' + practiceZone.difficulty,
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 11.0,
                              ),
                            ),
                          ),
                        ],
                      )
                  )
                ],
              ),
            ),
          ),
        )
    );
  }
}


 launchURL(String url) async {

  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}