import 'package:easy_table/easy_table.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Easy Table'),
      ),
      body: EasyPaginatedTable(
        height: 300,
        width: 600,
        rowTail: true,
        rowsPerPage: 3,
        columnStyle: ColumnStyle(
          columnLabel: 'name',
          columnStyle: const TextStyle(
            color: Colors.blue,
            fontWeight: FontWeight.bold,
          ),
          rowCellLabel: 'Taha',
          rowCellStyle: const TextStyle(
            color: Colors.green,
            fontWeight: FontWeight.bold,
          ),
        ),
        onEdit: (inded) {},
        onDelete: (index) {},
        columns: const ['id', 'name', 'age'],
        rows: const [
          {'id': '1', 'name': 'Taha', 'age': '27'},
          {'id': '2', 'name': 'wahab', 'age': '33'},
          {'id': '3', 'name': 'ahmed', 'age': '30'},
          {'id': '4', 'name': 'Taha', 'age': '27'},
          {'id': '5', 'name': 'wahab', 'age': '33'},
          {'id': '6', 'name': 'ahmed', 'age': '30'},
        ],
      ),
    );
  }
}
