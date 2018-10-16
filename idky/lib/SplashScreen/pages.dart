import 'package:flutter/material.dart';

final pages = [
  new PageViewModel(
      const Color(0xFFF44336),
      'assets/internship.png',
      'Internships',
      'Add your skills in Profile Page, \nand Select the domain of Internship\n and get industrial exposure',
      'assets/wallet.png',
      false
    ),
  new PageViewModel(
      const Color(0xFF03A9F4),
      'assets/projects.png',
      'In-University Projects',
      'Find all the ongoing projects in the \nUniversity. One Click and be a part of the \nproject you are interested in.',
      'assets/key.png',
      false
      ),
  new PageViewModel(
      const Color(0xFF8BC34A),
      'assets/prepare.png',
      'Prepare',
      'Prepare for interviews and placement\n rounds with our well \nsorted prepration model.',
      'assets/person.png',
      true),
];

class Page extends StatelessWidget {
  final PageViewModel viewModel;
  final double percentVisible;

  Page({
    this.viewModel,
    this.percentVisible = 1.0,
  });

  @override
  Widget build(BuildContext context) {
    double uni_height = MediaQuery.of(context).size.height;
    double uni_width = MediaQuery.of(context).size.width;

    return new Container(
        width: double.maxFinite,
        color: viewModel.color,
        child: new Opacity(
          opacity: percentVisible,
          child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                new Transform(
                  transform: new Matrix4.translationValues(
                      0.0, 50.0 * (1.0 - percentVisible), 0.0),
                  child: new Padding(
                    padding: new EdgeInsets.only(bottom: 25.0),
                    child: Container(
                        height: 175.0,
                        width: 175.0,
                        child: new Image(image: new AssetImage(viewModel.heroAssetPath))),
                    //child: new Image.asset(viewModel.heroAssetPath,
                    //    width: 200.0, height: 200.0),
                  ),
                ),
                new Transform(
                  transform: new Matrix4.translationValues(
                      0.0, 30.0 * (1.0 - percentVisible), 0.0),
                  child: new Padding(
                    padding: new EdgeInsets.only(top: 10.0, bottom: 10.0),
                    child: new Text(
                      viewModel.title,
                      style: new TextStyle(
                        color: Colors.white,
                        fontFamily: 'FlamanteRoma',
                        fontSize: 34.0,
                      ),
                    ),
                  ),
                ),
                new Transform(
                  transform: new Matrix4.translationValues(
                      0.0, 30.0 * (1.0 - percentVisible), 0.0),
                  child: new Padding(
                    padding: new EdgeInsets.only(bottom: 75.0),
                    child: new Text(
                      viewModel.body,
                      textAlign: TextAlign.center,
                      style: new TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Padding(padding: EdgeInsets.only(left: uni_width / 25)),
                    viewModel.isNextNeeded
                        ? Padding(
                            padding: EdgeInsets.only(left: uni_width / 15))
                        : Container(),
                    viewModel.isNextNeeded
                        ? Container(
                            height: 40.0,
                            width: 150.0,
                            child: new RaisedButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0)),
                                color: Colors.white,
                                child: Text(
                                  'Next',
                                  style: TextStyle(
                                    fontFamily: 'FlamanteRoma',
                                    color: viewModel.color,
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.of(context).pushNamedAndRemoveUntil(
                                      '/SignIn', (Route<dynamic> route) => false);
                                }),
                          )
                        : Container(),
                  ],
                )
              ]),
        ));
  }
}

class PageViewModel {
  final Color color;
  final String heroAssetPath;
  final String title;
  final String body;
  final String iconAssetPath;
  final bool isNextNeeded;

  PageViewModel(this.color, this.heroAssetPath, this.title, this.body,
      this.iconAssetPath, this.isNextNeeded);
}
