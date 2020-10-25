import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:tutorial_flutter/pages/experience.dart';
import 'package:tutorial_flutter/pages/portofolio.dart';
import 'package:tutorial_flutter/pages/profile.dart';

void main() {
  // runApp(MaterialApp(home: MyHomePage()));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tutorial Flutter',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: Splash(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 6,
      navigateAfterSeconds: new MyHomePage(),
      title: new Text(
        'Tentang Saya',
        textScaleFactor: 2,
      ),
      image: new Image.asset('images/man.png'),
      loadingText: Text("Loading"),
      photoSize: 100.0,
      loaderColor: Colors.blue,
    );
  }
}

class MyHomePage extends StatefulWidget {
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
          buttonBackgroundColor: Colors.blue,
          color: Colors.blue,
          backgroundColor: Colors.white,
          key: _bottomNavigationKey,
          items: <Widget>[
            Icon(
              Icons.person,
              size: 30,
              color: Colors.white,
            ),
            Icon(
              Icons.school,
              size: 30,
              color: Colors.white,
            ),
            Icon(
              Icons.library_books,
              size: 30,
              color: Colors.white,
            ),
          ],
          onTap: (int page) {
            setState(() {
              _showPage = _pageChooser(page);
            });
          },
        ),
        body: Container(
          color: Colors.white,
          child: Center(
            child: _showPage,
          ),
        ));
  }
}
