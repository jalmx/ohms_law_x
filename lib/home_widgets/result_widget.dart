import 'package:flutter/material.dart';
import 'package:ohms_law/providers/ohm_model.dart';
import 'package:ohms_law/util/entity/law/unit.dart';
import 'package:provider/provider.dart';

import '../util/entity/result_value.dart';

class ResultWidget extends StatefulWidget {
  const ResultWidget({super.key});

  @override
  State<ResultWidget> createState() => _ResultWidgetState();
}

class _ResultWidgetState extends State<ResultWidget> {
  String _fixFormat(
      {required ResultValue result, required UnitType operation}) {
    String clearLastDigit(String value, [String letter = "0"]) {
      if (value.endsWith(letter)) {
        return clearLastDigit(
            value.replaceRange(value.length - 1, value.length, ""), letter);
      } else {
        return value;
      }
    }

    String value =
        result.bestValue.isNaN ? "-" : result.bestValue.toStringAsFixed(4);
    String suffix = result.bestValue.isNaN || result.bestValue.isInfinite
        ? ""
        : result.suffixString;
    String unit = result.bestValue.isNaN || result.bestValue.isInfinite
        ? ""
        : Unit.getUnitLetterString()[operation] ?? "";

    value = clearLastDigit(value);
    value = clearLastDigit(value, ".");
    return "$value$suffix$unit";
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Consumer<OhmModel>(
        builder: (BuildContext context, OhmModel ohmModel, Widget? child) {
          return Consumer<OhmModel>(
            builder: (context, ohmModel, child) => Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (!ohmModel.isPower)
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: Text(
                        _fixFormat(
                            result: ohmModel.resultMini, operation: UnitType.W),
                        style: const TextStyle(fontSize: 24),
                        overflow: TextOverflow.fade,
                      ),
                    ),
                  FittedBox(
                    fit: BoxFit.contain,
                    child: Text(
                      _fixFormat(
                          result: ohmModel.result,
                          operation: ohmModel.operation),
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 80,
                          overflow: TextOverflow.fade),
                    ),
                  )
                ]),
          );
        },
      ),
    );
  }
}
