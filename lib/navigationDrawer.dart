import 'package:flutter/material.dart';
import 'createDrawerHeader.dart';
import 'widget/createDrawerBodyItem.dart';
import 'package:bmi_calculator/routes/pageRoute.dart';
// import 'Fragements/contactPage.dart';
// import 'Fragements/homePage.dart';

class navigationDrawer extends StatelessWidget {
 @override
 Widget build(BuildContext context) {
   return Drawer(
     child: ListView(
       padding: EdgeInsets.zero,
       children: <Widget>[
         createDrawerHeader(),
      //    createDrawerBodyItem(
      //  //    icon: Icons.home,
      //      text: 'Home',
      //      onTap: () =>
      //          Navigator.pushReplacementNamed(context, pageRoutes.home),
      //    ),
         createDrawerBodyItem(
          // icon: Icons.account_circle,
           text: 'Calculate your Body Mass Index',
            onTap: () =>
                Navigator.pushReplacementNamed(context, pageRoutes.bmi),
         ),

         createDrawerBodyItem(
          // icon: Icons.event_note,
           text: 'Calculate Body Fat Percentage',
            onTap: () =>
                Navigator.pushReplacementNamed(context, pageRoutes.bfp),
         ),
        // Divider(),
         createDrawerBodyItem(
         //  icon: Icons.notifications_active,
           text: 'Calculate Waist to Hip Ratio',
            onTap: () =>
                Navigator.pushReplacementNamed(context, pageRoutes.wth),
         ),
         createDrawerBodyItem(
        //   icon: Icons.contact_phone,
           text: 'Calculate your Ideal Weight',
            onTap: () =>
              Navigator.pushReplacementNamed(context, pageRoutes.iw),
         ),

            createDrawerBodyItem(
        //   icon: Icons.contact_phone,
           text: 'Weight Loss Genie',
            onTap: () =>
              Navigator.pushReplacementNamed(context, pageRoutes.wl),
         ),
         Divider(),
         createDrawerBodyItem(
        //   icon: Icons.contact_phone,
           text: 'Check Your Personalized Page',
             onTap: () =>
               Navigator.pushReplacementNamed(context, pageRoutes.userProfile),
         ),
          createDrawerBodyItem(
        //   icon: Icons.contact_phone,
           text: 'More Health & Fitness Calculators',
            // onTap: () =>
            //   Navigator.pushReplacementNamed(context, pageRoutes.contact),
         ),
           Divider(),
         
         ListTile(
           title: Text('App version 1.0.0'),
           onTap: () {},
         ),
       ],
     ),
   );
 }
}