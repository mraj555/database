import 'package:flutter/material.dart';

class CustomGridView extends StatelessWidget {
  final int crossAxisCount;
  final Widget child;
  const CustomGridView({Key? key,required this.crossAxisCount, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 20,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (context, index) => child
    );
  }
}
