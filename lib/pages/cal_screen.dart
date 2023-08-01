import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/cal_controller.dart';

class CalculatorScreen extends StatefulWidget {
  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  final CalculatorController controller = Get.put(CalculatorController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Calculator")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Obx(() => Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  controller.result.value,
                  textAlign: TextAlign.end,
                  style: TextStyle(fontSize: 30),
                ),
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildButton("7"),
              buildButton("8"),
              buildButton("9"),
              buildOperatorButton("/"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildButton("4"),
              buildButton("5"),
              buildButton("6"),
              buildOperatorButton("*"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildButton("1"),
              buildButton("2"),
              buildButton("3"),
              buildOperatorButton("-"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildButton("0"),
              buildClearButton(),
              buildOperatorButton("+"),
              buildEqualsButton(),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildButton(String text) {
    return ElevatedButton(
      onPressed: () => controller.onDigitButtonPressed(text),
      child: Text(text, style: TextStyle(fontSize: 20)),
    );
  }

  Widget buildOperatorButton(String text) {
    return ElevatedButton(
      onPressed: () => controller.onOperatorButtonPressed(text),
      child: Text(text, style: TextStyle(fontSize: 20)),
    );
  }

  Widget buildClearButton() {
    return ElevatedButton(
      onPressed: controller.onClearButtonPressed,
      child: Text("C", style: TextStyle(fontSize: 20)),
    );
  }

  Widget buildEqualsButton() {
    return ElevatedButton(
      onPressed: controller.onEqualsButtonPressed,
      child: Text("=", style: TextStyle(fontSize: 20)),
    );
  }
}