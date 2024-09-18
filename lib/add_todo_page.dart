import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'todo_model.dart';

class AddTodoPage extends StatelessWidget {
  final Function(Todo) onAdd;

  AddTodoPage({super.key, required this.onAdd});

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Todo'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: 'Todo Title',
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.teal, width: 2.0),
                ),
                labelStyle: TextStyle(color: Colors.teal),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (_controller.text.isNotEmpty) {
                  final newTodo = Todo(
                    id: const Uuid().v4(),
                    title: _controller.text,
                  );
                  onAdd(newTodo);
                  Navigator.pop(context);
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                padding: EdgeInsets.symmetric(vertical: 15),
              ),
              child: const Text('Add Todo', style: TextStyle(fontSize: 18)),
            ),
            const SizedBox(height: 20),
            Text(
              'Tambahkan todo baru Anda di sini',
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            Icon(
              Icons.note_add,
              size: 80,
              color: Colors.teal.withOpacity(0.5),
            ),
          ],
        ),
      ),
    );
  }
}
