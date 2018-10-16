import 'dart:async';
import 'package:flutter/material.dart';
import '../Projects/CompanyProject.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProjectAppliedFor extends StatefulWidget {
  @override
  _ProjectAppliedForState createState() => new _ProjectAppliedForState();
}

class _ProjectAppliedForState extends State<ProjectAppliedFor> {
  List<Map<String, dynamic>> ongoingProjectList = List();
  CollectionReference collectionReference;

  Future<QuerySnapshot> _getProjectList() async {
    collectionReference = Firestore.instance.collection('projects');
    QuerySnapshot snapshot = await collectionReference.getDocuments();
    return snapshot;
  }

  @override
  void initState() {
    super.initState();
    _getProjectList().then((querysnapshot){
      querysnapshot.documents.forEach((docsnapshot){
        setState(() {
          ongoingProjectList.add(docsnapshot.data);
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Ongoing Projects',
        ),
        centerTitle: true,
      ),
      body: (ongoingProjectList.isNotEmpty)
          ? Scrollbar(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: ongoingProjectList.length,
            itemBuilder: (BuildContext context, int index) {
              return ProjectCardWidget(
                  ongoingProject: ongoingProjectList[index]);
            },
          ),
        ) : Padding(
        padding: EdgeInsets.only(top: 10.0),
        child: Center(
            child: Text(
              'Not Applied to any project / Still Loading',
              style: TextStyle(fontWeight: FontWeight.w400),
            ),
        ),
      ),
    );
  }
}

class ProjectCardWidget extends StatefulWidget {
  final Map<String, dynamic> ongoingProject;

  @override
  _ProjectCardWidgetState createState() => _ProjectCardWidgetState();

  ProjectCardWidget({Key key, this.ongoingProject}) : super(key: key);
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
                            widget.ongoingProject['projectName'],
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13.0),
                          ),
                          Padding(padding: EdgeInsets.only(top: 25.0)),
                          Text(widget.ongoingProject['longDesc']),
                          Padding(padding: EdgeInsets.only(top: 25.0)),
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
                        widget.ongoingProject['projectName'],
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                            fontStyle: FontStyle.italic),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 5.0),
                        child: Text(
                          'by ' + widget.ongoingProject['companyName'],
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
                                    widget.ongoingProject['domainName'],
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
                                    widget.ongoingProject['description'],
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
