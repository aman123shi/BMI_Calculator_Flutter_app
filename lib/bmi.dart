import 'dart:math';

class BMI {
  double height;
  int weight;
  double _bmi = 0.0;
  BMI({required this.height, required this.weight}) {
    _bmi = weight / pow(height / 100, 2);
  }

  String calculateBMI() {
    return _bmi.toStringAsFixed(1);
  }

  String getDetail() {
    if (_bmi > 25) {
      return " You are over weight you should do more exercise!!  ";
    } else if (_bmi > 18.5) {
      return " You are in good shape stay healthy GOOD JOB!!  ";
    } else {
      return "You are under weight you should eat more protein diet";
    }
  }

  String getResult() {
    if (_bmi > 25) {
      return " Overweight  ";
    } else if (_bmi > 18.5) {
      return " Normal  ";
    } else {
      return "underweight";
    }
  }
}
