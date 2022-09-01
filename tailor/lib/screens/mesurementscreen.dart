// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:tailor/utils/theme.dart';

class MesurementScreen extends StatelessWidget {
  const MesurementScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.all(8),
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Mesure(
              label: "LON",
            ),
            Mesure(label: "LAR"),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Mesure(
              label: "LON",
            ),
            Mesure(label: "LAR"),
          ],
        )
      ]),
    );
  }
}

class Mesure extends StatelessWidget {
  const Mesure({
    Key? key,
    required this.label,
  }) : super(key: key);
  final String label;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Card(
          color: secondary,
          child: Container(
            height: 50,
            width: 50,
            child:
                const Center(child: Text("A", style: TextStyle(fontSize: 30))),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Container(
          width: 100,
          padding: const EdgeInsets.symmetric(horizontal: 5),
          decoration: BoxDecoration(
              color: primary,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 3,
                  blurRadius: 5,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ]),
          child: TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintText: label,
              suffix: Text("CM", style: TextStyle(color: secondary)),
              hintStyle: const TextStyle(color: Colors.white),
              border: InputBorder.none,
            ),
          ),
        )
      ],
    );
  }
}
