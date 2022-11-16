import 'package:dusty_dust/main.dart';
import 'package:dusty_dust/screen/test2_screen.dart';
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
          ValueListenableBuilder(
            valueListenable: Hive.box(testBox).listenable(),
            builder: (context, box, widget) {
              return Column(
                children: box.values
                    .map(
                      (e) => Text(
                        e.toString(),
                      ),
                    )
                    .toList(),
              );
            },
          ),
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
              box.put(1, '테스트5');
            },
            child: Text("데이터 넣기"),
          ),
          ElevatedButton(
            onPressed: () {
              final box = Hive.box(testBox);

              // box.add('테스트3');
              print(box.get(2));
              // box.getAt(3); 몇번째에 위치하는지 가져오기
            },
            child: Text("특정 값 가져오기"),
          ),
          ElevatedButton(
            onPressed: () {
              final box = Hive.box(testBox);

              box.deleteAt(2);
            },
            child: Text("삭제하기"),
          ),
          ElevatedButton(
            onPressed: () {
              final box = Hive.box(testBox);

              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => Test2Screen(),
                ),
              );
            },
            child: Text("이동하기"),
          ),
        ],
      ),
    );
  }
}
