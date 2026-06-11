import 'package:flutter/material.dart';

class ResourcesTabViewScreen extends StatefulWidget {
  const ResourcesTabViewScreen({Key? key}) : super(key: key);

  @override
  _ResourcesTabViewScreenState createState() => _ResourcesTabViewScreenState();
}

class _ResourcesTabViewScreenState extends State<ResourcesTabViewScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Resources",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        // Add more widgets related to the resources tab view here
      ],
    );
  }
}
