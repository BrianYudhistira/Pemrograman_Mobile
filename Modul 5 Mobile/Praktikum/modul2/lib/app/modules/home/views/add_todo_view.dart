import 'package:flutter/material.dart';
import 'package:modul2/app/data/Database/database_controller.dart';


class AddTodoView extends StatefulWidget {
  const AddTodoView({super.key});

  @override
  State<AddTodoView> createState() => _AddTodoViewState();
}

class _AddTodoViewState extends State<AddTodoView> {
  final _formkey = GlobalKey<FormState>();
  String _title = '';
  String _description = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Add Todo"),
        ),

        body: Form(key: _formkey, child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                hintText: "Title",
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter title";
                }
                return null;
              },
              onSaved: (newValue) => _title = newValue ?? "title",
            ),
            const SizedBox(height: 20,),
            TextFormField(
              decoration: const InputDecoration(
                hintText: "Description",
              ),
              onSaved: (newValue) => _description = newValue ?? "description",
            ),
            const SizedBox(height: 20),
            ElevatedButton(
                onPressed: () async {
                  if (_formkey.currentState!.validate()) {
                    //save the form
                    _formkey.currentState!.save();
                    //navigate to noteview
                    try {
                      bool result = await DatabaseController.instance
                          .CreateTodo(title: _title, description: _description);
                      if (result) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(SnackBar(content: Text(
                            "Added toto successfully")));
                        Navigator.pop(context);
                        }
                        }catch(e){
                            //snackbar
                            ScaffoldMessenger.of(context)
                            .showSnackBar(
                            SnackBar(content: Text(e.toString())));
                      }
                    }
                  },
                child: const Text("Add Todo")
            ),
          ],
        ))
    );
  }
}
