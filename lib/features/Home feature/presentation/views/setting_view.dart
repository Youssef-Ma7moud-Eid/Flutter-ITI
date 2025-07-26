import 'package:flutter/material.dart';
import 'package:iti_flutter/features/Home%20feature/presentation/views/widgets/setting_view_body.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Settings',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),

        centerTitle: true,
        elevation: 4,
      ),
      body: SettingViewBody(),
    );
  }
}
