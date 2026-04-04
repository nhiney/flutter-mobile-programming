import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_tuan_6/models/todo_app/todo.dart';
import 'package:flutter_tuan_6/providers/todo_app/todo_provider.dart';

class AddTodoScreen extends StatefulWidget {
  const AddTodoScreen({super.key});

  @override
  State<AddTodoScreen> createState() => _AddTodoScreenState();
}

class _AddTodoScreenState extends State<AddTodoScreen> {
  final titleController = TextEditingController();
  final contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black87),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Add New Todo",
          style: TextStyle(color: Colors.black87, fontWeight: FontWeight.normal, fontSize: 18),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.check, color: Colors.black54, size: 28),
            onPressed: () {
              if (titleController.text.isNotEmpty) {
                final todo = Todo(
                  title: titleController.text,
                  content: contentController.text,
                );
                Provider.of<TodoProvider>(context, listen: false).addTodo(todo);
                Navigator.pop(context);
              }
            },
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                hintText: "Title",
                hintStyle: const TextStyle(color: Colors.black54, fontSize: 14),
                filled: true,
                fillColor: const Color(0xFFF3EDF7).withOpacity(0.5), // Pinkish grey
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 24),
            TextField(
              controller: contentController,
              maxLines: null,
              decoration: InputDecoration(
                hintText: "Content",
                hintStyle: const TextStyle(color: Colors.black54, fontSize: 14),
                filled: true,
                fillColor: const Color(0xFFF3EDF7).withOpacity(0.5), // Pinkish grey
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
