import 'package:flutter/material.dart';

import '../model/sample.dart';

class listOfDynamic extends StatelessWidget {
  const listOfDynamic({
    super.key,
    required this.result,
  });

  final Sample? result;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text('${result?.github.username}'),
          Text('${result?.github.repositoris}'),
        ],
      ),
    );
  }
}
