import 'package:flutter/material.dart';

class RoundedAppbar extends StatelessWidget implements PreferredSizeWidget {
  RoundedAppbar({required this.appBarTitle, required this.context});
  final String appBarTitle;
  final BuildContext context;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(20),
        ),
      ),
      toolbarHeight: MediaQuery.of(context).size.height * .13,
      elevation: 2,
      shadowColor: Colors.white,
      centerTitle: true,
      title: Text(
        appBarTitle,
        style: const TextStyle(
            fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
      ),
    );
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(MediaQuery.of(context).size.height * .13);
}
