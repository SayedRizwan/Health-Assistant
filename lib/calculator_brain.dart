import 'dart:math';

class CalculatorBrain{

  CalculatorBrain({required this.weight, required this.height});

  final int height;
  final int weight;

  late double _bmi ;

  String calculateBMI(){
    _bmi = weight / pow(height/100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult(){
    if( _bmi >= 25){
      return 'overweight';
    }
    else if( _bmi > 18.5){
      return 'normal';
    }
    else{
      return 'underweight';
    }
  }

  String getInterpretation(){
    if (_bmi >= 25) {
      return 'You are in higher range than normal. Try to be in normal range.';
    } else if (_bmi >= 18.5) {
      return 'You  are in normal range . Good job!';
    } else {
      return 'You are in lower than normal. Try to be in normal range.';
    }
  }

}