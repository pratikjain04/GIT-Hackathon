import 'package:flutter/material.dart';
import 'SkillsModel.dart';

class Skills extends StatefulWidget {
  @override
  _SkillsState createState() => _SkillsState();
}

class _SkillsState extends State<Skills> {

  _setValue(int index, bool value){
    setState(() {
      skills[index].isChecked = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: new ListView.builder(
          shrinkWrap: true,
          itemCount: 6,
          itemBuilder: (BuildContext context, int index){
            return CheckboxListTile(
                controlAffinity: ListTileControlAffinity.leading,    //puts checkbox on the left
                title: Text(skills[index].title),   //we only need the keys , i.e., the toppings and not the true and false values
                value: skills[index].isChecked,       //Receives only true or false
                onChanged: (bool value){_setValue(index,value);}
            );
          },
        ),
      ),
    );
  }
}
