class CalculatorBrainWTH{

  CalculatorBrainWTH({required this.gender ,required this.waist_c, required this.hips_c});

  final int waist_c;

  final int hips_c;
  final bool gender;

  late double _wthr ;

  String calculateBMI(){
    _wthr = waist_c / hips_c;
    return _wthr.toStringAsFixed(1);
  }
/*

Waist to Hip Ratio Chart
Male	Female	Health Risk Based Solely on WHR
0.95 or below	0.80 or below	Low Risk
0.96 to 1.0	0.81 to 0.85	Moderate Risk
1.0+	0.85+	High Risk
*/
  String getResult(){
    if(gender)
    {
    if( _wthr <= 0.95){
      return 'Low';
    }
    else if( _wthr >= 0.96 && _wthr <= 1.0){
      return 'Moderate';
    }
    else{
      return 'High';
    }
    }
    else
    {
      if( _wthr <= 0.80){
      return 'Low ';
    }
    else if( _wthr >=0.81 && _wthr<= 0.85){
      return 'Moderate';
    }
    else{
      return 'High';
    }
    }
  }

  String getInterpretation(){
 
    if(gender)
    {
    if( _wthr <= 0.95){
      return 'You are at Low Risk';
    }
    else if( _wthr >= 0.96 && _wthr <= 1.0){
      return 'You are at Moderate Risk';
    }
    else{
      return 'You are at High Risk';
    }
    }
    else
    {
      if( _wthr <= 0.80){
      return 'You are at Low Risk.';
    }
    else if( _wthr >=0.81 && _wthr<= 0.85){
      return 'You are at Moderate Risk. ';
    }
    else{
      return 'You are at High Risk.';
    }
    }
  }

}