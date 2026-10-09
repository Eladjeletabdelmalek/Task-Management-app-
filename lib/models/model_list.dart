import 'package:flutter_application_test/models/Task_models.dart';
import 'package:flutter_application_test/models/User_models.dart';

List<User>? Users=[
  User(
    id: '1',
    name: 'John Doe',
    email: 'john.doe@example.com',
    phone: '123-456-7890',
    position: 'Manager',
    tasks: [
      Task(
        title: 'Signing contracts',
        description: 'Preparing and signing contracts with clients and partners.',
        startDate: DateTime(2026,10,6,9,30),
        endDate: DateTime(2026,10,6,10,30),
        isCompleted: false,
        taskType: TaskType.work,
      ),
      Task(
        title: 'Reviewing reports',
        description: 'Reviewing and analyzing sales reports.',
        startDate: DateTime(2026,10,6,10,30),
        endDate: DateTime(2026,10,6,11,30),
        isCompleted: true,
        taskType: TaskType.work,
      ),
      Task(
        title: 'Preparing presentations',
        description: 'Preparing presentations for stakeholders.',
        startDate: DateTime(2026,10,6,11,30),
        endDate: DateTime(2026,10,6,12,30),
        isCompleted: true,
        taskType: TaskType.work,
      ),
      Task(
        title: 'Conducting meetings',
        description: 'Conducting meetings with team members and stakeholders.',
        startDate: DateTime(2026,10,7,12,30),
        endDate: DateTime(2026,10,7,13,30),
        isCompleted: true,
        taskType: TaskType.work,
      ),
    ],
  ),
  User(
    id: '2',
    name: 'John Doe',
    email: 'john.doe@example.com',
    phone: '123-456-7890',
    position: 'Manager',
    tasks: [
      Task(
        title: 'Task 1',
        description: 'Description for Task 1',
        startDate: DateTime.now(),
        endDate: DateTime.now().add(Duration(days: 7)),
        isCompleted: false,
        taskType: TaskType.work,
      ),
      Task(
        title: 'Task 2',
        description: 'Description for Task 2',
        startDate: DateTime.now(),
        endDate: DateTime.now().add(Duration(days: 14)),
        isCompleted: true,
        taskType: TaskType.work,
      ),
    ],
  ),
  
  User(
    id: '3',
    name: 'John Doe',
    email: 'john.doe@example.com',
    phone: '123-456-7890',
    position: 'Manager',
    tasks: [
      Task(
        title: 'Task 1',
        description: 'Description for Task 1',
        startDate: DateTime.now(),
        endDate: DateTime.now().add(Duration(days: 7)),
        isCompleted: false,
        taskType: TaskType.work,
      ),
      Task(
        title: 'Task 2',
        description: 'Description for Task 2',
        startDate: DateTime.now(),
        endDate: DateTime.now().add(Duration(days: 14)),
        isCompleted: true,
        taskType: TaskType.work,
      ),
    ],
  ),

  User(
    id: '4',
    name: 'John Doe',
    email: 'john.doe@example.com',
    phone: '123-456-7890',
    position: 'Manager',
    tasks: [
      Task(
        title: 'Task 1',
        description: 'Description for Task 1',
        startDate: DateTime.now(),
        endDate: DateTime.now().add(Duration(days: 7)),
        isCompleted: false,
        taskType: TaskType.Personal,
      ),
      Task(
        title: 'Task 2',
        description: 'Description for Task 2',
        startDate: DateTime.now(),
        endDate: DateTime.now().add(Duration(days: 14)),
        isCompleted: true,
        taskType: TaskType.Personal,
      ),
    ],
  ),

  User(
    id: '5',
    name: 'John Doe',
    email: 'john.doe@example.com',
    phone: '123-456-7890',
    position: 'Manager',
    tasks: [
      Task(
        title: 'Task 1',
        description: 'Description for Task 1',
        startDate: DateTime.now(),
        endDate: DateTime.now().add(Duration(days: 7)),
        isCompleted: false,
        taskType: TaskType.work,
      ),
      Task(
        title: 'Task 2',
        description: 'Description for Task 2',
        startDate: DateTime.now(),
        endDate: DateTime.now().add(Duration(days: 14)),
        isCompleted: true,
        taskType: TaskType.work,
      ),
    ],
  ),

];