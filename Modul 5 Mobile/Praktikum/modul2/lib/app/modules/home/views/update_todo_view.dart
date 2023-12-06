import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modul2/app/data/provider/TodoProvider.dart';
import 'package:modul2/app/modules/home/Models/Todo_model.dart';
import 'package:modul2/app/modules/home/views/Note_view.dart';

import '../../../data/Database/database_controller.dart';

class UpdateTodo extends StatefulWidget {
  final int index;
  final TodoModel todo;

  const UpdateTodo({Key? key, required this.index, required this.todo})
      : super(key: key);

  @override
  State<UpdateTodo> createState() => _UpdateTodoState();
}

class _UpdateTodoState extends State<UpdateTodo> {
  final _formKey = GlobalKey<FormState>();
  late TodoProvider todoProvider;
  late String _title;
  late String _description;

  @override
  void initState() {
    super.initState();
    todoProvider = TodoProvider();
    _title = widget.todo.title;
    _description = widget.todo.description;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Update Todo"),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                hintText: "Title",
              ),
              initialValue: _title,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter title";
                }
                return null;
              },
              onSaved: (newValue) => _title = newValue ?? "title",
            ),
            const SizedBox(height: 20),
            TextFormField(
              decoration: const InputDecoration(
                hintText: "Description",
              ),
              initialValue: _description,
              onSaved: (newValue) => _description = newValue ?? "description",
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  // Save the form
                  _formKey.currentState!.save();

                  try {
                    widget.todo.title = _title;
                    widget.todo.description = _description;
                    await DatabaseController.instance.updateTodo(widget.todo);

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Todo updated successfully")),
                    );
                    Navigator.pop(context);
                  } catch (e) {
                    // Show snackbar for any errors
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(e.toString())),
                    );
                  }
                }
              },
              child: const Text("Update Todo"),
            ),
          ],
        ),
      ),
    );
  }
}
