<!-- 
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages). 

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages). 
-->

This is a multi axis scrollable paginated data table, that allows you to scroll on both the vertical and horizontal axis, and also gives you the ability to style columns
and rows cells. please look at the demo blow.

## Features

### Demo

![alt text](https://i.postimg.cc/8P8jpjxc/Screenshot-4.png)

This widget serves the same purpose as a DataTable.

## Getting started

Simply add into your dependencies the following line.

```dart
dependencies:
  easy_table: ^0.0.2
```

## Usage

```dart
EasyPaginatedTable(
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
        onEdit: (index) {},
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
      )
```

## Additional information

GitHub Repo: <https://github.com/Tahateber95/flutter_easy_table>
