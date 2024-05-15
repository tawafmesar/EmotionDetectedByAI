import 'package:emotiondetectedbyai/view/screen/authinticationpage/verification.dart';
import 'package:flutter/material.dart';
import '../homescreen/home.dart';
import '../homescreen/noti.dart';


void main() => runApp(const Auth());

class Auth extends StatelessWidget {
  const Auth({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,

      home: BottomNavigationBarExample(),
    );
  }
}

class BottomNavigationBarExample extends StatefulWidget {
  const BottomNavigationBarExample({super.key});

  @override
  State<BottomNavigationBarExample> createState() =>
      _BottomNavigationBarExampleState();
}

class _BottomNavigationBarExampleState
    extends State<BottomNavigationBarExample> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const SecureNotification()),
      );
      ;
    });
  }

  @override
  Widget build(BuildContext context) {
    var widget2 = widget;
    return newMethod(widget2);
  }

  Scaffold newMethod(BottomNavigationBarExample widget2) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset('assets/images/logooow.png'),
        titleSpacing: 05.0,
        centerTitle: true,
        toolbarHeight: 80.2,
        toolbarOpacity: 0.8,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(20),
              bottomLeft: Radius.circular(20)),
        ),
        backgroundColor: const Color.fromRGBO(1, 43, 173, 1),
        actions: <Widget>[
          IconButton(
              icon: const Icon(
                Icons.arrow_back_ios,
                size: 35,
                color: Colors.white,
              ),
              tooltip: 'Back Icon',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Home()),
                );
              }),
        ],
      ),
      body: Column(
        children: [
          Container(
            height: 400.0,
            width: 400.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/update.png'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Stack(children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Vertfication()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromRGBO(1, 43, 173, 1),
              ),
              child: const Text(
                'Update',
                style: const TextStyle(
                    fontSize: 30, color: Color.fromRGBO(255, 255, 255, 1)),
              ),
            ),
          ])
        ],
      ),
    );
  }
}
