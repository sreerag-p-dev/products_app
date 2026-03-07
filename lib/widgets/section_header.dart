import 'package:flutter/material.dart';

Widget sectionHeader(String title) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        title,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      const Text(
        "Show All",
        style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w500),
      ),
    ],
  );
}
