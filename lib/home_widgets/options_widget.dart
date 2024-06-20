import 'package:flutter/material.dart';
import 'package:ohms_law/providers/ohm_model.dart';
import 'package:ohms_law/util/misc/units.dart';
import 'package:provider/provider.dart';

class OptionsWidget extends StatefulWidget {
  const OptionsWidget({super.key});

  @override
  State<OptionsWidget> createState() => _OptionsWidgetState();
}

class _OptionsWidgetState extends State<OptionsWidget> {
  UnitType? _typeOhms = UnitType.A;

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(fontWeight: FontWeight.bold, fontSize: 16);

    return Consumer<OhmModel>(
      builder: (BuildContext context, OhmModel ohmModel, Widget? child) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: RadioListTile<UnitType>(
                title: Text(
                  Unit.getUnitLetterString()[UnitType.A]!,
                  style: textStyle,
                ),
                value: UnitType.A,
                groupValue: _typeOhms,
                onChanged: (UnitType? value) {
                  setState(() {
                    ohmModel.operation = value ?? UnitType.A;
                    _typeOhms = value;
                  });
                },
              ),
            ),
            Expanded(
              child: RadioListTile<UnitType>(
                title: Text(Unit.getUnitLetterString()[UnitType.V]!, style: textStyle),
                value: UnitType.V,
                groupValue: _typeOhms,
                onChanged: (UnitType? value) {
                  setState(() {
                    ohmModel.operation = value ?? UnitType.V;
                    _typeOhms = value;
                  });
                },
              ),
            ),
            Expanded(
              child: RadioListTile<UnitType>(
                title: Text(Unit.getUnitLetterString()[UnitType.R]!, style: textStyle),
                value: UnitType.R,
                groupValue: _typeOhms,
                onChanged: (UnitType? value) {
                  setState(() {
                    ohmModel.operation = value ?? UnitType.R;
                    _typeOhms = value;
                  });
                },
              ),
            )
          ],
        );
      },
    );
  }
}
