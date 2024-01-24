import 'dart:convert';

import 'package:android_intent_plus/android_intent.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      Padding(
          padding: const EdgeInsets.only(top: 100),
          child: OutlinedButton(
            child: Image.asset('assets/images/oppkey_atk.png'),
            onPressed: () {},
          )),
      TextButton(
          onPressed: () {},
          child: const Text(
            'Developer\nGuides',
            style: TextStyle(color: Colors.white, fontSize: 40),
          )),
      Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/settings');
          },
          child: const Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              'settings',
              style: TextStyle(fontSize: 40),
            ),
          ),
        ),
      ),
      const Padding(
        padding: EdgeInsets.all(12.0),
        child: TakePictureButton(),
      ),
      const Padding(
        padding: const EdgeInsets.all(12.0),
        child: ReturnCameraControlButton(),
      )
    ]);
  }
}

class TakePictureButton extends StatelessWidget {
  const TakePictureButton({
    Key? key,
  }) : super(key: key);
  void _closeDefaultCamera() {
    const intent = AndroidIntent(
      action: 'com.theta360.plugin.ACTION_PLUGIN_WEBAPI_CAMERA_OPEN',
    );
    intent.sendBroadcast();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: ElevatedButton(
        onPressed: () async {
          _closeDefaultCamera();
          Future.delayed(Duration(milliseconds: 1000));
          var body = {
            'name': 'camera.takePicture',
          };
          var response = await http.post(
              Uri.parse('http://localhost:8080/osc/commands/execute'),
              body: jsonEncode(body),
              headers: {'Content-Type': 'application/json;charset=utf-8'});
          print(response.body);
        },
        child: const Padding(
          padding: EdgeInsets.all(12.0),
          child: Text(
            'take picture',
            style: TextStyle(fontSize: 40),
          ),
        ),
      ),
    );
  }
}

class ReturnCameraControlButton extends StatelessWidget {
  const ReturnCameraControlButton({
    Key? key,
  }) : super(key: key);
  void _returnCameraComtrol() {
    const intent = AndroidIntent(
      action: 'com.theta360.plugin.ACTION_PLUGIN_WEBAPI_CAMERA_CLOSE',
    );
    intent.sendBroadcast();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: ElevatedButton(
        onPressed: () async {
          _returnCameraComtrol();
          Future.delayed(const Duration(milliseconds: 500));
          SystemChannels.platform.invokeListMethod('SystemNavigator.pop');
        },
        child: const Padding(
          padding: EdgeInsets.all(12.0),
          child: Text(
            'return control',
            style: TextStyle(fontSize: 40),
          ),
        ),
      ),
    );
  }
}
