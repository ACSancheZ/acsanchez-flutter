import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:qr_flutter/qr_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Antonio Sanchez dos Santos',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String githubUrl = 'https://github.com/acsanchez';
  final String bitcoinAddress =
      'bc1ps3f9626t5wtea6xvrmz2eh87c08g6sk2fchqe7f43enfkxputnsq2tst6l';
  final String bitcoinUrl =
      'bitcoin:bc1ps3f9626t5wtea6xvrmz2eh87c08g6sk2fchqe7f43enfkxputnsq2tst6l';

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Antonio Sanchez dos Santos'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Antonio Sanchez dos Santos',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              GestureDetector(
                onTap: () => _launchURL(githubUrl),
                child: Text(
                  'github.com/acsanchez',
                  style: TextStyle(
                      color: Colors.blue, decoration: TextDecoration.underline),
                ),
              ),
              SizedBox(height: 16),
              QrImageView(
                version: QrVersions.auto,
                data: bitcoinUrl,
                size: 200.0,
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => _launchURL(bitcoinUrl),
                child: Text('Donate Bitcoin'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
