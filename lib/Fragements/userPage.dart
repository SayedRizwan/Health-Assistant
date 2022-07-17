import 'package:flutter/material.dart';
import 'package:bmi_calculator/Fragements/userProfile.dart';

class userPage extends StatelessWidget {
 static const String routeName = '/userProfilePage';

 @override
 Widget build(BuildContext context) {
   return new UserProfile();
  
 }
}