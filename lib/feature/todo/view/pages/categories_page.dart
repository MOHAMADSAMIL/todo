import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo/feature/todo/view/pages/settings_page.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
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
      body: Padding(
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
            GridView.count(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              crossAxisCount: 2,
              children: [
                Card(
                  child: InkWell(
                    onTap: () {
                      showCupertinoDialog(
                        context: context,
                        builder: (context) {
                          return Column(
                            children: [TextField(), TextField(), TextField()],
                          );
                        },
                      );
                    },
                    child: Center(
                      child: Icon(Icons.add, size: 50, color: Colors.grey),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
