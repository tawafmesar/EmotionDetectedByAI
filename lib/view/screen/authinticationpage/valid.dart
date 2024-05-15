import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../homescreen/home.dart';

void main() {
  runApp(const Valid());
}

class Valid extends StatelessWidget {
  const Valid({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
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
                      image: AssetImage('assets/images/valid.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Stack(children: <Widget>[
                  Container(
                    width: 200,
                    height: 60,
                    decoration: ShapeDecoration(
                      color: Color.fromRGBO(1, 173, 76, 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                    ),
                    child: Text("Secure!",
                    textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 30, color: Colors.white)),
                  ),
                ])
              ],
            )));
  }
}
