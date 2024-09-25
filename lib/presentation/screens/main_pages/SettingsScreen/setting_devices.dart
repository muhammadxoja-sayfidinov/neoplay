import 'package:flutter/material.dart';

class SettingDevices extends StatefulWidget {
  const SettingDevices({super.key});

  @override
  State<SettingDevices> createState() => _SettingDevicesState();
}

class _SettingDevicesState extends State<SettingDevices> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("setting devices"),
    );
  }
}
