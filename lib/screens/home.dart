import 'package:flutter/material.dart';
import 'package:todolist/widgets/todo_item.dart';

import '../constrants/colors.dart';
import '../widgets/searchbox.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tdLYellow,
      appBar: _buildAppBar(),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 24,vertical: 24),
        child: Column(
          children: [
            //searchBox
            searchBox(),
            //Listview of ToDolist
            Expanded(
              child: ListView(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 50,bottom: 20),
                    child:Text(
                        'All ToDo List',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w500
                        ),
                    ),
                  ),
                    ToDoItem(),
                  ToDoItem(),

                  ToDoItem(),

                  ToDoItem(),


                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: tdYellow,
      elevation: 0,
      title: Row(
        children: [
          Icon(
            Icons.menu,
            color: tdBlack,
          ),
        ],
      ),
    );
  }
}

