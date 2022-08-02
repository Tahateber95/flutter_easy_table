import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class EasyPaginatedTable extends StatelessWidget {
  EasyPaginatedTable(
      {Key? key,
      required this.rows,
      required this.columns,
      this.onEdit,
      this.onDelete,
      this.rowTail = false,
      required this.width,
      required this.height,
      this.columnStyle,
      this.rowsPerPage = 10,
      this.columnSpacing = 100,
      this.horizontalMargin = 5})
      : super(key: key);
  final List<Map<String, String?>> rows;
  final List<String> columns;
  final ColumnStyle? columnStyle;
  final bool rowTail;
  final void Function(int)? onEdit;
  final void Function(int)? onDelete;
  final double width, height;
  final int rowsPerPage;
  final double columnSpacing;
  final double horizontalMargin;
  @override
  Widget build(BuildContext context) {
    final DataTableSource data = MyData(
        rows: rows,
        rowTail: rowTail,
        onEdit: onEdit,
        onDelete: onDelete,
        columns: columns,
        columnStyle: columnStyle);

    final ScrollController controller = ScrollController();

    return SizedBox(
      height: height,
      width: width,
      child: Scrollbar(
        controller: controller,
        child: SingleChildScrollView(
          controller: controller,
          scrollDirection: Axis.horizontal,
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: height,
            child: ListView(
              shrinkWrap: true,
              primary: false,
              children: [
                PaginatedDataTable(
                  source: data,
                  columns: [
                    ...List.generate(
                        columns.length,
                        (index) => DataColumn(
                                label: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(columns[index]),
                            ))),
                    rowTail
                        ? const DataColumn(
                            label: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(''),
                          ))
                        : DataColumn(label: Text(''))
                  ],
                  columnSpacing: 100,
                  horizontalMargin: 5,
                  rowsPerPage: rowsPerPage,
                  showCheckboxColumn: false,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MyData extends DataTableSource {
  MyData({
    Key? key,
    required this.rows,
    required this.columns,
    this.columnStyle,
    this.rowTail = false,
    required this.onEdit,
    required this.onDelete,
  });

  final List<Map<String, String?>> rows;
  final List<String> columns;
  final bool rowTail;
  final ColumnStyle? columnStyle;
  final void Function(int)? onEdit;
  final void Function(int)? onDelete;

  @override
  bool get isRowCountApproximate => false;
  @override
  int get rowCount => rows.length;
  @override
  int get selectedRowCount => 0;
  @override
  DataRow getRow(int index) {
    return DataRow(cells: [
      ...columns.map((column) {
        return DataCell(Padding(
            padding: const EdgeInsets.all(8.0),
            child: columnStyle != null
                ? (column == columnStyle!.columnLabel &&
                        rows[index][column] == columnStyle!.rowCellLabel)
                    ? Text(
                        rows[index][column] ?? "",
                        style: columnStyle!.rowCellStyle,
                      )
                    : (column == columnStyle!.columnLabel)
                        ? Text(
                            rows[index][column] ?? "",
                            style: columnStyle!.columnStyle,
                          )
                        : (column == columnStyle!.columnLabel &&
                                columnStyle!.rowCellLabel == null)
                            ? Text(
                                rows[index][column] ?? "",
                                style: columnStyle!.columnStyle,
                              )
                            : Text(
                                rows[index][column] ?? "",
                                style: TextStyle(),
                              )
                : Text(
                    rows[index][column] ?? "",
                    style: TextStyle(),
                  )));
      }).toList(),
      rowTail
          ? DataCell(Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      onEdit!(index);
                    },
                    icon: const Icon(Iconsax.edit),
                  ),
                  const SizedBox(width: 5.0),
                  IconButton(
                    onPressed: () {
                      onDelete!(index);
                    },
                    icon: const Icon(Iconsax.note_remove, color: Colors.red),
                  ),
                ],
              ),
            ))
          : const DataCell(Text(''))
    ]);
  }
}

class ColumnStyle {
  ColumnStyle(
      {required this.columnLabel,
      required this.columnStyle,
      this.rowCellLabel,
      this.rowCellStyle});

  /// The specfic column's name that needs to be styled.
  final String columnLabel;

  /// The specfic rows's name that needs to be styled.
  final String? rowCellLabel;
  final TextStyle? rowCellStyle;
  final TextStyle columnStyle;
}
