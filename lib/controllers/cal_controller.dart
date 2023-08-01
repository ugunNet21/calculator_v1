import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorController extends GetxController {
  RxString result = "0".obs;

  void onDigitButtonPressed(String value) {
    if (result.value == "0") {
      result.value = value;
    } else {
      result.value += value;
    }
  }

  void onOperatorButtonPressed(String operator) {
    result.value += operator;
  }

  void onClearButtonPressed() {
    result.value = "0";
  }

  void onEqualsButtonPressed() {
    try {
      Parser p = Parser();
      Expression exp = p.parse(result.value);
      ContextModel cm = ContextModel();
      double eval = exp.evaluate(EvaluationType.REAL, cm);
      if (eval == eval.toInt()) {
        result.value = eval.toInt().toString();
      } else {
        result.value = eval.toStringAsFixed(2);
      }
    } catch (e) {
      result.value = "Error";
    }
  }
}
