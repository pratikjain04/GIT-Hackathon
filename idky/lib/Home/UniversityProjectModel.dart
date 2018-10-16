import 'package:flutter/material.dart';
import '../Projects/UniversityProject.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class UniversityProjectModel extends StatefulWidget {
  @override
  _UniversityProjectModelState createState() => new _UniversityProjectModelState();
}

class _UniversityProjectModelState extends State<UniversityProjectModel> {

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: universityProjects.length,
        itemBuilder: (BuildContext context, int index) {
          return ProjectCardWidget(universityProject: universityProjects[index],);
        },
      ),
    );
  }
}

class ProjectCardWidget extends StatefulWidget {
  @override
  _ProjectCardWidgetState createState() => _ProjectCardWidgetState();

  final UniversityProject universityProject;

  ProjectCardWidget({
    Key key, this.universityProject
  }) : super(key: key);

}


class _ProjectCardWidgetState extends State<ProjectCardWidget> {

  final _scaffoldKey = new GlobalKey<ScaffoldState>();

  void _showModalSheet() {
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return Column(
            children: <Widget>[
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    color: Colors.white,
                    child: Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(top: 10.0),
                          ),
                          Text(
                            widget.universityProject.projectName,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Padding(padding: EdgeInsets.only(top: 25.0)),
                          Text(widget.universityProject.longdesc,),
                          Padding(padding: EdgeInsets.only(top: 25.0)),
                          RaisedButton(
                            elevation: 5.0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25.0)),
                            onPressed: () {
                              //todo: ATEEK
                            },
                            child: Text('Join Project'),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.0,
      width: 200.0,
      child: Scaffold(
        key: _scaffoldKey,
        body: Padding(
          padding: EdgeInsets.only(top: 3.0, left: 5.0, right: 5.0),
          child: Container(
            child: GestureDetector(
              onTap: (){
                _showModalSheet();
              },
              child: Card(
                child: Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        widget.universityProject.projectName,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                            fontStyle: FontStyle.italic
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 5.0),
                        child: Text(
                          'by ' + widget.universityProject.mentorName,
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
                                    widget.universityProject.domainName,
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
                                  widget.universityProject.description,
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
          ),
        ),
      ),
    );
  }
}

