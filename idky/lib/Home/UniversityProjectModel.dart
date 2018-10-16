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

class ProjectCardWidget extends StatelessWidget {

  final UniversityProject universityProject;

  ProjectCardWidget({
    Key key, this.universityProject
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
                  universityProject.projectName,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                      fontStyle: FontStyle.italic
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 5.0),
                  child: Text(
                    'by ' + universityProject.mentorName,
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
                              universityProject.domainName,
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
                            universityProject.description,
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

