import 'dart:math';


class Calculatorbrain {

  Calculatorbrain({required this.height , required this.weight});

  final int height;
  final int weight;

  double _bmi =0;

  String calculatebmi(){
    _bmi = weight / pow(height/100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getresult(){
    if(_bmi>=25) {
      return 'OVERWEIGHT';}
    else if(_bmi>18.5) {
        return 'NORMAL';
      } else{
      return 'UNDERWEIGHT';
    }
  }

  String getinterpretation(){
    if(_bmi>=25) {
      return 'You have higher than normal body weight. Try to exercise more.';}
    else if(_bmi>18.5) {
      return 'You have normal body weight. Good job!';
    } else{
      return 'You have lower than normal body weight. Try to eat more.';
     }
    }
 }