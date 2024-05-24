class Task {
  String? id;
  String title;
  String description;
  DateTime deadline;
  int expectedDuration; 
  String userId;

  Task({
    this.id,
    required this.title,
    required this.description,
    required this.deadline,
    required this.expectedDuration,
    required this.userId,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'deadline': deadline.toIso8601String(),
      'expectedDuration': expectedDuration,
      'userId': userId,
    };
  }

  factory Task.fromMap(Map<String, dynamic> map, String id) {
    return Task(
      id: id,
      title: map['title'],
      description: map['description'],
      deadline: DateTime.parse(map['deadline']),
      expectedDuration: map['expectedDuration'],
      userId: map['userId'],
    );
  }
}
