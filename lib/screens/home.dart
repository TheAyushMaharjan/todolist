import 'package:flutter/material.dart';
import 'package:todolist/widgets/todo_item.dart';

import '../constrants/colors.dart';
import '../model/todo.dart';
import '../widgets/searchbox.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

final todosList = ToDo.todolist();

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tdLYellow,
      appBar: _buildAppBar(),
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
            child: Column(
              children: [
                //searchBox
                searchBox(),
                //Listview of ToDolist
                Expanded(
                  child: ListView(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 50, bottom: 20),
                        child: Text(
                          'All ToDo List',
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.w500),
                        ),
                      ),
                      for (ToDo todo in todosList)
                        ToDoItem(
                          todo: todo,
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                Expanded(
                    child: Container(
                  margin: EdgeInsets.only(
                    bottom: 20,
                    right: 20,
                    left: 20,
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                  decoration: BoxDecoration(
                    color: tdLBlue,
                    boxShadow:[ BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0.0, 0.0),
                      blurRadius: 10,
                      spreadRadius: 0.0,
                    ),],
                    borderRadius: BorderRadius.circular(16),

                  ),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Add new ToDo Item',
                          border: InputBorder.none,
                        ),

                      ),
                ),),
              ],
            ),
          ),
        ],
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
