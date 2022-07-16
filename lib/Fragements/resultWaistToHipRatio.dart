import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/components/constants.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import 'package:bmi_calculator/user.dart';
import '../services/DatabaseHandler.dart';

class ResultPageWTH extends StatelessWidget {
 late DatabaseHandler handler;
  ResultPageWTH({required this.wthResult, required this.resultText, required this.interpretation});

  final String wthResult;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
      this.handler = DatabaseHandler();
     this.handler.initializeDB().whenComplete(() async {
      await this.addUsers();
      
    });

    return Scaffold(
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
                  padding: const EdgeInsets.all(8.0), child:   Text('WAIST TO HIP RATIO RESULT',
        style: TextStyle(
          fontSize: 12,
             fontWeight: FontWeight.w600,
        )), 
              )],

          ),       
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
             
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Text(
                'YOUR RESULT',  textAlign: TextAlign.center,
                style: kTitleTextStyle,
              
              ),
              
            ),
          ),
          Expanded(
            flex: 4,
            child: SingleChildScrollView(
                child: ReusableCard(
                    colour: kActiveCardColor,
                  //Added gauge for displaying the end result
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SfRadialGauge(axes: <RadialAxis>[
                        RadialAxis(minimum: 0, maximum: 60, ranges: <GaugeRange>[
                          GaugeRange(startValue: 0, endValue: 20, color: Colors.green),
                          GaugeRange(startValue: 20, endValue: 40, color: Colors.orange),
                          GaugeRange(startValue: 40, endValue: 60, color: Colors.red)
                        ], pointers: <GaugePointer>[
                          NeedlePointer(value: double.parse(wthResult))
                        ], annotations: <GaugeAnnotation>[
                          GaugeAnnotation(
                              widget: Container(
                                  child: Text('${wthResult}',
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
                ),),
          ),
          //goes back to input_page screen
          BottomButton(
            buttonTitle: 'RE-CALCULATE',
            onTap: (){
              Navigator.pop(context);
            },
          ),
        ],
      )
    );
  }
  Future<int> addUsers() async {
    User firstUser = User(title: "WTHR", value: double.parse(wthResult));
    List<User> listOfUsers = [firstUser];
    return await this.handler.insertUser(listOfUsers);
  }
}
