import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Measures Converter'),
        ),
        body: MeasuresConverter(),
      ),
    );
  }
}

class MeasuresConverter extends StatefulWidget {
  @override
  _MeasuresConverterState createState() => _MeasuresConverterState();
}

class _MeasuresConverterState extends State<MeasuresConverter> {
  double value = 42.0;
  String fromUnit = 'kilometers';
  String toUnit = 'miles';
  String selectedValue = 'meters'; // Initially selected item
  final Map<String, int> _measures = {
    'meters': 0,
    'kilometers': 1,
    'grams': 2,
    'kilograms': 3,
    'feet': 4,
    'miles': 5,
    'pounds (lbs)': 6,
    'ounces': 7,
  };

  final dynamic _formulas = {
    '0': [1, 0.001, 0, 0, 3.28084, 0.000621371, 0, 0],
    '1': [1000, 1, 0, 0, 3280.84, 0.621371, 0, 0],
    '2': [0, 0, 1, 0.0001, 0, 0, 0.00220462, 0.035274],
    '3': [0, 0, 1000, 1, 0, 0, 2.20462, 35.274],
    '4': [0.3048, 0.0003048, 0, 0, 1, 0.000189394, 0, 0],
    '5': [1609.34, 1.60934, 0, 0, 5280, 1, 0, 0],
    '6': [0, 0, 453.592, 0.453592, 0, 0, 1, 16],
    '7': [0, 0, 28.3495, 0.0283495, 3.28084, 0, 0.0625, 1],
  };

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          TextField(
            keyboardType: TextInputType.number,
            onChanged: (newValue) {
              setState(() {
                value = double.parse(newValue);
              });
            },
            decoration: InputDecoration(
              labelText: 'Value',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 16.0),
          DropdownButtonFormField(
            value: fromUnit,
            onChanged: (newValue) {
              setState(() {
                fromUnit = newValue!;
              });
            },
            items: _measures.keys.map((String measure) {
              return DropdownMenuItem(
                value: measure,
                child: Text(measure),
              );
            }).toList(),
          ),
          SizedBox(height: 16.0),
          Text('Convert to:'),
          SizedBox(height: 8.0),
          DropdownButtonFormField(
            value: toUnit,
            onChanged: (newValue) {
              setState(() {
                toUnit = newValue!;
              });
            },
            items: _measures.keys.map((String measure) {
              return DropdownMenuItem(
                value: measure,
                child: Text(measure),
              );
            }).toList(),
          ),
          SizedBox(height: 16.0),
          Text(
            '${value} ${fromUnit} = ${_convertValue(value, fromUnit, toUnit)} ${toUnit}',
            style: TextStyle(fontSize: 24.0),
          ),
        ],
      ),
    );
  }

  double _convertValue(double value, String fromUnit, String toUnit) {
    int fromIndex = _measures[fromUnit]!;
    int toIndex = _measures[toUnit]!;
    if (fromIndex != null && toIndex != null) {
      return value * _formulas[fromIndex.toString()][toIndex];
    } else {
      // Handle the case where the units are not found in the measures map.
      return value;
    }
  }
}
