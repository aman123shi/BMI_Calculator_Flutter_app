import 'package:angela_app/constants.dart';
import 'package:angela_app/input_page.dart';
import 'package:flutter/material.dart';
import 'bottom_button.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Result"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Center(
              child: Text(
                'Your Result',
                style: TextStyle(fontSize: 50.0, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              margin: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: activeCardColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  Text(
                    "Result",
                    style: kResultTextStyle,
                  ),
                  Text(
                    '18.5',
                    style: kBMITextResultStyle,
                  ),
                  Text(
                    "your BMI RESULT is very good keep it up",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 22),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: BottomButton(
              btnLabel: "Re-Calculate BMI",
              onPress: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const InputPage(),
                    ));
              },
            ),
          ),
        ],
      ),
    );
  }
}
