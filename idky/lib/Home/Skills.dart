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
    return Scaffold(
      appBar: AppBar(
        title: Text('Select your skills'),
        centerTitle: true,
      ),
      body: Stack(

        children:
        [
          Column(
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
              RaisedButton(
                color: Colors.blue,
                onPressed: () {

                },
                child: Text(
                  'Submit Your Choices',
                  style: TextStyle(
                      color: Colors.white
                  ),
                ),
              )
            ],
          ),
        ]
      ),
    );
  }
}
