import 'package:flutter/material.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 20,),
          child: CircleAvatar(
            backgroundImage: AssetImage("assets/images/boche.webp"),
          ),
        ),
        title: Center(child: Text("Categories",style: TextStyle(fontWeight: FontWeight.bold),)),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Icon(Icons.search),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20,right: 20),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(color: const Color.fromARGB(66, 158, 158, 158),),
                borderRadius: BorderRadius.circular(3),
                color: Colors.white
                
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 10,right: 10,top: 30,bottom: 30),
                child: Row(
                  
                  children: [
                    CircleAvatar(
                      radius: 30,
                      // backgroundImage: AssetImage("assets/images/Barghouti.jpg"),
                    ),
                    SizedBox(width: 15,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("\"The memories is a shield and life helper,\""),
                        Text("Tamin Al-Barghouti"),
                      ],
                    )
                  ],
                ),
              ),
            ),
        
          ],
        ),
      ),
    );
  }
}