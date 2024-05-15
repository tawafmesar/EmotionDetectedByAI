import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/homescreen_controller.dart';
import '../../../core/constant/routes.dart';
import '../authinticationpage/authinticate.dart';
import 'noti.dart';


void main() => runApp(const Home());

class Home extends StatelessWidget {
  const Home({super.key});

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
  );;
    });
  }

  @override
  Widget build(BuildContext context) {
    var widget2 = widget;
    return newMethod(widget2);
  }

  Scaffold newMethod(BottomNavigationBarExample widget2) {
    final controller =  Get.put(HomeScreenControllerrImp());

    return Scaffold(
      appBar: AppBar(
        title:                 
        Image.asset('assets/images/logooow.png'),
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
    iconTheme: IconThemeData(color: const Color.fromARGB(255, 255, 255, 255),size: 35,),

      ),              
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
             DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromRGBO(1, 43, 173, 1),
              ),
              child: Text(
                controller.user_name ?? 'My Name',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),

            ListTile(
              leading: const Icon(Icons.person,size: 35,
              color: Color.fromRGBO(1, 43, 173, 1),),
              title: const Text('Profile' , style: TextStyle(fontSize: 16.0 ,fontWeight:FontWeight.bold,color: Color.fromRGBO(1, 43, 173, 1)),
              ),
               onTap: () {
                 Get.offNamed(AppRoute.profile);

  //                Navigator.push(
  //   context,
  //   MaterialPageRoute(builder: (context) => Profile()),
  // );
}
            ),
             ListTile(
              leading: const Icon(Icons.analytics_outlined,size: 35,
              color: Color.fromRGBO(1, 43, 173, 1),),
              title: const Text('Security Analysis' , style: TextStyle(fontSize: 16.0 ,fontWeight:FontWeight.bold,color: Color.fromRGBO(1, 43, 173, 1)),),
              onTap: () {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => Home()),
  );
}
            ),
            ListTile(
              leading: const Icon(Icons.report,size: 35,
              color: Color.fromRGBO(1, 43, 173, 1),),
              title: const Text('Security Report' , style: TextStyle(fontSize: 16.0 ,fontWeight:FontWeight.bold,color: Color.fromRGBO(1, 43, 173, 1)),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.update,size: 35,
              color: Color.fromRGBO(1, 43, 173, 1),),
              title: const Text('Security Update', style: TextStyle(fontSize: 16.0 ,fontWeight:FontWeight.bold,color: Color.fromRGBO(1, 43, 173, 1)),
            ),
            onTap: () {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => Auth()),
  );
}
            ),
       ListTile(
              tileColor: const Color.fromRGBO(1, 43, 173, 1),
              leading: const Icon(Icons.logout,size: 35,
              color: Color.fromRGBO(255, 255, 255, 1),),
              title: const Text('Log Out', style: TextStyle(fontSize: 16.0 ,fontWeight:FontWeight.bold,color: Color.fromRGBO(255, 255, 255, 1)),
            ),
            onTap: () {
              controller.logout();


}
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Container(
     height: 400.0,
     width: 400.0,
      decoration: BoxDecoration(
   image: DecorationImage(
          image: AssetImage(
              'assets/images/balance.png'),
          fit: BoxFit.fill,
        ),
     ),
   ),
          Stack(
            children: <Widget>[
              ElevatedButton(
            onPressed: () {
Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Auth()),
                      ); 
            },
            style: ElevatedButton.styleFrom(
    backgroundColor: const Color.fromRGBO(1, 43, 173, 1), 
  ),
            child: const Text('Check Your Security' , style: const TextStyle(fontSize: 25, color: Color.fromRGBO(255, 255, 255, 1)),),
          ),       
            ]
)],
),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Color.fromRGBO(1, 43, 173, 1),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.notifications,
              color: Color.fromRGBO(1, 43, 173, 1),
            ),
            label: 'Notification',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color.fromRGBO(1, 43, 173, 1),
        onTap: _onItemTapped,
      ), 
  
    );
  }
}