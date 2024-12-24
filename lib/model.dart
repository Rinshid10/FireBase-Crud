class StudentData {
  String? name;
  String? age;
  StudentData({required this.age, required this.name});
  Map<String, dynamic> ToFireStore() {
    return {"name": name, "age": age};
  }
}
