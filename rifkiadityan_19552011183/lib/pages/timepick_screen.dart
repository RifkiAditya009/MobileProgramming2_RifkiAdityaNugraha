import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:date_time_picker/date_time_picker.dart';

class TimepickScreen extends StatefulWidget {
  const TimepickScreen({Key? key}) : super(key: key);

  @override
  _TimepickScreenState createState() => _TimepickScreenState();
}

class _TimepickScreenState extends State<TimepickScreen> {
  TimeOfDay selectedTime = TimeOfDay.now();

  showTime(context) async {
    //inisial dateTime
    final waktu = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );

    if (waktu != null) {
      setState(() {
        selectedTime = waktu;
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
                "Pick Time",
                style: TextStyle(color: Colors.greenAccent),
              ),
              onPressed: () {
                showTime(context);
              },
            ),
            Text(
              'Time Value : ' + selectedTime.format(context),
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.greenAccent,
    );
  }
}
