import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/feature/authentication/view/pages/signup_page.dart';
import 'package:todo/feature/todo/view/pages/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => TodoProvider())],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: SignupPage());
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';
// import 'package:provider/provider.dart';

// // Provider for managing the task list
// class TaskProvider extends ChangeNotifier {
//   List<Map<String, String>> _tasks = [];

//   List<Map<String, String>> get tasks => _tasks;

//   void addTask(Map<String, String> task) {
//     _tasks.add(task);
//     notifyListeners(); // Notify listeners to rebuild the UI
//   }
// }

// void main() {
//   runApp(
//     ChangeNotifierProvider(
//       create: (_) => TaskProvider(),
//       child: MyApp(),
//     ),
//   );
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: CategoriesPage(),
//     );
//   }
// }

// class CategoriesPage extends HookWidget {
//   @override
//   Widget build(BuildContext context) {
//     // Use context.watch() to listen to changes in the TaskProvider
//     final taskProvider = context.watch<TaskProvider>();

//     // Function to open the "Add Task" dialog
//     void _openAddTaskDialog() {
//       String title = '';
//       String description = '';
//       String date = '';

//       showDialog(
//         context: context,
//         builder: (context) {
//           return AlertDialog(
//             title: Text('Add Task'),
//             content: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 TextField(
//                   decoration: InputDecoration(labelText: 'Title'),
//                   onChanged: (value) => title = value,
//                 ),
//                 TextField(
//                   decoration: InputDecoration(labelText: 'Description'),
//                   onChanged: (value) => description = value,
//                 ),
//                 TextField(
//                   decoration: InputDecoration(labelText: 'Date'),
//                   onChanged: (value) => date = value,
//                 ),
//               ],
//             ),
//             actions: [
//               TextButton(
//                 onPressed: () {
//                   if (title.isNotEmpty && description.isNotEmpty && date.isNotEmpty) {
//                     taskProvider.addTask({
//                       'title': title,
//                       'description': description,
//                       'date': date,
//                     });
//                     Navigator.of(context).pop(); // Close the dialog
//                   }
//                 },
//                 child: Text('Add'),
//               ),
//               TextButton(
//                 onPressed: () {
//                   Navigator.of(context).pop(); // Close the dialog
//                 },
//                 child: Text('Cancel'),
//               ),
//             ],
//           );
//         },
//       );
//     }

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Categories'),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.search),
//             onPressed: () {
//               // Implement search functionality if needed
//             },
//           ),
//         ],
//       ),
//       body: Column(
//         children: [
//           // Row with circle avatars and title
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Row(
//               children: [
//                 CircleAvatar(
//                   radius: 25,
//                   backgroundImage: NetworkImage('https://example.com/avatar.jpg'),
//                 ),
//                 SizedBox(width: 10),
//                 Text('Categories', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
//               ],
//             ),
//           ),
//           // The Card with Add Task button
//           Card(
//             margin: EdgeInsets.all(10),
//             child: ListTile(
//               title: Text('Add Task'),
//               trailing: IconButton(
//                 icon: Icon(Icons.add),
//                 onPressed: _openAddTaskDialog,
//               ),
//             ),
//           ),
//           // Display tasks
//           Expanded(
//             child: ListView.builder(
//               itemCount: taskProvider.tasks.length,
//               itemBuilder: (context, index) {
//                 final task = taskProvider.tasks[index];
//                 return Card(
//                   margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
//                   child: ListTile(
//                     title: Text(task['title'] ?? ''),
//                     subtitle: Text('${task['description'] ?? ''}\n${task['date'] ?? ''}'),
//                     isThreeLine: true,
//                   ),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
