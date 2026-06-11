import 'package:flutter/material.dart';

class ModuleTabScreen extends StatefulWidget {
  const ModuleTabScreen({Key? key}) : super(key: key);

  @override
  _ModuleTabScreenState createState() => _ModuleTabScreenState();
}

class _ModuleTabScreenState extends State<ModuleTabScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(0),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 10, // Example number of modules
      itemBuilder: (context, index) {
        return ListTile(
          title: Text('Module ${index + 1}'),
          subtitle: Text('Description of Module ${index + 1}'),
          onTap: () {
            // Handle module tap
          },
        );
      },
    );
  }
}
