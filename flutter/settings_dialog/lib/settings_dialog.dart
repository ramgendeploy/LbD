import 'package:flutter/material.dart';

Future<Map<String, dynamic>> settingsDialog(
  BuildContext context,
  Map<String, dynamic> settings,
) async {
  return await showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext ctx) {
      String name = settings['name'].toString();
      int weight = settings['weight'] as int;
      int height = settings['height'] as int;
      int age = settings['age'] as int;

      bool pushups = settings['pushups'].toString() == 'true';
      bool squats = settings['squats'].toString() == 'true';
      bool bicylce = settings['bicycle'].toString() == 'true';
      bool burpees = settings['burpees'].toString() == 'true';

      return StatefulBuilder(
        builder: (BuildContext ctx, StateSetter setState) {
          return SimpleDialog(
            contentPadding: EdgeInsets.zero,
            titlePadding: const EdgeInsets.fromLTRB(24.0, 10.0, 24.0, 0.0),
            title: const Center(child: Text('Settings')),
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  initialValue: name,
                  decoration: const InputDecoration(
                      icon: Icon(Icons.label), labelText: 'Name'),
                  onChanged: (String value) => setState(() => name = value),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  initialValue: weight.toString(),
                  decoration: const InputDecoration(
                      icon: Icon(Icons.assessment), labelText: 'Weight'),
                  onChanged: (String value) =>
                      setState(() => weight = int.parse(value)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
                child: Text('Age $age'),
              ),
              Slider(
                  value: age.toDouble(),
                  min: 0,
                  max: 150,
                  divisions: 150,
                  label: age.toString(),
                  onChanged: (double value) {
                    setState(() {
                      age = value.round();
                      // print(value.round());
                    });
                  }),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
                child: Text('Height $height'),
              ),
              Slider(
                  value: height.toDouble(),
                  min: 0,
                  max: 300,
                  divisions: 300,
                  label: height.toString(),
                  onChanged: (double value) {
                    setState(() {
                      height = value.round();
                      // print(value.round());
                    });
                  }),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      const Text('Push ups'),
                      Checkbox(
                          value: pushups,
                          onChanged: (bool value) =>
                              setState(() => pushups = value)),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Text('Squats'),
                      Checkbox(
                          value: squats,
                          onChanged: (bool value) =>
                              setState(() => squats = value)),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      const Text('Bicycle'),
                      Checkbox(
                          value: bicylce,
                          onChanged: (bool value) =>
                              setState(() => bicylce = value)),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      const Text('Burpees'),
                      Checkbox(
                          value: burpees,
                          onChanged: (bool value) =>
                              setState(() => burpees = value)),
                    ],
                  ),
                ],
              ),
              FlatButton(
                padding: const EdgeInsets.all(16),
                child: const Text('Apply'),
                onPressed: () {
                  Navigator.of(context, rootNavigator: true).pop(
                    <String, dynamic>{
                      'name': name,
                      'weight': weight,
                      'height': height,
                      'age': age,
                      'pushups': pushups,
                      'squats': squats,
                      'bicycle': bicylce,
                      'burpees': burpees
                    },
                  );
                },
              ),
            ],
          );
        },
      );
    },
  );
}
