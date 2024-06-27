import 'package:flutter/material.dart';
import '../constrants/colors.dart';

class AddToDoBar extends StatelessWidget {
  final TextEditingController todoController;
  final Function(String) onAddToDo;

  const AddToDoBar({
    super.key,
    required this.todoController,
    required this.onAddToDo,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      color: Colors.transparent, // Set the background color to transparent
      child: Row(
        children: [
          // Text box
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              decoration: BoxDecoration(
                color: tdLBlue,
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(0.0, 0.0),
                    blurRadius: 10,
                    spreadRadius: 0.0,
                  ),
                ],
                borderRadius: BorderRadius.circular(16),
              ),
              child: TextField(
                controller: todoController,
                decoration: const InputDecoration(
                  hintText: 'Add new ToDo Item',
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          // + button
          const SizedBox(width: 10),
          ElevatedButton(
            onPressed: () {
              onAddToDo(todoController.text);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: tdOrange,
              minimumSize: const Size(50, 50),
              elevation: 10,
            ),
            child: const Text(
              '+',
              style: TextStyle(fontSize: 24, color: tdBlack),
            ),
          ),
        ],
      ),
    );
  }
}
