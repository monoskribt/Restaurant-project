import 'package:flutter/material.dart';
class RangeSliderFunction extends StatefulWidget {
  const RangeSliderFunction({Key? key}) : super(key: key);

  @override
  State<RangeSliderFunction> createState() => _RangeSliderFunctionState();
}

class _RangeSliderFunctionState extends State<RangeSliderFunction> {
  RangeValues values = const RangeValues(1, 4);
  RangeValues valuesBottom = const RangeValues(1, 5);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildSlider(),
        const SizedBox(height: 5),
        buildLabels(),
      ],
    );
  }

  Widget buildSlider() {
    final labels = ['1', '2', '3', '4', '5'];
    const double min = 0;
    final double max = labels.length - 1.0;
    final divisions = (max - min).toInt();

    return SizedBox(
      width: 380,
      child: SliderTheme(
        data: const SliderThemeData(
          thumbColor: Color(0xFFFFB01D),
          activeTrackColor: Color(0xFFFFC861),
          inactiveTrackColor: Color(0xFFDCDCE4),
          trackHeight: 2.0,
          thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12.0),
        ),
        child: RangeSlider(
          values: values,
          min: min,
          max: max,
          divisions: divisions,
          onChanged: (values) => setState(() => this.values = values),
        ),
      ),
    );
  }

  Widget buildLabels() {
    final labels = ['1', '2', '3', '4', '5'];
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: List.generate(
        labels.length,
            (index) => Text(labels[index]),
      ),
    );
  }
}
