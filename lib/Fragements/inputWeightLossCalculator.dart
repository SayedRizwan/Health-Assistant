import 'package:bmi_calculator/navigationDrawer.dart';
//import 'package:bmi_calculator/screens/results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:bmi_calculator/components/icon_content.dart';
import 'package:bmi_calculator/components/constants.dart';
import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/components/round_icon_dart.dart';
import 'package:bmi_calculator/Fragements/result_weightloss.dart';
//import 'package:bmi_calculator/calculator_wl.dart';
import 'package:bmi_calculator/calculator_wl.dart';

enum Gender{ male, female}

class InputPageWL extends StatefulWidget {

  @override
  _InputPageMBIState createState() => _InputPageMBIState();
}
/**
 * Sedentary (little or no exercise): AMR = BMR x 1.2
Lightly active (exercise 1–3 days/week): AMR = BMR x 1.375
Moderately active (exercise 3–5 days/week): AMR = BMR x 1.55
Active (exercise 6–7 days/week): AMR = BMR x 1.725
Very active (hard exercise 6–7 days/week): AMR = BMR x 1.9
 */

class _InputPageMBIState extends State<InputPageWL> {

  Gender? selectedGender ;
  int height_inch = 5;
  int height_ft=10;
  int weight = 60;
  int age = 18;
  bool gender=false;
   List<String> _locations = ['Sedentary (little or no exercise)', 'Lightly active (exercise 1–3 days/week)', 'Moderately active (exercise 3–5 days/week)', 'Active (exercise 6–7 days/week)','Very active (hard exercise 6–7 days/week)']; // ,'BMI Range' Option 2
  String _selectedLocation='Sedentary (little or no exercise)'; // Option 2

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(15, 1, 1, 255),//rgba(15,1,1,255)
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
                  padding: const EdgeInsets.all(8.0), child:  Text('Weight Loss Genie',
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
                 decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                           border: Border.all(
                    color: Colors.grey,

                    width: 2,
                          ) 
                      ),
                      height: 140,
                      child: Padding(
                     padding: const EdgeInsets.all(2.0),
                        child: Column(
                          children:   [
                            Row(
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
                    ),
                    ),
                    ),
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
                    ),
                    ),
                ],
              ),
                       ],
                        ),
                      ),
                    ),
                    //Age
                     const SizedBox(height: 15,),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                           border: Border.all(
                    color: Colors.grey,

                    width: 2,
                          ) 
                      ),
                      height: 150,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                         Row(
              children: [
                Expanded(
                  child: ReusableCard(
                      colour: kActiveCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                              'WEIGHT',
                            style: kLabelTextStyle,
                          ),
                         Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        weight.toString(),
                        style: kDigitLabelStyle,
                      ),
                      Text(
                        'kg',
                        style: kLabelTextStyle,
                      )
                    ],
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
                Expanded(
                  child: ReusableCard(
                    colour: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                         Text(
                            'AGE',
                          style: kLabelTextStyle,
                        ),
                        Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        age.toString(),
                        style: kDigitLabelStyle,
                      ),
                      Text(
                        ' years',
                        style: kLabelTextStyle,
                      )
                    ],
                  ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(icon: FontAwesomeIcons.minus, onPressed: (){
                              setState(() {
                                age--;
                              });
                            }),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(icon: FontAwesomeIcons.plus, onPressed: (){
                              setState(() {
                                age++;
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

                     //      itemBuild("Hide images/videos","assets/images/image.png",hideimagesvideos)                        ],
                  ]),
                    )
                
                      ),
                      
                    const SizedBox(height: 15,),
                    Container(
                       decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                           border: Border.all(
                    color: Colors.grey,

                    width: 2,
                          ) 
                      ),
                      height: 150,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                         Row(
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
                     //      itemBuild("Hide images/videos","assets/images/image.png",hideimagesvideos)                        ],
                    ]),
                     )
                
                      ),
                     //Activity
                      const SizedBox(height: 15,),
                    Container(
                       decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                           border: Border.all(
                    color: Colors.grey,

                    width: 2,
                          ) 
                      ),
                      height: 140,
                      //width: 500,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(

                          children: [
                         ReusableCard(
                
                  colour: kActiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  
                children: [
                  Text("Please choose an activity",style: TextStyle(
          fontSize: 14,
             fontWeight: FontWeight.w600,
        )),
                    DropdownButton(
                      isExpanded:true ,
                       hint: Text('Please choose an activity'),
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

                  ]),
                    )
                
                      ),
                      
                       const SizedBox(height: 15,),
                    Container(
               decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                           border: Border.all(
                    color: Colors.red,

                    width: 2,
                          ) 
                      ),
                      height: 120,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children:[
                          BottomButton(
            buttonTitle: 'CALCULATE',
            
            onTap: (){
              //CalculatorBrain calc = CalculatorBrain(weight: weight, height: height_ft);
      CalculatorBrainWL calc= CalculatorBrainWL(gender: gender,height_ft: height_ft,height_inc: height_inch,age:age,weight:weight,excercise_type: _selectedLocation);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ResultPageWL(
                  bmiResult: calc.calculateBMI(),
                  resultText: calc.getResult(),
                  interpretation: calc.getInterpretation(),
                ),),);
          },)
                     //      itemBuild("Hide images/videos","assets/images/image.png",hideimagesvideos)                        ],
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







