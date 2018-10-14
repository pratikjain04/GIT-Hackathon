import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  bool _onClick = false;
  String _text = 'FIRST/LAST NAME';
  List<String> list = ['Your Skills', 'Current Semester', 'Projects applied for'];

  @override
  Widget build(BuildContext context) {
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
                  right: 10.0,
                  top: 10.0,
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
                  left: 40.0,
                  top: 140.0,
                  child: Row(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white),
                          color: Colors.blue
                        ),
                        height: 60.0,
                        width: 60.0,
                        child: Center(
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.white, width: 3.0),
                            ),
                            height: 50.0,
                            width: 50.0,
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
                          width: 200.0,
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
                  itemCount: 3,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      trailing: Icon(Icons.arrow_forward),
                      title: Text(
                        list[index],
                        style: TextStyle(
                        ),
                      ),
                      onTap: (){},
                    );
                  }
              )
          )
        ],
    );
  }
}
