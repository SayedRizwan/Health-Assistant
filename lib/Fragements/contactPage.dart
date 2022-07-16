import 'package:flutter/material.dart';
import 'package:bmi_calculator/Fragements/input_MBI.dart';

class contactPage extends StatelessWidget {
 static const String routeName = '/contactPage';

 @override
 Widget build(BuildContext context) {
   return new InputPageMBI();
  //  return new Scaffold(
  //      appBar: AppBar(
  //        title: Text("Contacts"),
  //      ),
  //      drawer: navigationDrawer(),
  //      body: Center(child: Text("This is contacts page")));
 }
}