import 'package:flutter/material.dart';

class OfflineMode extends StatefulWidget {
  const OfflineMode({super.key});

  @override
  _OfflineModeState createState() => _OfflineModeState();
}

class _OfflineModeState extends State<OfflineMode> {
  // Add necessary variables and methods to handle offline mode

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Offline Mode',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(height: 16.0),
        // Add code to enable offline mode
      ],
    );
  }
}
