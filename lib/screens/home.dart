import 'package:flutter/material.dart';

import 'package:weight_converter/constants/app_constants.dart';
import 'package:weight_converter/widgets/left_bar.dart';
import 'package:weight_converter/widgets/right_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  double _bmiResult = 0.0;
  String _textResult = '';
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          FocusManager.instance.primaryFocus?.unfocus();
        });
      },
      child: Scaffold(
        backgroundColor: mainHexColor,
        appBar: AppBar(
          title: Text(
            'BMI Calculator',
            style: TextStyle(
              color: accentHexColor,
              fontWeight: FontWeight.w300,
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 130,
                    child: TextField(
                      controller: _heightController,
                      style: TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.w300,
                        color: accentHexColor,
                      ),
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Height",
                        hintStyle: TextStyle(
                          fontSize: 42,
                          fontWeight: FontWeight.w300,
                          color: Colors.white.withOpacity(0.8),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 130,
                    child: TextField(
                      controller: _weightController,
                      style: TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.w300,
                        color: accentHexColor,
                      ),
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Weight",
                        hintStyle: TextStyle(
                          fontSize: 42,
                          fontWeight: FontWeight.w300,
                          color: Colors.white.withOpacity(0.8),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () {
                  double h = double.parse(_heightController.text);
                  double w = double.parse(_weightController.text);
                  setState(() {
                    _bmiResult = w / (h * h);
                    if (_bmiResult > 25) {
                      _textResult = 'You\re over weight';
                    } else if (_bmiResult >= 18.5 && _bmiResult <= 25) {
                      _textResult = 'You have normal weight';
                    } else {
                      _textResult = 'You\re under weight';
                    }
                  });
                },
                child: SizedBox(
                  child: Text(
                    'Calculate',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: accentHexColor,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              SizedBox(
                child: Text(
                  _bmiResult.toStringAsFixed(2),
                  style: TextStyle(
                    fontSize: 90,
                    color: accentHexColor,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Visibility(
                visible: _textResult.isNotEmpty,
                child: SizedBox(
                  child: Text(
                    _textResult,
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w400,
                      color: accentHexColor,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const RightBar(barWidth: 40),
              const SizedBox(height: 20),
              const RightBar(barWidth: 70),
              const SizedBox(height: 20),
              const RightBar(barWidth: 40),
              const SizedBox(height: 20),
              const LeftBar(barWidth: 70),
              const SizedBox(height: 50),
              const LeftBar(barWidth: 70),
            ],
          ),
        ),
      ),
    );
  }
}