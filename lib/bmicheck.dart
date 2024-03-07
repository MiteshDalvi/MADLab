import 'package:flutter/material.dart';

class BmiCalculator extends StatefulWidget {
  @override
  _BmiCalculatorState createState() => _BmiCalculatorState();
}

class _BmiCalculatorState extends State<BmiCalculator> {
  double _height = 170.0;
  double _weight = 70.0;
  double _bmi = 0.0;

  void _calculateBMI() {
    setState(() {
      _bmi = _weight / ((_height / 100) * (_height / 100));

      // Show a message if BMI is high
      if (_bmi >= 25.0) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Change your meal plan'),
            duration: Duration(seconds: 3),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Height (cm): ${_height.toStringAsFixed(1)}',
              style: TextStyle(fontSize: 20.0),
            ),
            Slider(
              min: 100.0,
              max: 250.0,
              value: _height,
              onChanged: (value) {
                setState(() {
                  _height = value;
                });
              },
            ),
            Text(
              'Weight (kg): ${_weight.toStringAsFixed(1)}',
              style: TextStyle(fontSize: 20.0),
            ),
            Slider(
              min: 30.0,
              max: 150.0,
              value: _weight,
              onChanged: (value) {
                setState(() {
                  _weight = value;
                });
              },
            ),
            ElevatedButton(
              onPressed: _calculateBMI,
              child: Text('Calculate BMI'),
            ),
            SizedBox(height: 20.0),
            Text(
              'BMI: ${_bmi.toStringAsFixed(1)}',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20.0),
            if (_bmi >= 25.0)
              Text(
                'High BMI! Change your meal plan',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
            SizedBox(height: 20.0),
            if (_bmi >= 25.0)
              Text(
                'Foods to help reduce BMI:',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
            if (_bmi >= 25.0)
              Text(
                '-  Seared Steak With Cauliflower',
                style: TextStyle(fontSize: 16.0),
              ),
            if (_bmi >= 25.0)
              Text(
                '- Roasted Fish And Peppers With Chickpea Pesto',
                style: TextStyle(fontSize: 16.0),
              ),
            if (_bmi >= 25.0)
              Text(
                '-  Cottage Cheese Toast With Salsa Macha',
                style: TextStyle(fontSize: 16.0),
              ),
          ],
        ),
      ),
    );
  }
}
