import 'package:flutter/material.dart';
import 'package:miniproject/AddAJob.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map<String, String> homeData =
      {}; // กำหนดตัวแปร homeData เพื่อเก็บข้อมูลในหน้า Home

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            //if (homeData.isNotEmpty) ...[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Container(
                    width: 100,
                    height: 100, 
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Job Title: ${homeData['jobTitle']}',
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Time: ${homeData['time']}',
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Date: ${homeData['date']}',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            // ] else
            //   //หากไม่มีข้อมูลงาน
            //   Expanded(
            //     child: Center(
            //       child: Text(
            //         'No job data available',
            //         style: TextStyle(color: Colors.grey),
            //       ),
            //     ),
            //   ),
              
          ],
        ),
      ),
      
    );
  }
}
