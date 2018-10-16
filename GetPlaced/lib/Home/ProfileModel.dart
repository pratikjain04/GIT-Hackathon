import 'package:flutter/material.dart';

class ProfileModel {
  String title;
  Function action;

  ProfileModel(this.title, this.action);
}

List<ProfileModel> profile = [
    ProfileModel('Your Skills', (BuildContext context) {
      Navigator.of(context).pushNamed('/Skills');
    }),
   ProfileModel('Projects Applied For ', (BuildContext context) {
     Navigator.of(context).pushNamed('/ProjectsApplied');
   })
];