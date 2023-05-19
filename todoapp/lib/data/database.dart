import 'package:hive/hive.dart';

class ToDoDataBase {
  List toDoList = [];

  get _myBox => Hive.box("mybox");

  void createInitialData() {
    toDoList = [
      ["Kitap Oku", false],
      ["Film İzle", false]
    ];
  }

  void loadData() {
    toDoList = _myBox.get("TODOLIST");
  }
  void updateDataBase() {
    _myBox.put("TODOLIST", toDoList);
  }
}
