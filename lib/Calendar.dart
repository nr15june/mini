import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar extends StatefulWidget {
  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  late CalendarFormat _calendarFormat;
  late DateTime _focusedDay;
  late DateTime _selectedDay;

  // เพิ่มการเก็บข้อมูลงานและวันที่แต่ละงานที่เลือก
  Map<DateTime, List<dynamic>> _events = {}; // รายการงานตามวันที่
  List<dynamic> _selectedEvents = []; // รายการงานที่เลือก

  @override
  void initState() {
    super.initState();
    _calendarFormat = CalendarFormat.month;
    _focusedDay = DateTime.now();
    _selectedDay = DateTime.now();
    // ตัวอย่างการกำหนดงานตัวอย่าง
    // _events = {
    //   DateTime.now().subtract(Duration(days: 1)): ['Event A', 'Event B'],
    //   DateTime.now(): ['Event A', 'Event B', 'Event C'],
    //   DateTime.now().add(Duration(days: 1)): ['Event A', 'Event B', 'Event C', 'Event D'],
    // };
    _selectedEvents = _events[_selectedDay] ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calendar'),
      ),
      body: Center(
        child: Column(
          children: [
            TableCalendar(
              firstDay: DateTime.utc(2020, 1, 1),
              lastDay: DateTime.utc(2030, 12, 31),
              focusedDay: _focusedDay,
              calendarFormat: _calendarFormat,
              selectedDayPredicate: (day) {
                return isSameDay(_selectedDay, day);
              },
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay;
                  _selectedEvents = _events[selectedDay] ?? []; // อัพเดทรายการงานที่เลือกเมื่อวันที่เปลี่ยน
                });
              },
              onFormatChanged: (format) {
                setState(() {
                  _calendarFormat = format;
                });
              },
              headerStyle: HeaderStyle(
                formatButtonVisible: false,
              ),
              calendarStyle: CalendarStyle(
                todayDecoration: BoxDecoration(
                  color: Colors.blue.withOpacity(0.5),
                ),
                selectedDecoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  shape: BoxShape.circle,
                ),
              ),
            ),
            SizedBox(height: 10), // ระยะห่างระหว่างปฏิทินและรายการงาน
            Expanded(
              child: _buildEventList(), // แสดงรายการงาน
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEventList() {
    return ListView.builder(
      itemCount: _selectedEvents.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(_selectedEvents[index]),
          onTap: () {
            // ตรวจสอบการคลิกที่รายการงานแต่ละรายการ (ทำอะไรก็ได้ตามที่คุณต้องการ)
          },
        );
      },
    );
  }
}
