import 'package:flutter/material.dart';

class MenuActions extends StatelessWidget {
  const MenuActions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: IconButton(
        onPressed: () {
          //TODO: limpiar la pantalla
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text("Sin implementar")));
        },
        icon: const Icon(
          Icons.more_vert,
          color: Colors.white,
        ),
      ),
    );
  }
}
