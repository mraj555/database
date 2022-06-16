import 'package:database/custom_gridview.dart';
import 'package:flutter/material.dart';

class Layoout extends StatelessWidget {
  const Layoout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: LayoutBuilder(
          builder: (context, constraints) {
            print(constraints.maxWidth);
            if (constraints.maxWidth > 1000) {
              return CustomGridView(
                crossAxisCount: 4,
                child: Container(
                  color: Colors.yellow,
                  child: customCard(),
                  height: constraints.maxWidth / 4,
                  width: constraints.maxWidth / 4,
                ),
              );
            }
            if (constraints.maxWidth > 900 && constraints.maxWidth < 1000) {
              return CustomGridView(
                crossAxisCount: 3,
                child: Container(
                  color: Colors.red,
                  child: customCard(),
                  height: constraints.maxWidth / 4,
                  width: constraints.maxWidth / 4,
                ),
              );
            }
            if (constraints.maxWidth > 600 && constraints.maxWidth < 900) {
              return CustomGridView(
                crossAxisCount: 2,
                child: Container(
                  color: Colors.green,
                  child: customCard(),
                  height: constraints.maxWidth / 4,
                  width: constraints.maxWidth / 4,
                ),
              );
            }
            return ListView.builder(
              itemCount: 20,
              itemBuilder: (context, index) => Container(
                alignment: Alignment.center,
                color: Colors.orange,
                child: customCard(),
                height: constraints.maxWidth / 2,
                width: constraints.maxWidth / 2,
              ),
            );
          },
        ),
      ),
    );
  }

  Widget customCard() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    CircleAvatar(
                      radius: 60,
                      backgroundColor: Colors.black,
                      child: CircleAvatar(
                        radius: 40,
                        child: Container(
                          decoration: BoxDecoration(color: Colors.transparent, shape: BoxShape.circle, border: Border.all(color: Colors.white)),
                        ),
                        backgroundColor: Colors.black,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}