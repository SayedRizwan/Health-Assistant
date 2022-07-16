
class CalculatorBrainIW{

  CalculatorBrainIW({required this.gender, required this.height_ft, required this.height_inc, required this.formula});

 
  final int height_ft;
  final bool gender;//true for female and false for male
  final String formula;
  final int height_inc;


  late double _iw ;

  String calculateBMI(){
    double totalheight_cm=(height_ft*30.48)+(height_inc*2.54);
    switch(formula)
    {
      //'Broca', 'Devine', 'Robinson', 'Miller','Hamwi','Lemmens','BMI Range'
      case 'Broca':
      if(gender)
      {
        _iw= (totalheight_cm-100)-((totalheight_cm-100)*(((totalheight_cm)*15)/100));

      }
      else
      {
      _iw= (totalheight_cm-100)-((totalheight_cm-100)*(((totalheight_cm)*10)/100));
        
      }

/*
Men: Ideal Body Weight (kg) = [Height (cm) - 100] - ([Height (cm) - 100] x 10%)

Women: Ideal Body Weight (kg) = [Height (cm) - 100] + ([Height (cm) - 100] x 15%)
*/
      return   _iw.toStringAsFixed(1);
     
      case 'Devine':
      /*
      men: Ideal Body Weight (in kg) = 50 + 2.3 kg x (height - 60 inches)
women: Ideal Body Weight (in kg) = 45.5 + 2.3 kg x (height - 60 inches)
      */
      if(gender)
      {
        _iw= 45.5+ 2.3*((totalheight_cm/2.54)-60);
      }
      else
      {
        _iw= 50+ 2.3*((totalheight_cm/2.54)-60);
      }
      
      return   _iw.toStringAsFixed(1);

      case 'Robinson':
      if(gender)
      {
        _iw= 49+ 1.7*((totalheight_cm/2.54)-60);
      }
      else
      {
        _iw= 52+ 1.9*((totalheight_cm/2.54)-60);
      }
      
      
      return   _iw.toStringAsFixed(1);

      case 'Miller':
      if(gender)
      {
        _iw= 53.1+ 1.36*((totalheight_cm/2.54)-60);
      }
      else
      {
        _iw= 56.2+ 1.41*((totalheight_cm/2.54)-60);
      }
      
     

      return   _iw.toStringAsFixed(1);
     
      case 'Hamwi':
       if(gender)
      {
        _iw= 45+ 2.2*((totalheight_cm/2.54)-60);
      }
      else
      {
        _iw= 48+ 2.7*((totalheight_cm/2.54)-60);
      }
      
     
      return   _iw.toStringAsFixed(1);

      case 'Lemmens':
      _iw=22*((totalheight_cm*0.01)*(totalheight_cm*0.01));
      return   _iw.toStringAsFixed(1);

      // case 'BMI Range':
      
      // return   _iw.toStringAsFixed(1);


      

    }
   // _iw = weight / pow(height/100, 2);
    return _iw.toStringAsFixed(1);
  }

  String getResult(){
       double totalheight_cm=(height_ft*30.48)+(height_inc*2.54);
    double bmirange= _iw/ ((totalheight_cm*0.01)*(totalheight_cm*0.01));
    if( bmirange >= 25){
      return 'overweight';
    }
    else if( bmirange > 18.5){
      return 'normal';
    }
    else{
      return 'underweight';
    }
  }

  String getInterpretation(){
        double totalheight_cm=(height_ft*30.48)+(height_inc*2.54);
    double bmirange= _iw/ ((totalheight_cm*0.01)*(totalheight_cm*0.01));
     if (bmirange >= 25) {
      return 'You have a higher than normal body weight. Try to exercise more.';
    } else if (bmirange >= 18.5) {
      return 'You have a normal body weight. Good job!';
    } else {
      return 'You have a lower than normal body weight. You can eat a bit more.';
    }
  }

}