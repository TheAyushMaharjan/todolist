import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constrants/colors.dart';

class ToDoItem extends StatelessWidget {
  const ToDoItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 18),
      child: ListTile(
        onTap: () {
          print('hello');
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
        tileColor: tdYellow,
        leading: Icon(
          Icons.check_box_rounded,
          color: tdBlack,
        ),
        title: Text(
          'hello',
          style: TextStyle(fontSize: 18,
          color: tdBlack,
          decoration: TextDecoration.lineThrough
          ),
        ),
        trailing: Container(
          padding: EdgeInsets.all(0),
          margin: EdgeInsets.symmetric(vertical: 12),
          height: 35 ,
          width: 35,
          decoration: BoxDecoration(
            color:tdRed,
            borderRadius: BorderRadius.circular(6),
          ),
          child: IconButton(
            color: tdLBlue,
            iconSize: 18,
            icon: Icon(Icons.delete_outline_rounded),
            onPressed: () {
              print('no hello');
            },
          ),
        ),
      ),

    );
  }
}
