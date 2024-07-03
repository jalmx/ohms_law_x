import 'package:flutter/material.dart';
import 'package:ohms_law/home_widgets/input_data_widget.dart';
import 'package:ohms_law/home_widgets/option_second.dart';
import 'package:ohms_law/home_widgets/options_widget.dart';
import 'package:ohms_law/home_widgets/question_widget.dart';
import 'package:ohms_law/home_widgets/result_widget.dart';
import 'package:ohms_law/providers/ohm_model.dart';
import 'package:provider/provider.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: <Widget>[
        TitleWidget(),
        OptionsWidget(),
        InputDataWidget(
          position: PositionRow.first,
        ),
        InputDataWidget(
          position: PositionRow.second,
        ),
        OptionSecond(),
        ResultWidget(),
      ],
    );
  }
}
