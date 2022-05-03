import 'package:bmi_calculator/CalculatorBrain.dart';
import 'package:bmi_calculator/screens/resultsPage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../components/Button.dart';
import '../components/GenderInput.dart';
import '../components/Input.dart';
import '../constants.dart';

class InputPage extends StatefulWidget {
  const InputPage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColor = KInactiveCardColor;
  Color femaleCardColor = KInactiveCardColor;
  int height = 180;
  int weight = 60;
  int age = 19;
  void toggleCardColor(String gender) {
    gender == 'MALE'
        ? {
            maleCardColor = KActiveCardColor,
            femaleCardColor = KInactiveCardColor,
          }
        : {
            maleCardColor = KInactiveCardColor,
            femaleCardColor = KActiveCardColor,
          };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GenderInput(
                      gender: 'MALE',
                      onPress: () {
                        setState(() {
                          toggleCardColor('MALE');
                        });
                      },
                      color: maleCardColor),
                ),
                Expanded(
                  child: GenderInput(
                      gender: 'FEMALE',
                      onPress: () {
                        setState(() {
                          toggleCardColor('FEMALE');
                        });
                      },
                      color: femaleCardColor),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              color: KBackgroundInputColor,
              inputChildren: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'HEIGHT',
                    style: KLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: KNumberLabelTextStyle,
                      ),
                      const Text(
                        'cm',
                        style: KLabelTextStyle,
                      )
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      inactiveTrackColor: const Color(0xFF8D8E98),
                      activeTrackColor: Colors.white,
                      thumbColor: const Color(0xFFEB1555),
                      overlayColor: const Color(0x70EB1555),
                      thumbShape:
                          const RoundSliderThumbShape(enabledThumbRadius: 12.5),
                      overlayShape:
                          const RoundSliderOverlayShape(overlayRadius: 20.0),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      onChanged: (double value) {
                        setState(() {
                          height = value.toInt();
                        });
                      },
                    ),
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
                        color: KBackgroundInputColor,
                        inputChildren: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "WEIGHT",
                              style: KLabelTextStyle,
                            ),
                            Text(
                              weight.toString(),
                              style: KNumberLabelTextStyle,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RoundIconButton(
                                  icon: FontAwesomeIcons.minus,
                                  action: () {
                                    setState(() {
                                      weight--;
                                    });
                                  },
                                ),
                                const SizedBox(width: 20.0),
                                RoundIconButton(
                                  icon: FontAwesomeIcons.plus,
                                  action: () {
                                    setState(() {
                                      weight++;
                                    });
                                  },
                                ),
                              ],
                            )
                          ],
                        ))),
                Expanded(
                    child: ReusableCard(
                        color: KBackgroundInputColor,
                        inputChildren: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "AGE",
                              style: KLabelTextStyle,
                            ),
                            Text(
                              age.toString(),
                              style: KNumberLabelTextStyle,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RoundIconButton(
                                  icon: FontAwesomeIcons.minus,
                                  action: () {
                                    setState(() {
                                      age--;
                                    });
                                  },
                                ),
                                const SizedBox(width: 20.0),
                                RoundIconButton(
                                  icon: FontAwesomeIcons.plus,
                                  action: () {
                                    setState(() {
                                      age++;
                                    });
                                  },
                                ),
                              ],
                            )
                          ],
                        ))),
              ],
            ),
          ),
          BottomButton(
            label: 'CALCULATE',
            onPress: () {
              CalculatorBrain calculator = CalculatorBrain(height: height, weight: weight);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultPage(
                    bmiResult: calculator.calculateBMI(),
                    resultText: calculator.getResult(),
                    interpretation: calculator.getInterpretation(),
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  const RoundIconButton({Key? key, required this.icon, required this.action})
      : super(key: key);
  final IconData icon;
  final Function action;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      elevation: 6.0,
      constraints: const BoxConstraints.tightFor(width: 56.0, height: 56.0),
      shape: const CircleBorder(),
      fillColor: const Color(0xFF4C4F5F),
      onPressed: () {
        action();
      },
    );
  }
}
