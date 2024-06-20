import 'package:flutter/material.dart';
import 'package:ohms_law/providers/ohm_model.dart';
import 'package:provider/provider.dart';

class OptionSecond extends StatefulWidget {
  const OptionSecond({
    super.key,
  });

  @override
  State<OptionSecond> createState() => _OptionSecondState();
}

class _OptionSecondState extends State<OptionSecond> {
  bool status = false;

  @override
  Widget build(BuildContext context) {
    return Consumer<OhmModel>(
      builder: (BuildContext context, OhmModel ohmModel, Widget? child) {
        return ohmModel.isPower
            ? Row(
                children: [
                  Expanded(
                    child: Container(
                      alignment: Alignment.centerRight,
                      child: const Text("Voltaje"),
                    ),
                  ),
                  Switch(
                    value: status,
                    onChanged: (bool value) {
                      setState(
                        () {
                          status = value;
                        },
                      );
                    },
                  )
                ],
              )
            : Container();
      },
    );
  }
}
