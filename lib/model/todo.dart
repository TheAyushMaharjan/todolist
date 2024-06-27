// class ToDo{
//   String? id;
//   String? todoText;
//   bool isDone;
//
//   ToDo({
//     required this.id,
//     required this.todoText,
//     this.isDone = false,
// });
//   static List<ToDo> todolist(){
//     return[
//     ToDo(id: '01', todoText: 'Morning', isDone: true),
//     ToDo(id: '02', todoText: 'night', isDone: true),
//     ToDo(id: '03', todoText: 'day',),
//     ];
//
//   }
//
// }

import 'dart:convert';

class ToDo {
  String id;
  String? todoText;
  bool isDone;

  ToDo({
    required this.id,
    this.todoText,
    this.isDone = false,
  });

  // Convert a ToDo object into a Map object
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'todoText': todoText,
      'isDone': isDone,
    };
  }

  // Convert a Map object into a ToDo object
  factory ToDo.fromMap(Map<String, dynamic> map) {
    return ToDo(
      id: map['id'],
      todoText: map['todoText'],
      isDone: map['isDone'],
    );
  }

  // Encode ToDo to JSON
  String toJson() => json.encode(toMap());

  // Decode ToDo from JSON
  factory ToDo.fromJson(String source) => ToDo.fromMap(json.decode(source));

  static List<ToDo> todolist() {
    return [
      ToDo(
        id: '1',
        todoText: 'Sample Task 1',
        isDone: true,
      ),
      ToDo(
        id: '2',
        todoText: 'Sample Task 2',
        isDone: false,
      ),
    ];
  }
}
