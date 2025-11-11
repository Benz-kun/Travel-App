import 'package:flutter/material.dart';
import '../db/database_helper.dart';
import '../models/student.dart';

class StudentScreen extends StatefulWidget {
  @override
  _StudentScreenState createState() => _StudentScreenState();
}

class _StudentScreenState extends State<StudentScreen> {
  final DatabaseHelper dbHelper = DatabaseHelper();
  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final courseController = TextEditingController();

  List<Student> students = [];

  @override
  void initState() {
    super.initState();
    _refreshStudents();
  }

  Future<void> _refreshStudents() async {
    final data = await dbHelper.getStudents();
    setState(() {
      students = data;
    });
  }

  Future<void> _addStudent() async {
    await dbHelper.insertStudent(
      Student(
        name: nameController.text,
        age: int.parse(ageController.text),
        course: courseController.text,
      ),
    );
    _refreshStudents();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Student Info')),
      body: Column(
        children: [
          TextField(controller: nameController, decoration: const InputDecoration(labelText: 'Name')),
          TextField(controller: ageController, decoration: const InputDecoration(labelText: 'Age'), keyboardType: TextInputType.number),
          TextField(controller: courseController, decoration: const InputDecoration(labelText: 'Course')),
          ElevatedButton(onPressed: _addStudent, child: const Text('Add')),
          Expanded(
            child: ListView.builder(
              itemCount: students.length,
              itemBuilder: (context, index) {
                final s = students[index];
                return ListTile(
                  title: Text('${s.name} (${s.age})'),
                  subtitle: Text(s.course),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}