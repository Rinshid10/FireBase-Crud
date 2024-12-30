class StudentData {
  String? name;
  String? age;
  StudentData({required this.age, required this.name});
  Map<String, dynamic> ToFireStore() {
    return {"name": name, "age": age};
  }

  factory StudentData.fromfireStore(Map<String, dynamic> fromFirebase) {
    return StudentData(age: fromFirebase['age'], name: fromFirebase['name']);
  }
}
