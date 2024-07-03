import 'package:flutter/material.dart';
import 'package:ohms_law/providers/ohm_model.dart';
import 'package:provider/provider.dart';

class MenuActions extends StatelessWidget {
  const MenuActions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: Row(
        children: [
          Consumer<OhmModel>(builder: (BuildContext context, OhmModel ohmModel, Widget? child) {
            return IconButton(
                onPressed: () {
                  ohmModel.clear();
                },
                icon: const Icon(
                  Icons.delete,
                  color: Colors.white,
                ));
          }),
          IconButton(
            onPressed: () {
              ScaffoldMessenger.of(context)
                  .showSnackBar(const SnackBar(content: Text("Nothing")));
            },
            icon: const Icon(
              Icons.more_vert,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
