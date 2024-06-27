import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todolist/widgets/todo_item.dart';

import '../constrants/colors.dart';
import '../model/todo.dart';
import '../widgets/addtoappbar.dart';
import '../widgets/searchbox.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<ToDo> todosList = [];
  final TextEditingController _todoController = TextEditingController();
  List<ToDo> _foundToDo = [];

  @override
  void initState() {
    super.initState();
    _loadToDos();
  }

  Future<void> _loadToDos() async {
    final prefs = await SharedPreferences.getInstance();
    final String? todosString = prefs.getString('todos');
    if (todosString != null) {
      final List<dynamic> todosJson = json.decode(todosString);
      todosList.addAll(todosJson.map((json) => ToDo.fromMap(json)).toList());
      setState(() {
        _foundToDo = todosList;
      });
    } else {
      setState(() {
        _foundToDo = todosList;
      });
    }
  }

  Future<void> _saveToDos() async {
    final prefs = await SharedPreferences.getInstance();
    final String todosString = json.encode(todosList.map((todo) => todo.toMap()).toList());
    await prefs.setString('todos', todosString);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tdLYellow,
      appBar: _buildAppBar(),
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
            child: Column(
              children: [
                // SearchBox
                SearchBox(onSearch: _runFilter),
                // ListView of ToDo List
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.only(bottom: 60),
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 36, bottom: 20),
                        child: const Text(
                          'All ToDo List',
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.w500),
                        ),
                      ),
                      for (ToDo todo in _foundToDo)
                        ToDoItem(
                          todo: todo,
                          onToDoChanged: _handleToDoChange,
                          onDeleteItem: _deleteToDoItem,
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: AddToDoBar(
              todoController: _todoController,
              onAddToDo: _addToDoItem,
            ),
          ),
        ],
      ),
    );
  }

  // List check and uncheck
  void _handleToDoChange(ToDo todo) {
    setState(() {
      todo.isDone = !todo.isDone;
      _saveToDos();
    });
  }

  // Delete function
  void _deleteToDoItem(String id) {
    setState(() {
      todosList.removeWhere((item) => item.id == id);
      _foundToDo = todosList;
      _saveToDos();
    });
  }

  void _addToDoItem(String todo) {
    setState(() {
      todosList.add(ToDo(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        todoText: todo,
      ));
      _foundToDo = todosList;
      _saveToDos();
    });
    _todoController.clear();
  }

  void _runFilter(String enteredKeyword) {
    List<ToDo> results = [];
    if (enteredKeyword.isEmpty) {
      results = todosList;
    } else {
      results = todosList
          .where((item) => item.todoText!
          .toLowerCase()
          .contains(enteredKeyword.toLowerCase()))
          .toList();
    }

    setState(() {
      _foundToDo = results;
    });
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: tdYellow,
      elevation: 0,
      title: const Row(
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
