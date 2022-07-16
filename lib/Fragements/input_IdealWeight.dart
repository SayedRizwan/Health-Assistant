import 'package:bmi_calculator/navigationDrawer.dart';
//import 'package:bmi_calculator/screens/results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:bmi_calculator/components/icon_content.dart';
import 'package:bmi_calculator/components/constants.dart';
import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/components/round_icon_dart.dart';
import 'package:bmi_calculator/Fragements/result_IdealWeight.dart';
import 'package:bmi_calculator/calculator_iw.dart';


enum Gender{ male, female}

class InputPageIW extends StatefulWidget {

  @override
  _InputPageMBIState createState() => _InputPageMBIState();
}

class _InputPageMBIState extends State<InputPageIW> {

  Gender? selectedGender ;
  int height_inch = 180;
  int height_ft=180;
  int weight = 60;
  int age = 18;
  bool gender=false;
   List<String> _locations = ['Broca', 'Devine', 'Robinson', 'Miller','Hamwi','Lemmens']; // ,'BMI Range' Option 2
  String _selectedLocation='Broca'; // Option 2

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                  Image.asset(
                 'images/logo.jpg',
                  fit: BoxFit.contain,
                  height: 32,
              ),
              Container(
                  padding: const EdgeInsets.all(8.0), child:  Text('IDEAL WEIGHT CALCULATOR',
        style: TextStyle(
          fontSize: 12,
             fontWeight: FontWeight.w600,
        )), 
              )
            ],

          ),       
      ),
      drawer: navigationDrawer(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                      onPress: (){
                        setState(() {
                          selectedGender = Gender.male;
                          gender=false;
                        });
                      },
                      colour: selectedGender == Gender.male ? kActiveCardColorGender : kInactiveCardColor,
                      cardChild: IconContent(
                        icon: FontAwesomeIcons.mars,
                        label: "MALE",
                    ),),),
                  Expanded(
                    child: ReusableCard(
                      onPress: (){
                        setState(() {
                          selectedGender = Gender.female;
                          gender=true;
                        });
                      },
                      colour: selectedGender == Gender.female ? kActiveCardColorGender : kInactiveCardColor,
                      cardChild: IconContent(
                        icon: FontAwesomeIcons.venus,
                        label: 'FEMALE',
                      ),
                    ),),
                ],
              ),
          ),
          Expanded(
            child: Row(
              children: [
            Expanded(
                  child: ReusableCard(
                    colour: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                          Text(
                    'HEIGHT',
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height_ft.toString(),
                        style: kDigitLabelStyle,
                      ),
                      Text(
                        'ft',
                        style: kLabelTextStyle,
                      )
                    ],
                  ),
                     
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(icon: FontAwesomeIcons.minus, onPressed: (){
                              setState(() {
                                height_ft--;
                              });
                            }),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(icon: FontAwesomeIcons.plus, onPressed: (){
                              setState(() {
                                height_ft++;
                              });
                            })
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                          Text(
                    'HEIGHT',
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height_inch.toString(),
                        style: kDigitLabelStyle,
                      ),
                      Text(
                        'in',
                        style: kLabelTextStyle,
                      )
                    ],
                  ),
                     
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(icon: FontAwesomeIcons.minus, onPressed: (){
                              setState(() {
                                height_inch--;
                              });
                            }),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(icon: FontAwesomeIcons.plus, onPressed: (){
                              setState(() {
                                height_inch++;
                              });
                            })
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
                        Expanded(
                          
                   child: ReusableCard(
                
                  colour: kActiveCardColor,
                cardChild: Column(
                  
                  mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Please choose a Formula",style: TextStyle(
          fontSize: 20,
             fontWeight: FontWeight.w600,
        )),
                    DropdownButton(
                       hint: Text('Please choose a Formula'),
                       value: _selectedLocation,
                       onChanged: (newvalue)
                       {
                          setState(() {
                            _selectedLocation= newvalue.toString();
                          });
                       },
                        items: _locations.map((location) {
              return DropdownMenuItem(
                child: new Text(location),
                value: location,
              );
            }).toList(),
  )
  ],
              ),
              
              ),
              ),
           
               BottomButton(
            buttonTitle: 'CALCULATE',
            onTap: (){
              //CalculatorBrain calc = CalculatorBrain(weight: weight, height: height_ft);
CalculatorBrainIW calc= CalculatorBrainIW(gender: gender,height_ft: height_ft,height_inc: height_inch,formula: _selectedLocation);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ResultPageIW(
                  bmiResult: calc.calculateBMI(),
                  resultText: calc.getResult(),
                  interpretation: calc.getInterpretation(),
                ),),);
          },),
        ],
      )
    );
    
  }
}







