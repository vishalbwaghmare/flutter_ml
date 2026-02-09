import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qr_flutter/qr_flutter.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarIconBrightness: Brightness.dark,
            systemNavigationBarColor: Colors.white,
            systemNavigationBarIconBrightness: Brightness.dark,

        )
    );
    return Scaffold(
      body: Center(
        child: QrImageView(
            data: 'Vishal',
            version: QrVersions.auto,
            size: 200,
            semanticsLabel: "Qr Code",
        ) ,
      ),
    );
  }
}
