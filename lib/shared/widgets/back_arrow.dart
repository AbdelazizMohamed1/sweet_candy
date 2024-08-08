import 'package:flutter/material.dart';

import '../components/components.dart';

class BackArrow extends StatelessWidget {
  const BackArrow({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Components.navigateBack(context: context);
      },
      icon: const Icon(Icons.arrow_back_outlined),
    );
  }
}
