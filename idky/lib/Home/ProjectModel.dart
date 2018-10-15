import 'package:flutter/material.dart';

class ProjectModel extends StatefulWidget {
  @override
  _ProjectModelState createState() => new _ProjectModelState();
}

class _ProjectModelState extends State<ProjectModel> {
  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
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
                      Text(
                        'Develop a Mobile Application',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                          fontStyle: FontStyle.italic
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 5.0),
                        child: Text(
                          'by Microsoft',
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
                            Column(
                              children: <Widget>[
                                Text(
                                  'Domain',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FontStyle.italic,
                                    fontSize: 15.0
                                  ),
                                ),
                                Text(
                                  'App Development',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 11.0,
                                  ),
                                ),
                              ],
                            ),

                          ],
                        )
                      ),
                      Padding(
                          padding: EdgeInsets.only(top: 5.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(left: 80.0),
                                child: Text(
                                  'Develop a mobile application\nusing Flutter',
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
            ),
          );
        },
      ),
    );
  }
}
