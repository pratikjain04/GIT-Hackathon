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
    _getProjectList().then((docsnapshot){
      docsnapshot.data['domains'].forEach((domain){
        companyProjects.forEach((project){
          if(domain == project.domainName)
            setState(() {
              filteredCompanyProjectList.add(project);
            });
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return (filteredCompanyProjectList.isNotEmpty) ? Scrollbar(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: filteredCompanyProjectList.length,
        itemBuilder: (BuildContext context, int index) {
          return ProjectCardWidget(companyProject: filteredCompanyProjectList[index]);
        },
      ),
    ) : Padding(
      padding: EdgeInsets.only(top: 10.0),
      child: Center(
        child: Text(
          'No Projects matcing your skillset / Skills not updated',
          style: TextStyle(
            fontWeight: FontWeight.w400
          ),
        ),
      ),
    );
  }
}

class ProjectCardWidget extends StatelessWidget {

  final CompanyProject companyProject;

  ProjectCardWidget({
    Key key, this.companyProject
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
                Text(
                  companyProject.projectName,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                      fontStyle: FontStyle.italic
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 5.0),
                  child: Text(
                    'by ' + companyProject.companyName,
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
                              companyProject.domainName,
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
                            companyProject.description,
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
  }
}

