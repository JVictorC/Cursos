import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    DevicePreview(
      builder: (_) => const MyApp(),
      enabled: true,
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      builder: DevicePreview.appBuilder,
      locale: DevicePreview.locale(context),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        color: Colors.red,
      ),
      // body: GridView.extent(
      //   maxCrossAxisExtent: 400,
      //   children: [
      //     Container(
      //       color: Colors.blue,
      //       height: 100,
      //     ),
      //     Container(
      //       color: Colors.red,
      //       height: 100,
      //     ),
      //     Container(
      //       color: Colors.yellow,
      //       height: 100,
      //     ),
      //     Container(
      //       color: Colors.green,
      //       height: 100,
      //     ),
      //   ],
      // ),
      // body: OrientationBuilder(
      //   builder: (_, orietantio) => GridView.count(
      //     crossAxisCount: orietantio == Orientation.landscape ? 4 : 2,
      //     children: [
      //       Container(
      //         color: Colors.blue,
      //         height: 100,
      //       ),
      //       Container(
      //         color: Colors.red,
      //         height: 100,
      //       ),
      //       Container(
      //         color: Colors.yellow,
      //         height: 100,
      //       ),
      //       Container(
      //         color: Colors.green,
      //         height: 100,
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
