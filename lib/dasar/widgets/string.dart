import 'package:flutter/material.dart';

import '../model/sample.dart';

class string extends StatelessWidget {
  const string({
    super.key,
    required this.result,
  });

  final Sample? result;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('${result?.name}'),
        Text('${result?.age}'),
      ],
    );
  }
}
