import 'package:flutter/material.dart';
import 'package:bmi_calculator/components/constants.dart';

class BottomButton extends StatelessWidget {

  BottomButton({required this.buttonTitle, required this.onTap});

  final String buttonTitle;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
          child: Text(
            buttonTitle,
            style: kBottomButtonTextStyle,
            
          ),
          
        ),
        color: kBottomContainerColor,
        margin: EdgeInsets.only(top: 10.0),
        padding: EdgeInsets.only(bottom: 20.0),
        width: double.infinity,
        height: kBottomContainerHeight,
        
        // decoration: BoxDecoration(
        //     // color: Colors.orange,
        //     shape: BoxShape.circle
        //   ),

      
        
      ),
    );
  }
}
