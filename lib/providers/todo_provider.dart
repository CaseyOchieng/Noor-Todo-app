import 'package:tasnim/models/todo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final todoProvider = StateNotifierProvider<TodoListNotifier, List<Todo>>((ref) {
  return TodoListNotifier();
});

class TodoListNotifier extends StateNotifier<List<Todo>> {
  TodoListNotifier() : super([]);

  void addTodo(
    String content,
  ) {
    state = [
      ...state,
      Todo(
          todoId: state.isEmpty ? 0 : state[state.length - 1].todoId + 1,
          content: content,
          completed: false)
    ];
  }

  void completeTodo(int todoId) {
    state = [
      for (final todo in state)
        if (todo.todoId == todoId)
          Todo(todoId: todo.todoId, content: todo.content, completed: true)
        else
          todo
    ];
  }

  void deleteTodo(int id) {
    state = state.where((todo) => false).toList();
  }
}

// The code above creates a StateNotifierProvider that returns an instance of the TodoListNotifier class.
// The constructor for this class takes in no parameters and simply calls super to call the parent constructor.
// The code creates a new instance of the TodoListNotifier class, which is then passed into the constructor of the StateNotifierProvider<TodoListNotifier, List<Todo>>.