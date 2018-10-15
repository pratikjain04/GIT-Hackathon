import 'package:flutter/material.dart';

class SkillsModel {

  bool isChecked;
  String title;

  SkillsModel(this.isChecked, this.title);

}

List<SkillsModel> skills = [

  SkillsModel(false, 'Web Developemnt'),
  SkillsModel(false, 'App Developemnt',),
  SkillsModel(false, 'Machine Learning',),
  SkillsModel(false, 'Internet of Things',),
  SkillsModel(false, 'Designing',),
  SkillsModel(false, 'Marketing',),

];