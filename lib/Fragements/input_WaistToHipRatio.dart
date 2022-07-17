import 'package:bmi_calculator/navigationDrawer.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:bmi_calculator/components/icon_content.dart';
import 'package:bmi_calculator/components/constants.dart';
import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/Fragements/resultWaistToHipRatio.dart';
import 'package:bmi_calculator/calculator_wth.dart';
enum Gender{ male, female}

class InputPageWTH extends StatefulWidget {

  @override
  _InputPageMBIState createState() => _InputPageMBIState();
}

class _InputPageMBIState extends State<InputPageWTH> {

  Gender? selectedGender ;
  int height = 180;
  int weight = 60;
  int age = 18;
  bool gender=false;
  int waist_circumference=20;
  int hips_circumference=25; 
  @override
  Widget build(BuildContext context) {
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
                  padding: const EdgeInsets.all(8.0), child:  Text('WAIST TO HIP RATIO CALCULATOR',
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
              child: ReusableCard(
                  colour: kActiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'WAIST CIRCUMFERENCE',
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        waist_circumference.toString(),
                        style: kDigitLabelStyle,
                      ),
                      Text(
                        'in',
                        style: kLabelTextStyle,
                      )
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: Color(0xFF8D8E98),
                      thumbColor: Color(0xFFEB1555),
                      overlayColor: Color(0x29EB1555),
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                    ),
                    child: Slider(
                        value: waist_circumference.toDouble(),
                        min: 10.0,
                        max: 100.0,
                        onChanged: (double newValue){
                          setState(() {
                            waist_circumference = newValue.round();
                          });
                        }),
                  )
                ],),
              ),),
                        Expanded(
              child: ReusableCard(
                  colour: kActiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'HIP CIRCUMFERENCE',
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        hips_circumference.toString(),
                        style: kDigitLabelStyle,
                      ),
                      Text(
                        'in',
                        style: kLabelTextStyle,
                      )
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: Color(0xFF8D8E98),
                      thumbColor: Color(0xFFEB1555),
                      overlayColor: Color(0x29EB1555),
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                    ),
                    child: Slider(
                        value: hips_circumference.toDouble(),
                        min: 10.0,
                        max: 100.0,
                        onChanged: (double newValue){
                          setState(() {
                            hips_circumference = newValue.round();
                          });
                        }),
                  )
                ],),
              ),),
               BottomButton(
            buttonTitle: 'CALCULATE',
            onTap: (){

CalculatorBrainWTH calc= CalculatorBrainWTH(gender: gender, waist_c: waist_circumference, hips_c: hips_circumference);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ResultPageWTH(
                  wthResult: calc.calculateBMI(),
                  resultText: calc.getResult(),
                  interpretation: calc.getInterpretation(),
                ),),);
          },),
        ],
      )
    );
    
  }
}







