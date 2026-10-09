import 'package:flutter_application_test/models/User_models.dart';

enum TaskType {
  work,
  Personal,
  Study,
  others,
}
class Task {
  String title;
  String description;
  DateTime startDate;
  DateTime endDate;
  User? assignedUser;
  bool isCompleted;
  TaskType? taskType;
  Task({
    required this.title,
    required this.description,
    required this.startDate,
    required this.endDate,
    this.assignedUser,
    this.isCompleted = false,
    this.taskType,
  });

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      title: json['title'],
      description: json['description'],
      startDate: DateTime.parse(json['startDate']),
      endDate: DateTime.parse(json['endDate']),
      assignedUser: json['assignedUser'] != null ? User.fromJson(json['assignedUser']) : null,
      isCompleted: json['isCompleted'] ?? false,
      taskType: json['taskType'] != null ? TaskType.values.firstWhere((e) => e.toString() == 'TaskType.${json['taskType']}') : null,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'startDate': startDate.toIso8601String(),
      'endDate': endDate.toIso8601String(),
      'assignedUser': assignedUser?.toJson(),
      'isCompleted': isCompleted,
      'taskType': taskType?.toString().split('.').last,
    };
  }
  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'startDate': startDate.toIso8601String(),
      'endDate': endDate.toIso8601String(),
      'assignedUser': assignedUser?.toMap(),
      'isCompleted': isCompleted,
      'taskType': taskType?.toString().split('.').last,
    };
  }
  void updateFromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    startDate = DateTime.parse(json['startDate']);
    endDate = DateTime.parse(json['endDate']);
    assignedUser = json['assignedUser'] != null ? User.fromJson(json['assignedUser']) : null;
    isCompleted = json['isCompleted'] ?? false;
    taskType = json['taskType'] != null ? TaskType.values.firstWhere((e) => e.toString() == 'TaskType.${json['taskType']}') : null;
  }
}