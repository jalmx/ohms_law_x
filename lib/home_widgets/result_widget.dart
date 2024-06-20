import 'package:flutter/material.dart';
import 'package:ohms_law/providers/ohm_model.dart';
import 'package:provider/provider.dart';

class ResultWidget extends StatefulWidget {
  const ResultWidget({super.key});

  @override
  State<ResultWidget> createState() => _ResultWidgetState();
}

class _ResultWidgetState extends State<ResultWidget> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Consumer<OhmModel>(
        builder: (BuildContext context, OhmModel ohmModel, Widget? child) {
          return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Text(
                    ohmModel.unitLetter,
                    style: const TextStyle(fontSize: 24),
                    overflow: TextOverflow.fade,
                  ),
                ),
                Text(
                  ohmModel.unitLetter,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 80,
                      overflow: TextOverflow.fade),
                )
              ]);
        },
      ),
    );
  }
}
