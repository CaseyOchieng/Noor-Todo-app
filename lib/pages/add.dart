import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tasnim/providers/todo_provider.dart';

class AddTodo extends ConsumerWidget {
  const AddTodo({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    TextEditingController todoController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Noor Todo 💕',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 20,
              fontWeight: FontWeight.bold,
            )),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: todoController,
                decoration: const InputDecoration(border: OutlineInputBorder()),
              ),
            ),
            TextButton(
              onPressed: () {
                ref.read(todoProvider.notifier).addTodo(todoController.text);
                Navigator.pop(context);
              },
              child: const Text("Add Todo"),
            ),
          ],
        ),
      ),
    );
  }
}
