import 'package:flutter/material.dart';
import 'package:ohms_law/home_widgets/input_data_widget.dart';
import 'package:ohms_law/providers/ohm_model.dart';
import 'package:ohms_law/util/helpers/set_input_data.dart';
import 'package:ohms_law/util/misc/units.dart';
import 'package:provider/provider.dart';

class OptionsWidget extends StatefulWidget {
  const OptionsWidget({super.key});

  @override
  State<OptionsWidget> createState() => _OptionsWidgetState();
}

class _OptionsWidgetState extends State<OptionsWidget> {
  UnitType? _typeOhms = UnitType.A;

  void setListOptionsToInputs({required OhmModel ohmModel}){
    ohmModel.listOptionsFirst = getSuffix(
      position: PositionRow.first,
      unitType: ohmModel.operation,
    );
    ohmModel.suffixFirst = ohmModel.listOptionsFirst[4];

    ohmModel.listOptionsSecond = getSuffix(
      position: PositionRow.second,
      unitType: ohmModel.operation,
    );
    ohmModel.suffixSecond = ohmModel.listOptionsSecond[4];
  }

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
                    setListOptionsToInputs(ohmModel: ohmModel);
                  });
                },
              ),
            ),
            Expanded(
              child: RadioListTile<UnitType>(
                title: Text(Unit.getUnitLetterString()[UnitType.V]!,
                    style: textStyle),
                value: UnitType.V,
                groupValue: _typeOhms,
                onChanged: (UnitType? value) {
                  setState(() {
                    ohmModel.operation = value ?? UnitType.V;
                    setListOptionsToInputs(ohmModel: ohmModel);
                    _typeOhms = value;
                  });
                },
              ),
            ),
            Expanded(
              child: RadioListTile<UnitType>(
                title: Text(Unit.getUnitLetterString()[UnitType.R]!,
                    style: textStyle),
                value: UnitType.R,
                groupValue: _typeOhms,
                onChanged: (UnitType? value) {
                  setState(() {
                    ohmModel.operation = value ?? UnitType.R;
                    _typeOhms = value;
                    setListOptionsToInputs(ohmModel: ohmModel);
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
