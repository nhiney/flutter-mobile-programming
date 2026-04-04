class Todo {
  final int? id;
  final String title;
  final String content;
  final bool isCompleted;

  Todo({
    this.id,
    required this.title,
    required this.content,
    this.isCompleted = false,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'isCompleted': isCompleted ? 1 : 0,
    };
  }

  factory Todo.fromMap(Map<String, dynamic> map) {
    return Todo(
      id: map['id'],
      title: map['title'],
      content: map['content'],
      isCompleted: map['isCompleted'] == 1,
    );
  }

  Todo copyWith({
    int? id,
    String? title,
    String? content,
    bool? isCompleted,
  }) {
    return Todo(
      id: id ?? this.id,
      title: title ?? this.title,
      content: content ?? this.content,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}
