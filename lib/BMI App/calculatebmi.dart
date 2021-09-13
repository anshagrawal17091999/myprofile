import 'dart:math';

class Calculatorbrain {
  Calculatorbrain({this.weight, this.height});
  final int? height;
  final int? weight;
  late double _bmi;
  late double calc1;

  String bmicalculate() {
    _bmi = weight! / pow(height! / 100, 2);
    return _bmi.toStringAsFixed(2);
  }

  String bmiresult() {
    if (_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi >= 18) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String interpretation() {
    if (_bmi >= 25) {
      return 'You have a higher than normal body weight. Try to exercise more';
    } else if (_bmi >= 18) {
      return 'You have a normal body weight. Good job';
    } else {
      return 'You need to eat more';
    }
  }
}
