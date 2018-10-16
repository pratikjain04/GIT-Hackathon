import 'dart:async';
import 'package:flutter/material.dart';
import '../Projects/CompanyProject.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CompanyProjectModel extends StatefulWidget {
  @override
  _CompanyProjectModelState createState() => new _CompanyProjectModelState();
}

class _CompanyProjectModelState extends State<CompanyProjectModel> {
  List<CompanyProject> filteredCompanyProjectList = List();
  DocumentReference documentReference;

  Future<DocumentSnapshot> _getProjectList() async {
    documentReference = Firestore.instance.document('user/skills');
    DocumentSnapshot snapshot = await documentReference.get();
    return snapshot;
  }

  @override
  void initState() {
    super.initState();
    _getProjectList().then((docsnapshot) {
      docsnapshot.data['domains'].forEach((domain) {
        companyProjects.forEach((project) {
          if (domain == project.domainName)
            setState(() {
              filteredCompanyProjectList.add(project);
            });
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return (filteredCompanyProjectList.isNotEmpty)
        ? Scaffold(
            body: Scrollbar(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: filteredCompanyProjectList.length,
                itemBuilder: (BuildContext context, int index) {
                  return ProjectCardWidget(
                      companyProject: filteredCompanyProjectList[index]);
                },
              ),
            ),
          )
        : Padding(
            padding: EdgeInsets.only(top: 10.0),
            child: Center(
              child: Text(
                'No Projects matcing your skillset / Skills not updated',
                style: TextStyle(fontWeight: FontWeight.w400),
              ),
            ),
          );
  }
}

class ProjectCardWidget extends StatefulWidget {
  final CompanyProject companyProject;

  @override
  _ProjectCardWidgetState createState() => _ProjectCardWidgetState();

  ProjectCardWidget({Key key, this.companyProject}) : super(key: key);
}

class _ProjectCardWidgetState extends State<ProjectCardWidget> {
  final _scaffoldKey = new GlobalKey<ScaffoldState>();
  DocumentReference documentReference;

  void _addOngoingProject(Map<String, String> data) async {
    documentReference = Firestore.instance.document('projects/${data['projectName']}');
    await documentReference.setData(data);
  }

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
                            widget.companyProject.projectName,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Padding(padding: EdgeInsets.only(top: 25.0)),
                          Text(widget.companyProject.longDesc,),
                          Padding(padding: EdgeInsets.only(top: 25.0)),
                          RaisedButton(
                            elevation: 5.0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25.0)),
                            onPressed: () {
                              Map<String, String> data = <String, String>{
                                "projectName" : widget.companyProject.projectName,
                                "companyName" : widget.companyProject.companyName,
                                "domainName" : widget.companyProject.domainName,
                                "description" : widget.companyProject.description,
                                "longDesc" : widget.companyProject.longDesc
                              };
                              _addOngoingProject(data);
                            },
                            child: Text('Apply'),
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
              onTap: () {
                _showModalSheet();
              },
              child: Card(
                child: Padding(
                  padding: EdgeInsets.only(left: 5.0, top: 15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        widget.companyProject.projectName,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                            fontStyle: FontStyle.italic),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 5.0),
                        child: Text(
                          'by ' + widget.companyProject.companyName,
                          style: TextStyle(
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w300,
                              fontSize: 15.0),
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
                                    widget.companyProject.domainName,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 11.0,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )),
                      Padding(
                          padding: EdgeInsets.only(top: 5.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(left: 80.0),
                                child: SingleChildScrollView(
                                  child: Text(
                                    widget.companyProject.description,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 11.0,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ))
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
