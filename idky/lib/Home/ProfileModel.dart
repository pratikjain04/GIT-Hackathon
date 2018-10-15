import 'package:flutter/material.dart';

class ProfileModel{

  bool _onClick = false;
  String title;
  Function action;

  ProfileModel(this._onClick, this.title, this.action);


}

List<ProfileModel> profile = [


    ProfileModel(false, 'Your Skills', (BuildContext context) {
      Navigator.of(context).pushNamed('/Skills');
    }),
   ProfileModel(false, 'Projects Applied For ', (BuildContext context) {
     Navigator.of(context).pushNamed('/ProjectsApplied');
   }),

];