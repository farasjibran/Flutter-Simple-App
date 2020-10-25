import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:tutorial_flutter/pages/experience.dart';
import 'package:tutorial_flutter/pages/portofolio.dart';
import 'package:tutorial_flutter/pages/profile.dart';

void main() {
  runApp(MaterialApp(home: MyHomePage()));
}

// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         // This is the theme of your application.
//         //
//         // Try running your application with "flutter run". You'll see the
//         // application has a blue toolbar. Then, without quitting the app, try
//         // changing the primarySwatch below to Colors.green and then invoke
//         // "hot reload" (press "r" in the console where you ran "flutter run",
//         // or simply save your changes to "hot reload" in a Flutter IDE).
//         // Notice that the counter didn't reset back to zero; the application
//         // is not restarted.
//         primarySwatch: Colors.grey,
//         // This makes the visual density adapt to the platform that you run
//         // the app on. For desktop platforms, the controls will be smaller and
//         // closer together (more dense) than on mobile platforms.
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//       home: MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }

class MyHomePage extends StatefulWidget {
  // MyHomePage({Key key, this.title}) : super(key: key);

  // // This widget is the home page of your application. It is stateful, meaning
  // // that it has a State object (defined below) that contains fields that affect
  // // how it looks.

  // // This class is the configuration for the state. It holds the values (in this
  // // case the title) provided by the parent (in this case the App widget) and
  // // used by the build method of the State. Fields in a Widget subclass are
  // // always marked "final".

  // final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  GlobalKey _bottomNavigationKey = GlobalKey();

  // create all page
  final Profile _profile = Profile();
  final Experience _experience = Experience();
  final Portofolio _portofolio = Portofolio();

  Widget _showPage = new Profile();

  Widget _pageChooser(int page) {
    switch (page) {
      case 0:
        return _profile;
        break;
      case 1:
        return _experience;
        break;
      case 2:
        return _portofolio;
        break;
      default:
        return new Container(
          child: new Center(
            child: new Text(
              'No Page Found By Choser',
              style: new TextStyle(fontSize: 30),
            ),
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: Colors.grey,
          key: _bottomNavigationKey,
          items: <Widget>[
            Icon(Icons.home, size: 30),
            Icon(Icons.person, size: 30),
            Icon(Icons.school, size: 30),
          ],
          onTap: (int page) {
            setState(() {
              _showPage = _pageChooser(page);
            });
          },
        ),
        body: Container(
          color: Colors.grey,
          child: Center(
            child: _showPage,
          ),
        ));
  }
}
