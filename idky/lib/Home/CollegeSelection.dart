import 'package:flutter/material.dart';

class CollegeSelection extends StatefulWidget {
  @override
  _CollegeSelectionState createState() => new _CollegeSelectionState();
}

class _CollegeSelectionState extends State<CollegeSelection> {

  int _isChecked = 0;
  List<String> colleges = ['Manipal University Jaipur', 'IIT Delhi', 'IIT Bombay', 'Global Institute of Technology', 'NIT Allahabad'];
  List<String> cities = ['Jaipur', 'Delhi', 'Mumbai', 'Jaipur', 'Lucknow'];

  void _onChanged(int index) {
    setState(() {
      _isChecked = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    double uni_height = MediaQuery.of(context).size.height;
    double uni_width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('College Selection'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: uni_width / 11.74, top: uni_height / 12.18),
            child: Container(
              height: uni_height / 1.62,
              width: uni_width / 1.208,
              child: Card(
                elevation: 20.0,
                child: Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Select Your College',
                        style: TextStyle(
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(top: 30.0),
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: 5,
                            itemBuilder: (BuildContext context, int index) {
                              return RadioListTile(
                                title: Text(
                                  colleges[index],
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    fontStyle: FontStyle.italic
                                  ),
                                ),
                                subtitle: Text(
                                  cities[index],
                                  style: TextStyle(
                                    fontWeight: FontWeight.w300
                                  ),
                                ),
                                value: index,
                                groupValue: _isChecked,
                                onChanged: _onChanged,
                              );
                            }
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: uni_height / 15, left: uni_width / 20),
            child: Container(
              height: uni_height / 12.183,
              width: uni_width / 2,
              child: RaisedButton(
                elevation: 7.0,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                onPressed: (){
                  Navigator.of(context).pushNamedAndRemoveUntil('/HomePage', (Route<dynamic> route) => false);
                },
                color: Colors.blue,
                child: Text(
                  'Next',
                  style: TextStyle(
                    fontFamily: 'ArimaMadurai',
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 30.0
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
