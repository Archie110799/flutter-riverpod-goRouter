import 'package:flutter/material.dart';

class CheckboxTable extends StatefulWidget {
  final VoidCallback handleChange;

  const CheckboxTable({Key? key, required this.handleChange}) : super(key: key);

  @override
  _CheckboxTableState createState() => _CheckboxTableState();
}

class _CheckboxTableState extends State<CheckboxTable> {
  List<bool> selectedRows = List.filled(5, false);

  // Function to handle changes in selected rows
  void handleChange(int index, bool value) {
    setState(() {
      selectedRows[index] = value;
    });

    // Call the callback function provided by the parent widget
    widget.handleChange();
  }

  @override
  Widget build(BuildContext context) {
    return DataTable(
      columns: const [
        DataColumn(label: Text('ID')),
        DataColumn(label: Text('Name')),
        DataColumn(label: Text('Select')),
      ],
      rows: List<DataRow>.generate(
        5,
        (index) => DataRow(
          cells: [
            DataCell(Text((index + 1).toString())),
            DataCell(Text('Item ${index + 1}')),
            DataCell(
              Checkbox(
                value: selectedRows[index],
                onChanged: (value) {
                  handleChange(index, value!);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
