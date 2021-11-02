import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:date_time_picker/date_time_picker.dart';

class DatepickScreen extends StatefulWidget {
  const DatepickScreen({Key? key}) : super(key: key);

  @override
  _DatepickScreenState createState() => _DatepickScreenState();
}

class _DatepickScreenState extends State<DatepickScreen> {
  DateTime selectedDate = DateTime.now();
  DateFormat dateFormat = DateFormat("dd-MM-yyyy");

  showDate(context) async {
    //inisialisasi datetime
    final pilih = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: selectedDate.subtract(Duration(days: 30)),
      lastDate: DateTime(selectedDate.year + 1),
    );

    if (pilih != null) {
      setState(() {
        selectedDate = pilih;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            TextButton(
              style: TextButton.styleFrom(backgroundColor: Colors.white),
              child: Text(
                "Pick Date",
                style: TextStyle(color: Colors.redAccent),
              ),
              onPressed: () {
                showDate(context);
              },
            ),
            Text(
              'Date Value : ' + dateFormat.format(selectedDate),
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
              ),
            )
          ],
        ),
      ),
      backgroundColor: Colors.redAccent,
    );
  }
}
