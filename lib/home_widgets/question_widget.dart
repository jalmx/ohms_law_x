import 'package:flutter/material.dart';
import 'package:ohms_law/providers/ohm_model.dart';
import 'package:provider/provider.dart';

class TitleWidget extends StatefulWidget {
  const TitleWidget({
    super.key,
  });

  @override
  State<TitleWidget> createState() => _TitleWidgetState();
}

class _TitleWidgetState extends State<TitleWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        const Expanded(
          flex: 4,
          child: Text(
            "What do you want to calculate?",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
          ),
        ),
        Expanded(
          flex: 1,
          child: Column(
            children: [
              const Text("Power"),
              Consumer<OhmModel>(
                builder:
                    (BuildContext context, OhmModel ohmModel, Widget? child) {
                  return Switch(
                    value: ohmModel.isPower,
                    activeColor: Colors.red,
                    onChanged: (bool value) {
                      setState(() {
                        ohmModel.isPower = value;
                      });
                    },
                  );
                },
              ),
            ],
          ),
        )
      ]),
    );
  }
}
