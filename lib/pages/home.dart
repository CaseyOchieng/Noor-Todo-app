import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:tasnim/models/todo.dart';
import 'package:tasnim/pages/add.dart';

import '../providers/todo_provider.dart';

class MyHomePage extends ConsumerWidget {
  const MyHomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Add a list of the todo items
    List<Todo> todos = ref.watch(todoProvider);
    // Add a list of the todo items
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
      body: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (BuildContext context, int index) {
          return Slidable(
              startActionPane: ActionPane(
                motion: const ScrollMotion(),
                children: [
                  SlidableAction(
                    onPressed: (context) {
                      ref
                          .read(todoProvider.notifier)
                          .completeTodo(todos[index].todoId);
                    },
                    icon: Icons.check,
                  )
                ],
              ),
              endActionPane: ActionPane(
                motion: const ScrollMotion(),
                children: [
                  SlidableAction(
                    onPressed: (context) {
                      ref
                          .watch(todoProvider.notifier)
                          .deleteTodo(todos[index].todoId);
                    },
                    icon: Icons.check,
                  )
                ],
              ),
              child: Text(todos[index].content));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const AddTodo(),
          ));
          debugPrint('Floating action button pressed');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

// The code starts by creating a new instance of the MyHomePage class. The constructor takes in two parameters: key and super. The first parameter is the key that will be used to identify this widget, which is passed into the constructor from its parent ConsumerWidget. The second parameter is an optional argument that can be used to pass additional information about this widget's appearance or behavior to its parent ConsumerWidget. In this case, we are not passing any arguments so it defaults to null (which means no arguments). Next, we override build() on our subclass of ConsumerWidget and add some code inside of it. We create a list called "todos" with one item in it using watch(). Then we return Scaffold(appBar: AppBar(backgroundColor: Theme.of(context).colorScheme.inversePrimary)). This creates a new Scaffold object with an app bar at the top and adds all of our widgets inside of it as children nodes (the root node has no children nodes).
// The code attempts to create a list of the items that are currently being tracked by the application. // Add a list of the todo items return Scaffold( { appBar: AppBar(backgroundColor: Theme.of(context).colorScheme.inversePrimary), });
// The code starts with a const Text('Noor Todo 💕') declaration. The text is styled using the TextStyle() function and has a fontFamily of 'Poppins', fontSize of 20, and fontWeight of FontWeight.bold. The code then creates an instance of ListView by calling ListView.builder(). This will create an empty list view that can be populated later on in the app's lifecycle through data binding or other means like loading from JSON files or web services. Next, it declares todos as being length 3 (the number is declared inside the parentheses) and assigns itemBuilder to be called for each item in the list view when it's created (in this case, every time there's a new item). In order to make sure that items are always added at index 0, we use Slidable(), which takes two parameters: startActionPane and children. The first parameter starts an action pane at position 0; this will allow us to add more actions later on without having to worry about where they're placed in relation to one another because they'll all start at index 0! The second parameter defines what child elements should go into our list view - here we have just one
// The code shows how to create a list view with an item builder. The item builder takes two parameters, the first is the build context and the second is an index.
// The code starts by declaring a class called SlidableAction. This is the class that will be used to create the sliding action of the app. The code then declares an onPressed function which will be executed when a user presses on one of the icons in this pane. The first line inside of this function creates an instance of TodoProvider, and assigns it to ref. Then, it calls .read(todoProvider) which will cause notifier to call completeTodo with each item in its list (the array). Next, there is another SlidableAction object declared at endActionPane: ActionPane(motion: const ScrollMotion(), children: [SlidableAction()]). This second slider has no actions associated with it; instead, it just serves as decoration for the main pane.
// The code is an example of a sliding action pane.
// The code starts with the following line: .deleteTodo(todos[index].todoId); This is a function that deletes a todo from the list. The index of the todo is passed in as an argument, and it's value is used for deleting it. This code will delete the first todo on the list, which has an ID of 1. Next we have this line: icon: Icons.check, This creates a new variable called icon that stores an instance of Icons class (which contains check). Then we have these lines: ]), child: Text(todos[index].content));
// The code is a snippet of a React Native app. The code displays an icon and text on the screen, when the user presses on the floating action button.