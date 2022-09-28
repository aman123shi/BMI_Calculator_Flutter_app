import 'package:angela_app/bmi.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'card_icon_content.dart';
import 'reusable_card.dart';
import 'constants.dart';
import 'result_page.dart';
import 'bottom_button.dart';

const maleSelected = 1;
const femaleSelected = 2;

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColor = inactiveCardColor;
  Color femaleCardColor = inactiveCardColor;
  int height = 180;
  int weight = 60;
  int age = 25;
  void updateColor(int selection) {
    if (selection == maleSelected) {
      maleCardColor = activeCardColor;
      femaleCardColor = inactiveCardColor;
    } else if (selection == femaleSelected) {
      maleCardColor = inactiveCardColor;
      femaleCardColor = activeCardColor;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI_Calculator'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    color: maleCardColor,
                    onPress: (() {
                      setState(() {
                        updateColor(maleSelected);
                      });
                    }),
                    widget: const CardContent(
                      icon: FontAwesomeIcons.mars,
                      label: "MALE",
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    color: femaleCardColor,
                    onPress: (() {
                      setState(() {
                        updateColor(femaleSelected);
                      });
                    }),
                    widget: const CardContent(
                      icon: FontAwesomeIcons.venus,
                      label: "FEMALE",
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              color: activeCardColor,
              widget: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'HEIGHT',
                    style: labelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: kNumbersTextStyle,
                      ),
                      const Text(
                        "cm",
                        style: labelTextStyle,
                      ),
                    ],
                  ),
                  Slider(
                    value: height.toDouble(),
                    min: 120,
                    max: 220,
                    activeColor: const Color(0xFFEB1555),
                    inactiveColor: const Color(0xFF8D8E98),
                    onChanged: (double value) {
                      setState(() {
                        height = value.round();
                      });
                    },
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    color: activeCardColor,
                    widget: Column(
                      children: [
                        const Text(
                          "WEIGHT",
                          style: labelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kNumbersTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPress: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPress: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    color: activeCardColor,
                    widget: Column(
                      children: [
                        const Text(
                          "AGE",
                          style: labelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kNumbersTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPress: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPress: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: BottomButton(
              btnLabel: "Calculate The BMI",
              onPress: () {
                BMI bmi = BMI(height: height.toDouble(), weight: weight);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ResultPage(
                        result: bmi.getResult(),
                        bmiResult: bmi.calculateBMI(),
                        detailResult: bmi.getDetail(),
                      ),
                    ));
              },
            ),
          ),
        ],
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  const RoundIconButton({Key? key, required this.icon, required this.onPress})
      : super(key: key);
  final IconData icon;
  final VoidCallback onPress;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
        onPressed: onPress,
        constraints: const BoxConstraints.tightFor(width: 56.0, height: 56.0),
        elevation: 6,
        shape: const CircleBorder(),
        fillColor: const Color(0xFF4C4F5E),
        child: Icon(icon));
  }
}
