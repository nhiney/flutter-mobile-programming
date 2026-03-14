import 'package:flutter/material.dart';
import '../../widgets/calculator/calculator_button.dart';
import '../../widgets/calculator/display.dart';
import '../../widgets/calculator/memory_bar.dart';
import '../../drawer/calculator_drawer.dart';
import '../../services/calculator_logic.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String display = "0";
  double firstNumber = 0;
  String operator = "";
  bool newInput = false;

  List<String> history = [];

  CalculatorLogic logic = CalculatorLogic();

  final List<String> buttons = [
    "%", "CE", "C", "⌫","1/x","x²","√","÷","7","8","9","×","4","5","6","-","1","2","3","+","+/-","0",".","=",
  ];

  void pressButton(String value) {
    setState(() {
      if (value == "C") {
        display = "0";
        firstNumber = 0;
        operator = "";
      } else if (value == "CE") {
        display = "0";
      } else if (value == "⌫") {
        if (display.length > 1) {
          display = display.substring(0, display.length - 1);
        } else {
          display = "0";
        }
      } else if (value == "+/-") {
        if (display.startsWith("-")) {
          display = display.substring(1);
        } else {
          display = "-$display";
        }
      } else if (value == "%") {
        display = logic.percent(double.parse(display)).toString();
      } else if (value == "x²") {
        display = logic.square(double.parse(display)).toString();
      } else if (value == "√") {
        display = logic.sqrtValue(double.parse(display)).toString();
      } else if (value == "1/x") {
        display = logic.inverse(double.parse(display)).toString();
      } else if (value == "+" || value == "-" || value == "×" || value == "÷") {
        firstNumber = double.parse(display);
        operator = value;
        newInput = true;
      } else if (value == "=") {
        double second = double.parse(display);

        double result = logic.calculate(firstNumber, second, operator);

        history.add("$firstNumber $operator $second = $result");

        display = result.toString();
      } else {
        if (newInput) {
          display = value;
          newInput = false;
        } else if (display == "0") {
          display = value;
        } else {
          display += value;
        }
      }
    });
  }

  void showHistory() {
    showModalBottomSheet(
      context: context,

      builder: (context) {
        return ListView(
          children: history.map((e) {
            return ListTile(title: Text(e));
          }).toList(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CalculatorDrawer(),

      appBar: AppBar(
        title: const Text("Standard"),
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
        actions: [
          IconButton(icon: const Icon(Icons.history), onPressed: showHistory),
        ],
      ),

      body: Column(
        children: [
          Display(value: display),

          const MemoryBar(),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8),

              child: GridView.builder(
                itemCount: buttons.length,

                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  childAspectRatio: 1,
                ),

                itemBuilder: (context, index) {
                  return CalculatorButton(
                    text: buttons[index],
                    onTap: () => pressButton(buttons[index]),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
