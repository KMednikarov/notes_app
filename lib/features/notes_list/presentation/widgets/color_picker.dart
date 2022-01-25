import 'package:flutter/material.dart';

class ColorPicker extends StatefulWidget {
  static const Map<int, Color> _colors = {
    -1: Colors.transparent,
    0: Colors.grey,
    1: Colors.blue,
    2: Colors.red,
    3: Colors.yellow,
    4: Colors.green,
    5: Colors.black,
    6: Colors.purple
  };
  int? _selectedValue = 0;
  Function _onColorChanged;

  ColorPicker(this._onColorChanged);

  ColorPicker.selectedColor(this._onColorChanged, Color color) {
    _selectedValue = _colors.entries
        .firstWhere((element) => element.value.value == color.value)
        .key;
  }

  @override
  _ColorPickerState createState() => _ColorPickerState();
}

class _ColorPickerState extends State<ColorPicker> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
            elevation: 2,
            iconSize: 0,
            value: widget._selectedValue,
            onChanged: (int? value) {
              setState(() {
                widget._selectedValue = value;
                widget._onColorChanged(
                    ColorPicker._colors[widget._selectedValue]);
              });
            },
            items: ColorPicker._colors.entries
                .map((e) => DropdownMenuItem(
                      child: Container(
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                            color: e.value,
                            borderRadius: BorderRadius.circular(5)),
                      ),
                      value: e.key,
                    ))
                .toList()),
      ),
    );
  }
}
