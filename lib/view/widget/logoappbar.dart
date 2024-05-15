import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constant/routes.dart';

class LogoAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool showBackButton; // Add a new boolean argument

  const LogoAppBar({Key? key, required this.showBackButton}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Image.asset('assets/images/logooow.png'),
      titleSpacing: 5.0,
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
      iconTheme: const IconThemeData(
        color: Colors.white, // Use white for better contrast
        size: 35,
      ),
      leading: showBackButton // Conditionally add leading widget
          ? IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () =>  Get.offNamed(AppRoute.homepage), // Handle back button press
      )
          : null, // Explicitly set to null if not shown
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(80.2); // Adjust the height as per your requirement
}
