import 'package:dusty_dust/main.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  _TestScreenState createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Test Screen'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Test Screen",
              textAlign: TextAlign.center,
            ),
            ElevatedButton(
              onPressed: () {
                final box = Hive.box(testBox);

                print(box.keys.toList());
                print(box.values.toList());
              },
              child: Text("박스 프린트하기"),
            ),
            ElevatedButton(
              onPressed: () {
                final box = Hive.box(testBox);

                // box.add('테스트3');
                box.put(50, "테스트5");
              },
              child: Text("데이터 넣기"),
            ),
            ElevatedButton(
              onPressed: () {
                final box = Hive.box(testBox);

                // box.add('테스트3');
                print(box.get(2));
              },
              child: Text("특정 값 가져오기"),
            ),
          ],
        ));
  }
}
