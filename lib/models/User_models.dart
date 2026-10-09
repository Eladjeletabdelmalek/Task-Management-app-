import 'package:flutter_application_test/models/Task_models.dart';

class  User {
   String id;
   String name;
   String email;
   String? phone;
   String? position;
   List<Task>? tasks = [];
  User({required this.id, required this.name, required this.email, this.phone, this.position, this.tasks = const []});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      position: json['position'],
      tasks: (json['tasks'] as List<dynamic>?)
          ?.map((taskJson) => Task.fromJson(taskJson as Map<String, dynamic>))
          .toList()
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'position': position,
      'tasks': tasks?.map((task) => task.toJson()).toList(),
    };
  }
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'position': position,
      'tasks': tasks?.map((task) => task.toMap()).toList(),
    };
  }
  void updateFromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    position = json['position'];
    tasks = (json['tasks'] as List<dynamic>?)
        ?.map((taskJson) => Task.fromJson(taskJson as Map<String, dynamic>))
        .toList();
  }
  void updateFromMap(Map<String, dynamic> map) {
    name = map['name'];
    email = map['email'];
    phone = map['phone'];
    position = map['position'];
    tasks = (map['tasks'] as List<dynamic>?)
        ?.map((taskMap) => Task.fromJson(taskMap as Map<String, dynamic>))
        .toList();
  }
  void updateFromUser(User user) {
    name = user.name;
    email = user.email;
    phone = user.phone;
    position = user.position;
    tasks = user.tasks;
  }
}