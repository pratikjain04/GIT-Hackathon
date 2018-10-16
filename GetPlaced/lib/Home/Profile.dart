import 'package:flutter/material.dart';
import 'ProfileModel.dart';


class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  String _text = 'FIRST/LAST NAME';
  bool _onClick = false;

  @override
  Widget build(BuildContext context) {
    double uni_height = MediaQuery.of(context).size.height;
    double uni_width = MediaQuery.of(context).size.width;

    return ListView(
        children: <Widget>[
          Stack(
              children: [
                Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image(
                        image: AssetImage('assets/Tech.png'),
                      ),
                    ]
                ),
                Positioned(
                  right: uni_width / 41.1,
                  top: uni_height / 73.1,
                  child: IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: (){
                      setState(() {
                        if(_onClick == false) {
                          _onClick = true;
                        }
                        else
                          _onClick = false;
                      });
                    },
                    color: Colors.blueGrey,
                  ),
                ),
                Positioned(
                  left: uni_width / 10.27,
                  top: uni_height / 5.22,
                  child: Row(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white),
                          color: Colors.blue
                        ),
                        height: uni_height / 12.18,
                        width: uni_width / 6.85,
                        child: Center(
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.white, width: 3.0),
                            ),
                            height: uni_height / 14.62,
                            width: uni_width / 8.22,
                            child: Center(
                                child: Icon(Icons.account_circle, color: Colors.white)
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: (_onClick == false) ? Text(
                          _text,
                          style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.blueGrey,
                              fontWeight: FontWeight.bold
                          ),
                        ) : Container(
                          width: uni_width / 2.055,
                          child: TextField(
                            autofocus: true,
                            decoration: InputDecoration(
                              labelText: 'Edit username',
                              labelStyle: TextStyle(color: Colors.blueGrey, fontSize: 20.0),
                              hintText: 'Username',
                              hintStyle: TextStyle(color: Colors.blueGrey, fontSize: 20.0),
                              enabled: true,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            style: TextStyle(
                                color: Colors.blueGrey,
                                fontSize: 20.0
                            ),
                            onSubmitted: (name) {
                              setState(() {
                                _onClick = false;
                                _text = name;
                                if(_text == "")
                                  _text = "FIRST/LAST NAME";
                              });
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ]
          ),
          Padding(
              padding: EdgeInsets.all(10.0),
              child: ListView.separated(
                  shrinkWrap: true,
                  separatorBuilder: (BuildContext context, int index) {
                    return Divider();
                  },
                  itemCount: 2,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      trailing: Icon(Icons.arrow_forward),
                      title: Text(
                        profile[index].title,
                        style: TextStyle(
                        ),
                      ),
                      onTap: (){
                        profile[index].action(context);
                      }
                    );
                  }
              )
          )
        ],
    );
  }
}
