import 'package:flutter/material.dart';

import '../constrants/colors.dart';
import '../model/todo.dart';

class ToDoItem extends StatelessWidget {
  final ToDo todo;

  const ToDoItem({super.key, required this.todo});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 18),
      child: ListTile(
        onTap: () {
          print('hello');
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        tileColor: tdYellow,
        leading: Icon(
          todo.isDone
              ? Icons.check_box_rounded
              : Icons.check_box_outline_blank_rounded,
          color: tdBlack,
        ),
        title: Text(
          todo.todoText!,
          style: TextStyle(
            fontSize: 18,
            color: tdBlack,
            decoration: todo.isDone ? TextDecoration.lineThrough : null,
          ),
        ),
        trailing: Container(
          padding: const EdgeInsets.all(0),
          margin: const EdgeInsets.symmetric(vertical: 12),
          height: 35,
          width: 35,
          decoration: BoxDecoration(
            color: tdRed,
            borderRadius: BorderRadius.circular(6),
          ),
          child: IconButton(
            color: tdLBlue,
            iconSize: 18,
            icon: const Icon(Icons.delete_outline_rounded),
            onPressed: () {
              print('no hello');
            },
          ),
        ),
      ),
    );
  }
}
