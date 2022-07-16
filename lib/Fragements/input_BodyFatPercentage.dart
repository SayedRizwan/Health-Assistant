//import 'package:bmi_calculator/calculator_brain.dart';
import 'package:bmi_calculator/navigationDrawer.dart';
//import 'package:bmi_calculator/screens/results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:bmi_calculator/components/icon_content.dart';
import 'package:bmi_calculator/components/constants.dart';
import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/components/round_icon_dart.dart';
import 'package:bmi_calculator/Fragements/result_BodyFatPercentage.dart';
import 'package:bmi_calculator/calculator_bf.dart';
enum Gender{ male, female}

class InputPageBFP extends StatefulWidget {

  @override
  _InputPageMBIState createState() => _InputPageMBIState();
}

class _InputPageMBIState extends State<InputPageBFP> {

  Gender? selectedGender ;
  int height = 180;
  int weight = 60;
  int age = 18;
  int waist=20;
  int wrist=30;
  int forearm=10;
  int hips=10;
  bool gender=false;


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
                  padding: const EdgeInsets.all(8.0), child:  Text('BODY FAT PERCENTAGE CALCULATOR',
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
          Flexible(
            flex: 1,
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
        Flexible(
            flex: 1,
              child: ReusableCard(
                  colour: kActiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'WAIST',
                    style: kLabelTextStyle,
                    
                  ),
                  Row(
                    
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      
                      Text(
                        waist.toString(),
                        style: kDigitLabelStyle,
                      ),
                      Text(
                        'inches',
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
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 20.0),
                    ),
                    child: Slider(
                        value: waist.toDouble(),
                        min: 1.0,
                        max: 100.0,
                        onChanged: (double newValue){
                          setState(() {
                            waist = newValue.round();
                          });
                        }),
                  )
                ],),
              ),),
        Flexible(
            flex: 1,
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                      colour: kActiveCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                              'WEIGHT (pounds)',
                            style: kLabelTextStyle,
                          ),
                      
                          Text(
                            weight.toString(),
                            style: kDigitLabelStyle,
                          ),
                          Row(
                          
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPressed: (){
                                  setState(() {
                                    weight--;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPressed: (){
                                  setState(() {
                                    weight++;
                                  });
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                  ),
                ),

               Flexible(
              flex: 1,
                  child: ReusableCard(
                    colour: kActiveCardColor,
                    cardChild: Column(
                  
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [ 
                         Text(
                            'WRIST (inches)',
                          style: kLabelTextStyle,
                        ),
                        Text(
                            wrist.toString(),
                          style: kDigitLabelStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(icon: FontAwesomeIcons.minus, onPressed: (){
                              setState(() {
                                wrist--;
                              });
                            }),
                            SizedBox(
                              width: 10.0,
                             
                            ),
                            RoundIconButton(icon: FontAwesomeIcons.plus, onPressed: (){
                              setState(() {
                                wrist++;
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
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                      colour: kActiveCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                              'FOREARM (inches)',
                            style: kLabelTextStyle,
                          ),
                      
                          Text(
                            forearm.toString(),
                            style: kDigitLabelStyle,
                          ),
                          Row(
                          
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPressed: (){
                                  setState(() {
                                    forearm--;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPressed: (){
                                  setState(() {
                                    forearm++;
                                  });
                                },
                              ),
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
                            'HIPS (inches)',
                          style: kLabelTextStyle,
                        ),
                        Text(
                            hips.toString(),
                          style: kDigitLabelStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(icon: FontAwesomeIcons.minus, onPressed: (){
                              setState(() {
                                hips--;
                              });
                            }),
                            SizedBox(
                              width: 10.0,
                             
                            ),
                            RoundIconButton(icon: FontAwesomeIcons.plus, onPressed: (){
                              setState(() {
                                hips++;
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
          
          BottomButton(
            
            buttonTitle: 'CALCULATE',
        
            onTap: (){
           CalculatorBrainBF calc= CalculatorBrainBF(gender: gender, waist: waist, weight: weight, wrist: wrist, forearm: forearm, hips: hips);
           //   CalculatorBrain calc = CalculatorBrain(weight: weight, height: height);

            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ResultPageBFP(
                  bfpResult: calc.calculateBFP(),
                  resultText: calc.getResult(),
                  interpretation: calc.getInterpretation(),
                ),),);
          },
          
          ),
        ],
      )
    );
    
  }
  

}
