import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:provider/provider.dart';
import 'package:todo/feature/todo/view/pages/provider.dart';
import 'package:todo/feature/todo/view/pages/settings_page.dart';
import 'package:todo/feature/todo/view/widgets/add_item_widget.dart';
import 'package:todo/feature/todo/view/widgets/item_container_widget.dart';

class CategoriesPage extends HookWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final todoProvider = Provider.of<TodoProvider>(context);
    final itemCount = todoProvider.todos.length + 1;

    void openshowDialog() {
      String imogi = '';
      String title = '';
      String task = '';

      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            scrollable: true,
            shape: BeveledRectangleBorder(),
            content: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.black,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(Icons.close_rounded, color: Colors.white),
                      ),
                    ),
                  ],
                ),
                TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: '😍',
                    hintStyle: TextStyle(fontSize: 45),
                  ),
                  onChanged: (value) => imogi = value,
                ),
                TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Title',
                    hintStyle: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onChanged: (value) => title = value,
                ),
                TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'task',
                    hintStyle: TextStyle(fontSize: 20),
                  ),
                  onChanged: (value) => task = value,
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  if (title.isNotEmpty && task.isNotEmpty) {
                    todoProvider.addTodo(imogi, title, task);
                    // taskProvider.addTask({
                    //   'title': title,
                    //   'description': task,
                    //   'date': task,
                    // });
                    Navigator.of(context).pop(); // Close the dialog
                  }
                },
                child: Text('Add'),
              ),
            ],
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return SettingsPage();
                  },
                ),
              );
            },
            child: CircleAvatar(
              backgroundImage: AssetImage("assets/images/boche.webp"),
            ),
          ),
        ),
        title: Center(
          child: Text(
            "Categories",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Icon(Icons.search),
          ),
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Card(
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 10,
                    right: 10,
                    top: 30,
                    bottom: 30,
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundImage: AssetImage(
                          "assets/images/Barghouti.jpg",
                        ),
                      ),
                      SizedBox(width: 15),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("\"The memories is a shield and life helper,\""),
                          Text("Tamin Al-Barghouti"),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                child: Expanded(
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 1,
                    ),
                    itemCount: itemCount,
                    itemBuilder: (context, index) {
                      if (index == 0) {
                        return GestureDetector(
                          onTap: () => openshowDialog(),
                          child: AddItemWidget(),
                        );
                      }

                      final todo = todoProvider.todos[index - 1];
                      return ItemWidget(todo: todo);
                    },
                  ),
                ),
              ),

              // GridView.count(
              //   shrinkWrap: true,
              //   physics: NeverScrollableScrollPhysics(),
              //   mainAxisSpacing: 10,
              //   crossAxisSpacing: 10,
              //   crossAxisCount: 2,
              //   children: [
              //     Card(
              //       child: InkWell(
              //         onTap: () {
              //           openshowDialog();
              //         },
              //         child: Center(
              //           child: Icon(Icons.add, size: 50, color: Colors.grey),
              //         ),
              //       ),
              //     ),
              //     ListView.builder(
              //       itemCount: todoProvider.todos.length,
              //       itemBuilder: (context, index) {
              //         final todo = todoProvider.todos[index];
              //         return Card(
              //           child: Column(
              //             children: [
              //               Text(todo.emoji, style: TextStyle(fontSize: 24)),
              //               Text(
              //                 todo.title,
              //                 style: TextStyle(fontWeight: FontWeight.bold),
              //               ),
              //               Text(todo.task),
              //             ],
              //           ),
              //         );
              //       },
              //     ),
              //   ],
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
