// if (MediaQuery.of(context).orientation == Orientation.portrait){
//     // is portrait
// }else{
// // is landscape
// }

// import 'package:flutter/material.dart';
// import 'package:bmi_calculator/navigationDrawer.dart';
// import 'package:bmi_calculator/Fragements/input_MBI.dart';
// import 'package:bmi_calculator/calculator_brain.dart';
// import 'package:bmi_calculator/screens/results_page.dart';
// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:bmi_calculator/components/reusable_card.dart';
// import 'package:bmi_calculator/components/icon_content.dart';
// import 'package:bmi_calculator/components/constants.dart';
// import 'package:bmi_calculator/components/bottom_button.dart';
// import 'package:bmi_calculator/components/round_icon_dart.dart';

// class homePage extends StatelessWidget {
//  static const String routeName = '/homePage';

//  @override
//  Widget build(BuildContext context) {
//    return new Scaffold(
//       appBar: AppBar(
//         title: Text('BMI CALCULATOR'),
       
//       ),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: [
//           Expanded(
//               child: Row(
//                 children: [
//                   Expanded(
//                     child: ReusableCard(
//                       onPress: (){
//                         setState(() {
//                           selectedGender = Gender.male;
//                         });
//                       },
//                       colour: selectedGender == Gender.male ? kActiveCardColor : kInactiveCardColor,
//                       cardChild: IconContent(
//                         icon: FontAwesomeIcons.mars,
//                         label: "MALE",
//                     ),),),
//                   Expanded(
//                     child: ReusableCard(
//                       onPress: (){
//                         setState(() {
//                           selectedGender = Gender.female;
//                         });
//                       },
//                       colour: selectedGender == Gender.female ? kActiveCardColor : kInactiveCardColor,
//                       cardChild: IconContent(
//                         icon: FontAwesomeIcons.venus,
//                         label: 'FEMALE',
//                       ),
//                     ),),
//                 ],
//               ),
//           ),
//           Expanded(
//               child: ReusableCard(
//                   colour: kActiveCardColor,
//                 cardChild: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     'HEIGHT',
//                     style: kLabelTextStyle,
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.baseline,
//                     textBaseline: TextBaseline.alphabetic,
//                     children: [
//                       Text(
//                         height.toString(),
//                         style: kDigitLabelStyle,
//                       ),
//                       Text(
//                         'cm',
//                         style: kLabelTextStyle,
//                       )
//                     ],
//                   ),
//                   SliderTheme(
//                     data: SliderTheme.of(context).copyWith(
//                       activeTrackColor: Colors.white,
//                       inactiveTrackColor: Color(0xFF8D8E98),
//                       thumbColor: Color(0xFFEB1555),
//                       overlayColor: Color(0x29EB1555),
//                       thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
//                       overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
//                     ),
//                     child: Slider(
//                         value: height.toDouble(),
//                         min: 120.0,
//                         max: 220.0,
//                         onChanged: (double newValue){
//                           setState(() {
//                             height = newValue.round();
//                           });
//                         }),
//                   )
//                 ],),
//               ),),
//           Expanded(
//             child: Row(
//               children: [
//                 Expanded(
//                   child: ReusableCard(
//                       colour: kActiveCardColor,
//                       cardChild: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Text(
//                               'WEIGHT',
//                             style: kLabelTextStyle,
//                           ),
//                           Text(
//                             weight.toString(),
//                             style: kDigitLabelStyle,
//                           ),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               RoundIconButton(
//                                 icon: FontAwesomeIcons.minus,
//                                 onPressed: (){
//                                   setState(() {
//                                     weight--;
//                                   });
//                                 },
//                               ),
//                               SizedBox(
//                                 width: 10.0,
//                               ),
//                               RoundIconButton(
//                                 icon: FontAwesomeIcons.plus,
//                                 onPressed: (){
//                                   setState(() {
//                                     weight++;
//                                   });
//                                 },
//                               ),
//                             ],
//                           )
//                         ],
//                       ),
//                   ),
//                 ),
//                 Expanded(
//                   child: ReusableCard(
//                     colour: kActiveCardColor,
//                     cardChild: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                          Text(
//                             'AGE',
//                           style: kLabelTextStyle,
//                         ),
//                         Text(
//                             age.toString(),
//                           style: kDigitLabelStyle,
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             RoundIconButton(icon: FontAwesomeIcons.minus, onPressed: (){
//                               setState(() {
//                                 age--;
//                               });
//                             }),
//                             SizedBox(
//                               width: 10.0,
//                             ),
//                             RoundIconButton(icon: FontAwesomeIcons.plus, onPressed: (){
//                               setState(() {
//                                 age++;
//                               });
//                             })
//                           ],
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           BottomButton(
//             buttonTitle: 'CALCULATE',
//             onTap: (){
//               CalculatorBrain calc = CalculatorBrain(weight: weight, height: height);

//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => ResultPage(
//                   bmiResult: calc.calculateBMI(),
//                   resultText: calc.getResult(),
//                   interpretation: calc.getInterpretation(),
//                 ),),);
//           },),
//         ],
//       ),
//        drawer: navigationDrawer(),
//               body: Center(child: Text("This is updated home page")));
//  }
// }