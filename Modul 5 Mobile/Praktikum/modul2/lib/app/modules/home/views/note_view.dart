import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modul2/app/data/provider/TodoProvider.dart';
import 'package:modul2/app/modules/home/Models/Todo_model.dart';
import 'package:modul2/app/modules/home/views/add_todo_view.dart';
import 'package:modul2/app/modules/home/views/profile_view.dart';
import 'package:modul2/app/modules/home/views/update_todo_view.dart';
import 'package:provider/provider.dart';

class NoteView extends StatefulWidget {
  const NoteView({super.key});

  @override
  State<NoteView> createState() => _NoteViewState();
}

class _NoteViewState extends State<NoteView> {
  late TodoProvider todoProvider;

  @override
  void initState() {
    todoProvider = Provider.of<TodoProvider>(context, listen: false);
    super.initState();
    getData();
  }

  List<TodoModel> data = [
    TodoModel(
        title: "title",
        description: "description",
        isDone: true,
        createAT: DateTime.now(),
        id: "1")
  ];

  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Icon(
            Icons.menu,
            color: Colors.grey[900],
          ),
          title: Text('NoteKeep', style: TextStyle(color: Colors.grey[900])),
          centerTitle: true,
          actions: [
            IconButton(
              icon: const Icon(
                Icons.account_circle,
                color: Colors.black,
              ),
              iconSize: 30,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ProfileView();
                }));
              },
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.to(() => const AddTodoView());
          },
          child: const Icon(Icons.add),
        ),
        body: Consumer<TodoProvider>(
          builder: (context, todoProvider, child) {
            getData();
            return todoProvider.todos.isEmpty
                ? const Center(
                    child: Text("No todo added"),
                  )
                : ListView.builder(
                    itemCount: todoProvider.todos.length,
                    itemBuilder: (context, index) => GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => UpdateTodo(
                                index: index, todo: todoProvider.todos[index]),
                          ),
                        );
                      },
                      child: ListTile(
                        title: Text(todoProvider.todos[index].title),
                        subtitle: Text(todoProvider.todos[index].description),
                        leading: Checkbox(
                          value: todoProvider.todos[index].isDone,
                          onChanged: (value) {
                            setState(() {
                              todoProvider.todos[index].isDone = value!;
                              todoProvider.updateTodo(
                                  index, todoProvider.todos[index]);
                            });
                          },
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "${todoProvider.todos[index].createAT.day}-${todoProvider.todos[index].createAT.month}-${todoProvider.todos[index].createAT.year}",
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete, color: Colors.red),
                              onPressed: () {
                                setState(() {
                                  print(index);
                                  todoProvider.removeTodo(index);
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
          },
        ));
  }

  void getData() async {
    await todoProvider.getTodo();
  }
}
