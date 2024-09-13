import 'package:flutter/material.dart';
import 'package:ohms_law/providers/ohm_model.dart';
import 'package:ohms_law/util/helpers/set_input_data.dart';
import 'package:provider/provider.dart';

import '../util/helpers/log.dart';

enum PositionRow { first, second }

class InputDataWidget extends StatefulWidget {
  final PositionRow position;

  const InputDataWidget({super.key, required this.position});

  @override
  State<InputDataWidget> createState() => _InputDataWidgetState();
}

class _InputDataWidgetState extends State<InputDataWidget> {
  @override
  void dispose() {
    super.dispose();
  }

  void showMessageErrorFormat() {
    showDialog(
      builder: (context) => AlertDialog(
        title: const Text('Error'),
        content: const Text('Just numbers'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'OK'),
            child: const Text('OK'),
          ),
        ],
      ),
      context: context,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 4, bottom: 4),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Consumer<OhmModel>(
          builder: (BuildContext context, OhmModel ohmModel, Widget? child) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 3,
                  child: TextField(
                      controller: widget.position == PositionRow.first
                          ? ohmModel.controllerFirst
                          : ohmModel.controllerSecond,
                      onChanged: (String value) {
                        final hasInvalidValue =
                            value.contains((RegExp(r'[A-Za-z]')));
                        if (hasInvalidValue) {
                          showMessageErrorFormat();
                        } else {
                          if (widget.position == PositionRow.first) {
                            ohmModel.valueFirst = num.parse(value);
                          } else {
                            ohmModel.valueSecond = num.parse(value);
                          }
                        }
                      },
                      maxLines: 1,
                      autocorrect: false,
                      keyboardType: const TextInputType.numberWithOptions(
                        signed: true,
                        decimal: true,
                      ),
                      textInputAction: TextInputAction.done,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        filled: ohmModel.isPower,
                        labelText: getLabel(
                            position: widget.position,
                            unitType: ohmModel.operation,
                            isPower: ohmModel.isPower),
                      )),
                ),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                  flex: 1,
                  child: DropdownButton<String>(
                    value: widget.position == PositionRow.first
                        ? ohmModel.suffixFirst
                        : ohmModel.suffixSecond,
                    items: (widget.position == PositionRow.first
                            ? ohmModel.listOptionsFirst
                            : ohmModel.listOptionsSecond)
                        .map<DropdownMenuItem<String>>(
                      (item) {
                        return DropdownMenuItem(
                          value: item,
                          child: Text(item),
                        );
                      },
                    ).toList(),
                    onChanged: (String? value) {
                      setState(() {
                        Log.i("dropdown list: $value");
                        if (widget.position == PositionRow.first) {
                          ohmModel.suffixFirst = value!;
                        } else {
                          ohmModel.suffixSecond = value!;
                        }
                      });
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
