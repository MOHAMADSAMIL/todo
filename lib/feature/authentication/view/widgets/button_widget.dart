import 'package:flutter/material.dart';
import 'package:todo/feature/todo/view/pages/categories_page.dart';

class CommonButtonWidget extends StatelessWidget {
  const CommonButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CategoriesPage()),
        );
      },
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(color: Colors.indigo),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 18, bottom: 18),
            child: Text("CONTINUE", style: TextStyle(color: Colors.white)),
          ),
        ),
      ),
    );
  }
}
