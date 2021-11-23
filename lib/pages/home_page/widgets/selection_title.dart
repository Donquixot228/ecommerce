
import 'package:flutter/material.dart';

class SelectionTitle extends StatelessWidget {
  final String title;
  const SelectionTitle({
    required this.title
    ,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
      child: Align(
        alignment: Alignment.topLeft,
        child: Text(
          title,
          style: Theme.of(context).textTheme.headline2!.copyWith(fontSize: 25),
        ),
      ),
    );
  }
}
