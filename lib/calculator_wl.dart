 /*
 Body fat percentage chart by age
 https://www.medicalnewstoday.com/articles/body-fat-percentage-chart#problems-and-limitations
 */


class CalculatorBrainWL{

  CalculatorBrainWL({required this.gender, required this.height_ft, required this.height_inc,required this.age ,required this.weight,required this.excercise_type});

 
  final int height_ft;
  final bool gender;//true for female and false for male
  final String excercise_type;//exercise
  final int height_inc;
  final int age;
  final int weight;


  late double _wl ;

  String calculateBMI(){
    double totalheight_cm=(height_ft*30.48)+(height_inc*2.54);
    double bmr_m= 655+((9.6)*weight)+((1.8)*totalheight_cm)-((4.7)*age);
    double bmr_f= 66+((13.7)*weight)+((5)*totalheight_cm)-((6.8)*age);
    
    switch(excercise_type)
    {
      /*

  Women: BMR = 655 + (9.6 x weight in kg) + (1.8 x height in cm) - (4.7 x age in years)

    Men: BMR = 66 + (13.7 x weight in kg) + (5 x height in cm) - (6.8 x age in years)

Sedentary (little or no exercise): AMR = BMR x 1.2
Lightly active (exercise 1–3 days/week): AMR = BMR x 1.375
Moderately active (exercise 3–5 days/week): AMR = BMR x 1.55
Active (exercise 6–7 days/week): AMR = BMR x 1.725
Very active (hard exercise 6–7 days/week): AMR = BMR x 1.9
      */
      case 'Sedentary (little or no exercise)':
      if(gender)
      {
        _wl= bmr_f*1.2;

      }
      else
      {
      _wl= bmr_m*1.2;
        
      }


      return   _wl.toStringAsFixed(1);
     
      case 'Lightly active (exercise 1–3 days/week)':
      /*
      men: Ideal Body Weight (in kg) = 50 + 2.3 kg x (height - 60 inches)
women: Ideal Body Weight (in kg) = 45.5 + 2.3 kg x (height - 60 inches)
      */
      if(gender)
      {
        _wl= bmr_f*1.375;
      }
      else
      {
        _wl= bmr_m*1.375;
      }
      
      return   _wl.toStringAsFixed(1);

      case 'Moderately active (exercise 3–5 days/week)':
      if(gender)
      {
        _wl=bmr_f*1.55;
      }
      else
      {
        _wl= bmr_m*1.55;
      }
      
      
      return   _wl.toStringAsFixed(1);

      case 'Active (exercise 6–7 days/week)':
      if(gender)
      {
        _wl= bmr_f*1.725;
      }
      else
      {
        _wl= bmr_m*1.725;
      }
      
     

      return   _wl.toStringAsFixed(1);
     
      case 'Very active (hard exercise 6–7 days/week)':
       if(gender)
      {
        _wl= bmr_f*1.9;
      }
      else
      {
        _wl= bmr_m*1.9;
      }
      
     
      return   _wl.toStringAsFixed(1);

      

    }
   // _wl = weight / pow(height/100, 2);
    return _wl.toStringAsFixed(1);
  }

  String getResult(){
      return "Start From Today";
  }

  String getInterpretation(){
   String res= "You need to burn "+_wl.toString()+" Calories Daily";
  return res;
  }

}