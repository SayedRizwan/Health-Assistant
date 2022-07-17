import 'package:flutter/material.dart';

Widget createDrawerHeader() {
 return DrawerHeader(
     margin: EdgeInsets.zero,
     padding: EdgeInsets.zero,
     decoration: BoxDecoration(
         shape: BoxShape.circle,
         image: DecorationImage(
             fit: BoxFit.scaleDown,
             image:  AssetImage('images/logo.jpg'))),
     child: Stack(children: <Widget>[
       Positioned(
           bottom: 0.0,
           left: 30.0,
           child: Text("Weight Loss Genie",
               style: TextStyle(
                   color: Colors.white,
                   fontSize: 20.0,
                   fontWeight: FontWeight.w500))),
     ]));
}