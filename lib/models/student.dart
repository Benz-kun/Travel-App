class Student {
  int? id;
  String name;
  int age;
  String course;

  Student({this.id, required this.name, required this.age, required this.course});

  // Convert to Map
  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'name': name,
      'age': age,
      'course': course,
    };
    if (id != null) map['id'] = id;
    return map;
  }

  // Convert from Map
  factory Student.fromMap(Map<String, dynamic> map) {
    return Student(
      id: map['id'],
      name: map['name'],
      age: map['age'],
      course: map['course'],
    );
  }
}