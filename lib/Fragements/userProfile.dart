import 'package:bmi_calculator/navigationDrawer.dart';
//import 'package:bmi_calculator/screens/results_page.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/user.dart';
//import 'package:bmi_calculator/Fragements/resultMBI.dart';
import '../services/DatabaseHandler.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

enum Gender{ male, female}

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  _UserProfileState createState() => _UserProfileState();


}

class _UserProfileState extends State<UserProfile> {
  late DatabaseHandler handler;
  String values="";

List<double> list=[];
List<int> list_id=[];
List<double> list_bodyfate=[];
List<double> list_wisttohipratio=[];
List<double> list_idealweight=[];
List<double> list_weightloss=[];
//var total = _total?.toInt() ?? 0;
  @override
  void initState() {
    super.initState();
    this.handler = DatabaseHandler();
    this.handler.initializeDB().whenComplete(() async {
      await this.addUsers();
      setState(() 
      //{list.forEach((item){ values+=item+"\n"; });
{});
    });

 
    


}



  addUsers() {}

  @override
  Widget build(BuildContext context) {

Future<List<User>> listOfUsers= this.handler.retrieveUsers();

 //this.handler.deletetable();
 listOfUsers.then((value) {
 value.forEach((item) =>
 {
 if(item.title=="MBI")
 {
   //list_id.add(item.id?.toInt()??0),
  //list.add(item.value.toString())
 list.add(item.value),}
 else if(item.title=="WTHR")
 {
  list_wisttohipratio.add(item.value),
 }
 else if(item.title=="IW")
 {
list_idealweight.add(item.value),
 }
 else if(item.title=="WL")
 {
   list_weightloss.add(item.value),
 }
 else if(item.title=="BFP")
 {
list_bodyfate.add(item.value),
 }
 
 
 
 } 
  );} );
 
  // list.forEach((val)
  // { //values+=val+"\n";
  // print("List item "+val.toString());
  //  });
// print("String Values"+values);

      return Scaffold(
      //backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
         title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                  Image.asset(
                 'images/logo.jpg',
                  fit: BoxFit.contain,
                  height: 32,
                          ),
                    Container(
                  padding: const EdgeInsets.all(8.0), child:  Text('User Profile',
                 style: TextStyle(
                            fontSize: 12,
                           fontWeight: FontWeight.w600,
                 )), 
              )
                          ],

                  ),       
          ),
        drawer: navigationDrawer(),
         body: SafeArea(
         child : Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          // decoration: const BoxDecoration(
          //   image: DecorationImage(
          //       image: AssetImage('assets/images/backImage3.jpg'),
          //       fit: BoxFit.cover),
          // ),
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
         //  color: theme.myAppMainColor.withOpacity(0.05),
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      // decoration: BoxDecoration(
                           color: Color.fromARGB(255, 189, 237, 116),
                      //     borderRadius: BorderRadius.circular(10)
                      // ),
                      height: 250,
                      child: Padding(
                     padding: const EdgeInsets.all(2.0),
                        child: Column(
                          children:   [
                          
                        //   //Item1
                         Text(
                                  'Your Body Mass Index Results History:',
                                textAlign: TextAlign.center,
                                 style: const TextStyle(fontWeight: FontWeight.bold), 
                                )  ,

                    SfSparkLineChart(
              //Enable the trackball
              trackball: SparkChartTrackball(
                  activationMode: SparkChartActivationMode.tap),
              //Enable marker
              marker: SparkChartMarker(
                  displayMode: SparkChartMarkerDisplayMode.all),
              //Enable data label
              labelDisplayMode: SparkChartLabelDisplayMode.all,
               data:list.toList(),
              // <double>[
              //   1, 5, -6, 0, 1, -2, 7, -7, -4, -10, 13, -6, 7, 5, 11, 5, 3
              // ],
            )
        
                                
                       ],
                        ),
                      ),
                    ),
                       
                       const SizedBox(height: 5,),
                    Container(
                      decoration: BoxDecoration(
                          color:Colors.grey,// Color.fromARGB(255, 15, 14, 14),
                          borderRadius: BorderRadius.circular(10)
                      ),
                      height: 250,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                             //   //Item2
                         Text(
                                  'Your Body Fate Percentage Results History:',
                                textAlign: TextAlign.center,
                                 style: const TextStyle(fontWeight: FontWeight.bold), 
                                )  ,

                    SfSparkLineChart(
              //Enable the trackball
              trackball: SparkChartTrackball(
                  activationMode: SparkChartActivationMode.tap),
              //Enable marker
              marker: SparkChartMarker(
                  displayMode: SparkChartMarkerDisplayMode.all),
              //Enable data label
              labelDisplayMode: SparkChartLabelDisplayMode.all,
               data:list_bodyfate.toList(),
              // <double>[
              //   1, 5, -6, 0, 1, -2, 7, -7, -4, -10, 13, -6, 7, 5, 11, 5, 3
              // ],
            )
        
                  ]),
                )
                
                      ),
                                          const SizedBox(height: 5,),
                    Container(
                      decoration: BoxDecoration(
                          color:Colors.grey,// Color.fromARGB(255, 15, 14, 14),
                          borderRadius: BorderRadius.circular(10)
                      ),
                      height: 250,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                          
                           //   //Item3
                         Text(
                                  'Your Waist to Hip Ratio Results History:',
                                textAlign: TextAlign.center,
                                 style: const TextStyle(fontWeight: FontWeight.bold), 
                                )  ,

                    SfSparkLineChart(
              //Enable the trackball
              trackball: SparkChartTrackball(
                  activationMode: SparkChartActivationMode.tap),
              //Enable marker
              marker: SparkChartMarker(
                  displayMode: SparkChartMarkerDisplayMode.all),
              //Enable data label
              labelDisplayMode: SparkChartLabelDisplayMode.all,
               data:list_wisttohipratio.toList(),
              // <double>[
              //   1, 5, -6, 0, 1, -2, 7, -7, -4, -10, 13, -6, 7, 5, 11, 5, 3
              // ],
            )
        
                      
                            
                    ]),
                     )
                
                      ),
                                          const SizedBox(height: 5,),
                    Container(
                      decoration: BoxDecoration(
                          color:Colors.grey,// Color.fromARGB(255, 15, 14, 14),
                          borderRadius: BorderRadius.circular(10)
                      ),
                      height: 250,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                          
                           //   //Item4
                         Text(
                                  'Your Ideal Weight Results History:',
                                textAlign: TextAlign.center,
                                 style: const TextStyle(fontWeight: FontWeight.bold), 
                                )  ,

                    SfSparkLineChart(
              //Enable the trackball
              trackball: SparkChartTrackball(
                  activationMode: SparkChartActivationMode.tap),
              //Enable marker
              marker: SparkChartMarker(
                  displayMode: SparkChartMarkerDisplayMode.all),
              //Enable data label
              labelDisplayMode: SparkChartLabelDisplayMode.all,
               data:list_idealweight.toList(),
              // <double>[
              //   1, 5, -6, 0, 1, -2, 7, -7, -4, -10, 13, -6, 7, 5, 11, 5, 3
              // ],
            )
        
                            //item2 ...Item n on single screen with custom size
                            
                    ]),
                     )
                
                      ),
                      const SizedBox(height: 5,),
                    Container(
                      decoration: BoxDecoration(
                          color:Colors.grey,// Color.fromARGB(255, 15, 14, 14),
                          borderRadius: BorderRadius.circular(10)
                      ),
                      height: 250,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                            children: [
                          
                           //   //Item2
                         Text(
                                  'Your Weight Loss Genie Results History:',
                                textAlign: TextAlign.center,
                                 style: const TextStyle(fontWeight: FontWeight.bold), 
                                )  ,

                    SfSparkLineChart(
              //Enable the trackball
              trackball: SparkChartTrackball(
                  activationMode: SparkChartActivationMode.tap),
              //Enable marker
              marker: SparkChartMarker(
                  displayMode: SparkChartMarkerDisplayMode.all),
              //Enable data label
              labelDisplayMode: SparkChartLabelDisplayMode.all,
               data:list_weightloss.toList(),
             
            )
        
                       
                            
                    ]),
                     )
                
                      ),
                    
                
      
      ]
      ), 
       ) 
        // color: Colors.red,
      ),
    )
    )
    )
    );
  }
}

 /*
 //G1
      AspectRatio(
     aspectRatio: 2,
     child: LineChart(
       LineChartData(
         lineBarsData: [
           LineChartBarData(
             spots: list.map((point) => FlSpot(point,point)).toList(),// x-axis bmi value and y-axis id or date:
             isCurved: false,
             color:    Colors.red,
             
             dotData: FlDotData(
               show: true,
             ),
           ),
         ],
       ),
     ),
   )
   */