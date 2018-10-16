import 'package:flutter/material.dart';
import 'Page0.dart';
import 'Page1.dart';
import 'Page2.dart';
import 'Profile.dart';

PageController pageControl;

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  int page = 0;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text('GetPlaced'), centerTitle: true),
        body: new PageView(children: [
          new Page0(),
          new Page1(),
          new Page2(),
          Profile()
        ], controller: pageControl, onPageChanged: onPageChange),
        bottomNavigationBar: new BottomNavigationBar(
          items: [
             new BottomNavigationBarItem(
              icon: new Icon(Icons.desktop_mac),
               title: new Text('Company\nProjects'),
            ),
            new BottomNavigationBarItem(
              icon: new Icon(Icons.account_balance),
              title: new Text('University\nProjects'),
            ),
            new BottomNavigationBarItem(
              icon: new Icon(Icons.check),
              title: new Text('Practice Zone'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              title: Text('Profile')
            )
          ],
          onTap: navTapped,
          currentIndex: page,
          type: BottomNavigationBarType.fixed,
        ));
  }

  @override
  void initState() {
    super.initState();
    pageControl = new PageController();
  }

  @override
  void dispose() {
    super.dispose();
    pageControl.dispose();
  }

  void onPageChange(int page) {
    setState(() {
      this.page = page;
    });
  }

  void navTapped(int page) {
    pageControl.animateToPage(page,
        duration: const Duration(milliseconds: 300), curve: Curves.ease);
  }
}