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
  DocumentReference documentReference;

  final GlobalKey<ScaffoldState> _scaffoldstate = new GlobalKey<ScaffoldState>();

  void _addOngoingProject(Map<String, String> data) async {
    documentReference = Firestore.instance.document('projects/${data['projectName']}');
    await documentReference.setData(data);
  }


  void _showSnackBar(String value) {
    if (value.isEmpty)
      return;
    _scaffoldstate.currentState.showSnackBar(
        new SnackBar(
          content: Row(
            children: <Widget>[
              new Text(value, style: TextStyle(color: Colors.white),),
              Padding(padding: EdgeInsets.only(left: 100.0),),
              Icon(Icons.check, color: Colors.white,)
            ],
          ),
          backgroundColor: Colors.green,)
    );
  }

  void _showModalSheet() {
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return Scaffold(
            key: _scaffoldstate,
            body: Column(
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
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0),
                            ),
                            Padding(padding: EdgeInsets.only(top: 25.0)),
                            Text(widget.universityProject.longDesc,),
                            Padding(padding: EdgeInsets.only(top: 25.0)),
                            RaisedButton(
                              color: Colors.blue,
                              splashColor: Colors.lightBlueAccent,
                              elevation: 5.0,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25.0)),
                              onPressed: () {
                                Map<String, String> data = <String, String>{
                                  "projectName" : widget.universityProject.projectName,
                                  "companyName" : widget.universityProject.companyName,
                                  "domainName" : widget.universityProject.domainName,
                                  "description" : widget.universityProject.description,
                                  "longDesc" : widget.universityProject.longDesc
                                };
                                _addOngoingProject(data);
                                _showSnackBar('Project Joined Successfully');
                              },

                              child: Text('Join Project', style: TextStyle(color: Colors.white)),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
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
                          'by ' + widget.universityProject.companyName,
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

