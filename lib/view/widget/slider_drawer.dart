import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/homescreen_controller.dart';
import '../../core/constant/routes.dart';

class SliderDrawer extends StatelessWidget {
  const SliderDrawer({super.key});

  @override
  Widget build(BuildContext context) {

    final controller =  Get.put(HomeScreenControllerrImp());
    return Container(
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
             DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromRGBO(1, 43, 173, 1),
              ),
              child:

              Text(
                controller.user_name ?? 'My Name',

                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            InkWell(
              onTap: (){
                Get.offNamed(AppRoute.profile);

              },
              child: ListTile(
                leading: const Icon(Icons.person,size: 35,
                  color: Color.fromRGBO(1, 43, 173, 1),),
                title: const Text('Profile' , style: TextStyle(fontSize: 16.0 ,fontWeight:FontWeight.bold,color: Color.fromRGBO(1, 43, 173, 1)),),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.analytics_outlined,size: 35,
                color: Color.fromRGBO(1, 43, 173, 1),),
              title: const Text('Security Analysis' , style: TextStyle(fontSize: 16.0 ,fontWeight:FontWeight.bold,color: Color.fromRGBO(1, 43, 173, 1)),),
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
              ),),
            InkWell(
              onTap: (){
                controller.logout();
              },
              child: ListTile(
                tileColor: const Color.fromRGBO(1, 43, 173, 1),
                leading: const Icon(Icons.logout,size: 35,
                  color: Color.fromRGBO(255, 255, 255, 1),),
                title: const Text('Log Out', style: TextStyle(fontSize: 16.0 ,fontWeight:FontWeight.bold,color: Color.fromRGBO(255, 255, 255, 1)),
                ),),
            ),
          ],
        ),
      ),
    );
  }
}
