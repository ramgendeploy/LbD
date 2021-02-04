import 'package:flutter/material.dart';
import 'package:settings_dialog/settings_dialog.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Settings Dialog',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Map<String, dynamic> settingsPage = <String, dynamic>{
    'name': 'Ramiro',
    'weight': 80,
    'height': 180,
    'age': 22,
    'pushups': true,
    'squats': false,
    'bicycle': false,
    'burpees': false
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Settings Dialog'),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Column(
                children: <Widget>[
                  ListTile(
                    leading: const Icon(Icons.label),
                    title: const Text('Name'),
                    subtitle: Text(settingsPage['name'].toString()),
                  ),
                  ListTile(
                    leading: const Icon(Icons.assessment),
                    title: const Text('Weight'),
                    subtitle: Text(settingsPage['weight'].toString()),
                  ),
                  ListTile(
                    leading: const Icon(Icons.reorder),
                    title: const Text('Height'),
                    subtitle: Text(settingsPage['height'].toString()),
                  ),
                  ListTile(
                    leading: const Icon(Icons.accessibility),
                    title: const Text('Age'),
                    subtitle: Text(settingsPage['age'].toString()),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: <Widget>[
                            const Text(
                              'Push Ups',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child:
                                  (settingsPage['pushups'].toString() == 'true')
                                      ? const Icon(Icons.thumb_up)
                                      : const Icon(Icons.thumb_down),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: <Widget>[
                            const Text(
                              'Squats',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child:
                                  (settingsPage['squats'].toString() == 'true')
                                      ? const Icon(Icons.thumb_up)
                                      : const Icon(Icons.thumb_down),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: <Widget>[
                            const Text(
                              'Bicycle',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child:
                                  (settingsPage['bicycle'].toString() == 'true')
                                      ? const Icon(Icons.thumb_up)
                                      : const Icon(Icons.thumb_down),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: <Widget>[
                            const Text(
                              'Burpees',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child:
                                  (settingsPage['burpees'].toString() == 'true')
                                      ? const Icon(Icons.thumb_up)
                                      : const Icon(Icons.thumb_down),
                            )
                          ],
                        ),
                      )
                    ],
                  )
                  // CheckboxListTile(value: null, onChanged: null)
                ],
              ),
              OutlineButton(
                  onPressed: () {
                    settingsDialog(context, settingsPage).then(
                      (Map<String, dynamic> settings) {
                        setState(() => settingsPage = settings);
                      },
                    );
                  },
                  child: const Text('Edit Settings'))
            ],
          ),
        ));
  }
}
