import 'package:flutter/material.dart';

void main() {
  runApp(NumberToWordsApp());
}

class NumberToWordsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: NumberToWordsScreen(),
    );
  }
}

class NumberToWordsScreen extends StatefulWidget {
  @override
  _NumberToWordsScreenState createState() => _NumberToWordsScreenState();
}

class _NumberToWordsScreenState extends State<NumberToWordsScreen> {
  TextEditingController _numberController = TextEditingController();
  String _englishWords = '';
  String _arabicWords = '';

  // Map for number-to-words conversion
  final Map<int, String> englishWordsMap = {
    0: 'zero',
    1: 'one',
    2: 'two',
    3: 'three',
    4: 'four',
    5: 'five',
    6: 'six',
    7: 'seven',
    8: 'eight',
    9: 'nine',
    10: 'ten',
    90: 'ninety',
    // Add more numbers as needed
  };

  final Map<int, String> arabicWordsMap = {
    0: 'صفر',
    1: 'واحد',
    2: 'اثنان',
    3: 'ثلاثة',
    4: 'أربعة',
    5: 'خمسة',
    6: 'ستة',
    7: 'سبعة',
    8: 'ثمانية',
    9: 'تسعة',
    10: 'عشرة',
    90: 'تسعون',
    // Add more numbers as needed
  };

  void _convertToWords(bool isArabic) {
    String numberText = _numberController.text;
    int number = int.tryParse(numberText) ?? 0;

    // Look up the number in the appropriate map
    if (isArabic) {
      _arabicWords = arabicWordsMap[number] ?? 'Number not found';
      _englishWords = ''; // Clear the English result
    } else {
      _englishWords = englishWordsMap[number] ?? 'Number not found';
      _arabicWords = ''; // Clear the Arabic result
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Number to Words Converter'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _numberController,
              decoration: InputDecoration(labelText: 'Enter a number'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    _convertToWords(true); // Convert to Arabic
                  },
                  child: Text('Convert Arabic'),
                ),
                SizedBox(width: 16),
                ElevatedButton(
                  onPressed: () {
                    _convertToWords(false); // Convert to English
                  },
                  child: Text('Convert English'),
                ),
              ],
            ),
            SizedBox(height: 16),
            Text('Arabic: $_arabicWords'),
            Text('English: $_englishWords'),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _numberController.dispose();
    super.dispose();
  }
}
