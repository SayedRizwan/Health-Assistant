import 'package:flutter/material.dart';
import 'package:bmi_calculator/navigationDrawer.dart';
//import 'package:bmi_calculator/Fragements/input_MBI.dart';
class homePage extends StatelessWidget {
 static const String routeName = '/homePage';

 @override
 Widget build(BuildContext context) {
   return new Scaffold( 
       appBar: AppBar(
         title: Text("Home"),
       ),
       drawer: navigationDrawer(),
              body: Center(child: Text("This is updated home page")));
 }
}