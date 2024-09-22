import 'package:flutter/material.dart';

class listString extends StatelessWidget {
  const listString({
    super.key,
    required this.hoby,
  });

  final List<String>? hoby;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: (hoby?.map((item) => Text(item)).toList() ?? []),
    );
  }
}
