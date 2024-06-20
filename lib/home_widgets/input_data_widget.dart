import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ohms_law/providers/ohm_model.dart';
import 'package:ohms_law/util/helpers/set_input_data.dart';
import 'package:provider/provider.dart';

enum PositionRow { first, second }

class InputDataWidget extends StatefulWidget {
  final PositionRow position;

  const InputDataWidget({super.key, required this.position});

  @override
  State<InputDataWidget> createState() => _InputDataWidgetState();
}

class _InputDataWidgetState extends State<InputDataWidget> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
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
                      controller: _controller,
                      onChanged: (String value) {
                        if (kDebugMode) {
                          print(value);
                        }
                        if(widget.position == PositionRow.first) {
                          ohmModel.valueFirst = num.parse(value);
                        } else {
                          ohmModel.valueSecond =  num.parse(value);
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
                        labelText: getLabel(
                          position: widget.position,
                          unitType: ohmModel.operation,
                        ),
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
                    items: getSuffix(
                            position: widget.position,
                            unitType: ohmModel.operation)
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
                        if (kDebugMode) {
                          print(value);
                        }
                        if(widget.position == PositionRow.first) {
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
