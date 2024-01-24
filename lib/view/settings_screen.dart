import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:developer' as developer;

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  String responseText = 'response';

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Text(
          responseText,
          style: const TextStyle(color: Colors.white),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: ElevatedButton(
            onPressed: () async {
              // _closeDefaultCamera();
              var body = {
                'name': 'camera.setOptions',
                'parameters': {
                  'options': {'exposureCompensation': 2.0}
                }
              };
              var response = await http.post(
                  Uri.parse('http://localhost:8080/osc/commands/execute'),
                  body: jsonEncode(body),
                  headers: {'Content-Type': 'application/json;charset=utf-8'});
              developer.log(response.body, name: 'oppkey');
              setState(() {
                responseText = response.body;
                debugPrint('theta_debug: $responseText');
              });
            },
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'lighten',
                style: TextStyle(fontSize: 40),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: ElevatedButton(
            onPressed: () async {
              // _closeDefaultCamera();

              var response = await http.get(
                  Uri.parse('https://jsonplaceholder.typicode.com/todos/1'),
                  headers: {'Content-Type': 'application/json;charset=utf-8'});

              setState(() {
                responseText = response.body;
                debugPrint('theta_debug: $responseText');
              });
            },
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'external site',
                style: TextStyle(fontSize: 40),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 40.0),
          child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  'return',
                  style: TextStyle(fontSize: 40),
                ),
              )),
        )
      ],
    );
  }
}
