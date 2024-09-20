import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:intl/intl.dart';
import 'package:todofirebase/Viewmodel/Viewmodel%20add%20user.dart';
import 'firebase_options.dart';

class Todoappui extends StatefulWidget {
  const Todoappui({super.key});

  @override
  State<Todoappui> createState() => _TodoappuiState();
}

class _TodoappuiState extends State<Todoappui> {
  final TextEditingController _taskController = TextEditingController();
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      
      


      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddTaskDialog(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }
  void _showAddTaskDialog(BuildContext context) {
    _taskController.clear();
    _selectedDate = null;
    _selectedTime = null;
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(('Add Task')),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _taskController,
                decoration: InputDecoration(labelText:('Task')),
              ),
              ElevatedButton(
                onPressed: () async {
                  final date = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2101),
                  );
                  setState(() {
                    _selectedDate=date;
                  });
                },
                child: Text(_selectedDate == null
                    ? 'Select Date'
                    : 'Date: ${ DateFormat.yMMMd().format(_selectedDate!)}'),
              ),
              ElevatedButton(
                onPressed: () async {
                  final time = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                  );
                  setState(() {
                    _selectedTime=time;
            
                  });
                },
                child: Text(_selectedTime == null
                    ? 'Select Time'
                    : 'Time: ${_selectedTime!.format(context)}'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('cancel'),
            ),
            TextButton(
              onPressed: () {
                print("fkhjgvg ${_selectedDate.toString()}");
        DatabaseService().addUser(taskName: _taskController.text,taskDate:_selectedDate.toString() ,taskTime: _selectedTime.toString());
        },
              child: Text('save'),
            ),
          ],
        );
      },
    );
  }

}


