import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'home.dart';

void main() {
  runApp(const SecureNotification());
}

class SecureNotification extends StatelessWidget {
  const SecureNotification({Key? key}) : super(key: key);

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
              bottomLeft: Radius.circular(20),
            ),
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
              },
            ),
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _OutlinedCard(
                cardName: 'Successful examination!\n Your account is secure.',
                style: Colors.green,
                cardName2: '',
              ),
              _OutlinedCard(
                cardName: 'Successful examination!\n Your account is secure.',
                style: Colors.green,
                cardName2: '',
              ),
              _OutlinedCard(
                cardName: 'Successful examination!\n Your account is secure.',
                style: Colors.green,
                cardName2: '',
              ),
              _OutlinedCard(
                cardName2: 'Unsuccessful examination!\n Your account is not secure. Secure it',
                style: Colors.red,
                cardName: '',
              ),
              _OutlinedCard(
                cardName2: 'Unsuccessful examination!\n Your account is not secure. Secure it',
                style: Colors.red,
                cardName: '',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _OutlinedCard extends StatelessWidget {
  const _OutlinedCard({
    required this.cardName,
    required this.style,
    required this.cardName2,
    Key? key,
  }) : super(key: key);

  final String cardName;
  final MaterialColor style;
  final String cardName2;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey), // Adjust color as needed
        borderRadius: BorderRadius.circular(10.0), // Adjust radius as needed
      ),
      child: Card(
        child: SizedBox(
          width: 300,
          height: 100,
          child: Row(
            children: <Widget>[
              Text(
                cardName,
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold, color: Colors.green),
              ),
              Text(
                cardName2,
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold, color: Colors.red),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
