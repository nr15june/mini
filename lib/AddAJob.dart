import 'package:flutter/material.dart';

class AddAJob extends StatefulWidget {
  @override
  _AddAJobState createState() => _AddAJobState();
}

class _AddAJobState extends State<AddAJob> {
  String jobTitle = '';
  TimeOfDay? selectedTime;
  DateTime? selectedDate = DateTime.now();

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      setState(() {
        selectedTime = picked;
      });
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate!,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Job'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              onChanged: (value) {
                setState(() {
                  jobTitle = value;
                });
              },
              decoration: InputDecoration(
                labelText: 'Job Title',
              ),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Time: ${selectedTime?.format(context)}', // Format ข้อมูลเวลา
                  ),
                ),
                ElevatedButton(
                  onPressed: () => _selectTime(context),
                  child: Text('เลือกเวลา'),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Date: ${selectedDate?.toString().substring(0, 10)}', // Format ข้อมูลวันที่
                  ),
                ),
                ElevatedButton(
                  onPressed: () => _selectDate(context),
                  child: Text('เลือกวันที่'),
                ),
              ],
            ),
            SizedBox(height: 20),
            // หลังจากกดปุ่ม Save
            ElevatedButton(
              onPressed: () {
                Navigator.pop(
                  context,
                  {
                    'jobTitle': jobTitle,
                    'date': selectedDate != null
                        ? '${selectedDate!.year}-${selectedDate!.month}-${selectedDate!.day}'
                        : '',
                    'time': selectedTime != null
                        ? '${selectedTime!.hour}:${selectedTime!.minute}'
                        : '',
                  },
                );
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
