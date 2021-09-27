import 'package:flutter/material.dart';
import 'package:flutter_qiblah/flutter_qiblah.dart';
import 'package:webview_rizaldi/plugin/kiblat/loading_indicator.dart';
import 'package:webview_rizaldi/plugin/kiblat/qiblah_compass.dart';
import 'package:webview_rizaldi/plugin/kiblat/qiblah_maps.dart';

void main() => runApp(Kiblat());

class Kiblat extends StatefulWidget {
  @override
  _KiblatState createState() => _KiblatState();
}

class _KiblatState extends State<Kiblat> {
  final _deviceSupport = FlutterQiblah.androidDeviceSensorSupport();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Kiblat'),
          centerTitle: true,
        ),
        body: FutureBuilder(
          future: _deviceSupport,
          builder: (_, AsyncSnapshot<bool?> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting)
              return LoadingIndicator();
            if (snapshot.hasError)
              return Center(
                child: Text("Error: ${snapshot.error.toString()}"),
              );

            if (snapshot.data!)
              return QiblahCompass();
            else
              return QiblahMaps();
          },
        ),
      ),
    );
  }
}
