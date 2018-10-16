import 'dart:async';

import 'package:flutter/material.dart';
import 'SkillsModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Skills extends StatefulWidget {
  @override
  _SkillsState createState() => _SkillsState();
}

class _SkillsState extends State<Skills> {

  List<SkillsModel> savedSkills = skills;
  DocumentReference documentReference;
  bool changed = false;

  void _setValue(int index, bool value){
    setState(() {
      savedSkills[index].isChecked = value;
    });
  }

  void _submitChoices() async {
    documentReference = Firestore.instance.document('user/skills');
    List<String> savedSkillList = List();
    savedSkills.forEach((skill){
      if(skill.isChecked == true)
        savedSkillList.add(skill.title);
    });
    await documentReference.updateData(<String, List<String>>{
      "domains" : savedSkillList
    });
  }

  Future<DocumentSnapshot> _getSavedSkills() async {
    documentReference = Firestore.instance.document('user/skills');
    DocumentSnapshot snapshot = await documentReference.get();
    return snapshot;
  }

  @override
  void initState() {
    super.initState();
    _getSavedSkills().then((docsnapshot){
      docsnapshot.data['domains'].forEach((domain){
          for(int i = 0; i < savedSkills.length; i++){
            if(savedSkills[i].title == domain){
              setState(() {
                savedSkills[i].isChecked = true;
                changed = true;
              });
            }
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double uni_height = MediaQuery.of(context).size.height;
    double uni_width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Select your skills'),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          (changed == true) ? Container(
            child: new ListView.builder(
              shrinkWrap: true,
              itemCount: 6,
              itemBuilder: (BuildContext context, int index) {
                return CheckboxListTile(
                    controlAffinity: ListTileControlAffinity.leading,
                    //puts checkbox on the left
                    title: Text(savedSkills[index].title),
                    //we only need the keys , i.e., the toppings and not the true and false values
                    value: savedSkills[index].isChecked,
                    //Receives only true or false
                    onChanged: (bool value) {
                      _setValue(index, value);
                    }
                );
              },
            ),
          ) : CircularProgressIndicator(),
          Flexible(
            child: Stack(
              children: [
                Positioned(
                  bottom: uni_height / 14.62,
                  left: uni_width / 3.4,
                  child: Center(
                    child: RaisedButton(
                      color: Colors.blue,
                      onPressed: _submitChoices,
                      child: Text(
                        'Submit Your Choices',
                        style: TextStyle(
                            color: Colors.white
                        ),
                      ),
                    ),
                  ),
                ),
              ]
            ),
          ),
        ],
      ),
    );
  }
}
