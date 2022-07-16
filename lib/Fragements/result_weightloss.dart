import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/components/constants.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import '../services/DatabaseHandler.dart';
import 'package:bmi_calculator/user.dart';

class ResultPageWL extends StatelessWidget {
   late DatabaseHandler handler;
  ResultPageWL({required this.bmiResult, required this.resultText, required this.interpretation});

  final String bmiResult;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
        this.handler = DatabaseHandler();
     this.handler.initializeDB().whenComplete(() async {
      await this.addUsers();
      
    });

//   Future<List<User>> listOfUsers= this.handler.retrieveUsers();

//  listOfUsers.then((value) {
//  value.forEach((item) =>
//  {
// print("Title : "+item.title + " Value :"+ item.value.toString())

//  } 
//   );} );

    //print(listOfUsers);

//MySharedPreferences.instance.getStringValue("bmi").then((value){print("Bmi values is ="+value);});
//print("bmi is x= "+x);
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
                  padding: const EdgeInsets.all(8.0), child:  Text('WEIGHT LOSS GENIE RESULT',
                 style: TextStyle(
                            fontSize: 12,
                           fontWeight: FontWeight.w600,
                 )), 
              )
                          ],

                  ),       
          ),
     //   drawer: navigationDrawer(),
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
                      //     color: Colors.black,
                      //     borderRadius: BorderRadius.circular(10)
                      // ),
                      height: 70,
                      child: Padding(
                     padding: const EdgeInsets.all(2.0),
                        child: Column(
                          children:   [
                          
                          //Item1
                          Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.center,
              child: Text(
                'YOUR RESULT',
                style: kTitleTextStyle,
              ),
            ),
                       ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 0,),
                    Container(
                      decoration: BoxDecoration(
                         // color:Colors.grey,// Color.fromARGB(255, 15, 14, 14),
                          borderRadius: BorderRadius.circular(10)
                      ),
                      height: 500,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            ReusableCard(
                    colour: kActiveCardColor,
                  //Added gauge for displaying the end result
                  cardChild: Column(
                    
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SfRadialGauge(axes: <RadialAxis>[
                        RadialAxis(minimum: 0, maximum: 200, ranges: <GaugeRange>[
                          GaugeRange(startValue: 0, endValue: 70, color: Colors.green),
                          GaugeRange(startValue: 70, endValue: 140, color: Colors.orange),
                          GaugeRange(startValue: 140, endValue: 200, color: Colors.red)
                        ], pointers: <GaugePointer>[
                          NeedlePointer(value: double.parse(bmiResult))
                        ], annotations: <GaugeAnnotation>[
                          GaugeAnnotation(
                              widget: Container(
                                  child: Text('${bmiResult}',
                                      style: const TextStyle(
                                          color: Color(0xFF24D876),
                                          fontSize: 25, fontWeight: FontWeight.bold))),
                              angle: 90,
                              positionFactor: 0.5)
                        ])
                      ]),
                      Text(
                        resultText.toUpperCase(),
                        style: kResultTextStyle,
                      ),
                      Text(
                        interpretation,
                        textAlign: TextAlign.center,
                        style: kBodyTextStyle,
                      ),
                    ],
                  ),
                ),
                            //item2 ...Item n on single screen with custom size
                            
                    ]),
                     )
                
                      ),
                       
                //        const SizedBox(height: 5,),
                //     Container(
                //       decoration: BoxDecoration(
                //           color:Colors.grey,// Color.fromARGB(255, 15, 14, 14),
                //           borderRadius: BorderRadius.circular(10)
                //       ),
                //       height: 150,
                //       child: Padding(
                //         padding: const EdgeInsets.all(8.0),
                //         child: Column(
                //           children: const[

                //   ]),
                // )
                
                //    ),
                     const SizedBox(height: 5,),
                    Container(
                      decoration: BoxDecoration(
                         // color:Colors.grey,// Color.fromARGB(255, 15, 14, 14),
                          borderRadius: BorderRadius.circular(10)
                      ),
                      height: 110,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                         BottomButton(
                          buttonTitle: 'RE-CALCULATE',
                                onTap: (){
                            Navigator.pop(context);
            },
          ),
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
   Future<int> addUsers() async {
    User firstUser = User(title: "WL", value: double.parse(bmiResult));
    List<User> listOfUsers = [firstUser];
    return await this.handler.insertUser(listOfUsers);
  }
}
