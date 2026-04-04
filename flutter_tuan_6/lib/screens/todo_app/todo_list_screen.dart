import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_tuan_6/providers/todo_app/todo_provider.dart';
import 'package:flutter_tuan_6/screens/todo_app/add_todo_screen.dart';
import 'package:flutter_tuan_6/models/todo_app/todo.dart';

class TodoListScreen extends StatelessWidget {
  const TodoListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10.0, top: 10.0, bottom: 10.0),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.black, size: 24),
                    onPressed: () => Navigator.pop(context),
                  ),
                  const Text(
                    "Todo",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Consumer<TodoProvider>(
                builder: (context, provider, child) {
                  if (provider.isLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (provider.todos.isEmpty) {
                    return const Center(child: Text("No tasks found."));
                  }
                  return ListView.builder(
                    itemCount: provider.todos.length,
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    itemBuilder: (context, index) {
                      final todo = provider.todos[index];
                      return Container(
                        margin: const EdgeInsets.only(bottom: 12),
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF3E9F9).withOpacity(0.95), // Correct lavender
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: const Color(0xFF64B5F6), width: 1.2), // Darker blue border
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  todo.title,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFF4A60E2),
                                  ),
                                ),
                                IconButton(
                                  icon: const Icon(Icons.delete, color: Color(0xFFF44336), size: 24),
                                  onPressed: () => provider.deleteTodo(todo.id!),
                                  padding: EdgeInsets.zero,
                                  constraints: const BoxConstraints(),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                SizedBox(
                                  width: 22,
                                  height: 22,
                                  child: Checkbox(
                                    value: todo.isCompleted,
                                    onChanged: (val) => provider.toggleTodoStatus(todo),
                                    activeColor: const Color(0xFF6750A4),
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
                                    side: const BorderSide(color: Colors.black45, width: 1.5),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  todo.isCompleted ? "Hoàn thành" : "Chưa hoàn thành",
                                  style: const TextStyle(
                                    fontSize: 15,
                                    color: Colors.black87,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: 60,
          height: 60,
          child: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AddTodoScreen()),
              );
            },
            backgroundColor: const Color(0xFFEADDFF),
            elevation: 2,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: const Icon(Icons.add, color: Colors.black, size: 30),
          ),
        ),
      ),
    );
  }
}
