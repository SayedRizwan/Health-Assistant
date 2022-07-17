//import 'dart:math';


class CalculatorBrainBF{

  CalculatorBrainBF({required this.gender,required this.waist, required this.weight, required this.wrist,required this.forearm, required this.hips});

  // final int height;
  final int weight;
  final int waist;
  final int wrist;
  final int forearm;
  final int hips;
final  bool gender;
 /*
 Body fat percentage chart by age
 https://www.medicalnewstoday.com/articles/body-fat-percentage-chart#problems-and-limitations
 */


  late double _bfp ;

  String calculateBFP(){
  double f1,f2,f3,f4,f5,leanbodymass,bodyfatweight;


    if(gender)
    {      //female

      /**
    
Body Fat Formula For Women
Factor 1	(Total body weight x 0.732) + 8.987
Factor 2	Wrist measurement (at fullest point) / 3.140
Factor 3	Waist measurement (at naval) x 0.157
Factor 4	Hip measurement (at fullest point) x 0.249
Factor 5	Forearm measurement (at fullest point) x 0.434
Lean Body Mass	Factor 1 + Factor 2 - Factor 3 - Factor 4 + Factor 5
Body Fat Weight	Total bodyweight - Lean Body Mass
Body Fat Percentage	(Body Fat Weight x 100) / total bodyweight
     */

    f1 = (weight*0.732)+8.987;
    f2=wrist/3.140;
    f3=waist*0.157;
    f4=hips*0.249;
    f5=forearm*0.434;
 // leanbodymass= (0.32810 *weight) + (0.33929 *height) − 29.5336;

   leanbodymass= f1+f2-f3-f4+f5;
    bodyfatweight=weight-leanbodymass;
    _bfp=(bodyfatweight*100)/weight;

     return _bfp.toStringAsFixed(1);
    }
    else
    {
      /*
Body Fat Formula For Men
Factor 1	(Total body weight x 1.082) + 94.42
Factor 2	Waist measurement x 4.15
Lean Body Mass	Factor 1 - Factor 2
Body Fat Weight	Total bodyweight - Lean Body Mass
Body Fat Percentage	(Body Fat Weight x 100) / total bodyweight
      */

  f1=(weight*1.082)+94.42;
  f2=waist*4.15;
  leanbodymass = f1-f2;
  bodyfatweight= weight-leanbodymass;
  _bfp= (bodyfatweight*100)/weight;
    return _bfp.toStringAsFixed(1);   
    }
    

  }

  String getResult(){
    if(gender)
  {
    if(_bfp>=10 && _bfp<=12)
    {
      return 'Essential Fat';
    }
    else if(_bfp>12 && _bfp<=20)
    {
      return 'Athletes';
    }
   else if(_bfp>=21 && _bfp<=24)
    {
      return 'Fitness';
    }
    else if(_bfp>25 && _bfp<=31)
    {
      return ' Acceptable';
    }
    
   else if(_bfp>=32)
    {
      return 'Obese';
    }
    else
    {
      return 'Fatal';
    }
 
    
  }
else
{
     if(_bfp>=2 && _bfp<=4)
    {
      return 'Essential Fat';
    }
    else if(_bfp>5 && _bfp<=13)
    {
      return 'Athletes';
    }
   else if(_bfp>=14 && _bfp<=17)
    {
      return 'Fitness';
    }
    else if(_bfp>18 && _bfp<=25)
    {
      return ' Acceptable ';
    }
    
   else if(_bfp>25)
    {
      return 'Obese ';
    }
        else
    {
      return 'Fatal';
    }

}
 
  }

  String getInterpretation(){
     /*
Classification	Women (% fat)	Men (% fat)
Essential Fat	10-12%	2-4%
Athletes	14-20%	6-13%
Fitness	21-24%	14-17%
Acceptable	25-31%	18-25%
Obese	32%+	25%+
Lean body mass
For men: Lean body mass = (0.32810 × W) + (0.33929 × H) − 29.5336
For women: Lean body mass = (0.29569 × W) + (0.41813 × H) − 43.2933
  */
  if(gender)
  {
    if(_bfp>=12 && _bfp<=12)
    {
      return ' You are in Essential Fat Categorty ';
    }
    else if(_bfp>12 && _bfp<=20)
    {
      return ' You are in Athletes Categorty ';
    }
   else if(_bfp>=21 && _bfp<=24)
    {
      return ' You are in Fitness Categorty';
    }
    else if(_bfp>25 && _bfp<=31)
    {
      return ' You are in Acceptable Categorty';
    }
    
   else if(_bfp>=32)
    {
      return ' You are in  Obese Categorty ';
    }
    else
    {
      return 'You are in Fatal Category';
    }
 
    
  }
else
{
     if(_bfp>=2 && _bfp<=4)
    {
      return ' You are in Essential Fat Categorty ';
    }
    else if(_bfp>5 && _bfp<=13)
    {
      return ' You are in Athletes Categorty ';
    }
   else if(_bfp>=14 && _bfp<=17)
    {
      return ' You are in Fitness Categorty';
    }
    else if(_bfp>18 && _bfp<=25)
    {
      return ' You are in Acceptable Categorty';
    }
    
   else if(_bfp>25)
    {
      return ' You are in  Obese Categorty ';
    }
        else
    {
      return 'You are in Fatal Category';
    }

}
    // if (_bfp >= 25) {
    //   return 'You are in higher range than normal. Try to be in normal range.';
    // } else if (_bfp >= 18.5) {
    //   return 'You  are in normal range . Good job!';
    // } else {
    //   return 'You are in lower than normal. Try to be in normal range.';
    // }
    
  }

}