import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:to_do/data/database.dart';
import 'package:to_do/widgets/dialog_box.dart';
import 'package:to_do/widgets/todo_tile.dart';

class HomePage extends StatefulWidget {
  final VoidCallback toggleTheme;
  final bool isDarkMode;

  const HomePage(
      {super.key, required this.toggleTheme, required this.isDarkMode});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final myBox = Hive.box('tasks');
  ToDoDatabse db = ToDoDatabse();

  @override
  void initState() {
    super.initState();
    if (myBox.get("todolist") == null) {
      db.createInitialData();
    } else {
      db.loadData();
    }
  }

  TextEditingController textController = TextEditingController();

  void tickBoxChange(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updateDataBase();
  }

  void saveTask() {
    setState(() {
      String task = textController.text.trim();
      if (task.isNotEmpty) {
        String formattedTask = task[0].toUpperCase() + task.substring(1);
        db.toDoList.add([formattedTask, false]);
        textController.clear();
      }
    });
    Navigator.of(context).pop();
    db.updateDataBase();
  }

  void createTask() {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return DialogBox(
          isDarkMode: widget.isDarkMode,
          textController: textController,
          onSave: saveTask,
          onCancel: () {
            Navigator.of(context).pop();
            textController.clear();
          },
        );
      },
    );
  }

  void deleteTask(int index) {
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateDataBase();
  }

  void updateTask(int index) {
    setState(() {
      db.toDoList[index][0] = textController.text;
    });
    db.updateDataBase();
  }

  void changeTask(int index) {
    textController.text = db.toDoList[index][0];
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return DialogBox(
          isDarkMode: widget.isDarkMode,
          textController: textController,
          onSave: () {
            updateTask(index);
            Navigator.of(context).pop();
            textController.clear();
          },
          onCancel: () {
            Navigator.of(context).pop();
            textController.clear();
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("T O  D O"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(widget.isDarkMode ? Icons.light_mode : Icons.dark_mode),
            onPressed: widget.toggleTheme,
          )
        ],
      ),
      body: ListView.builder(
        itemCount: db.toDoList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => changeTask(index),
            child: TodoTile(
              taskName: db.toDoList[index][0],
              taskCompleted: db.toDoList[index][1],
              onTap: (value) => tickBoxChange(value, index),
              deleteTask: (context) => deleteTask(index),
              isDarkMode:
                  widget.isDarkMode, // Pass the theme status to the tile
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: SmoothBorderRadius.all(
            SmoothRadius(cornerRadius: 15, cornerSmoothing: 1),
          ),
        ),
        backgroundColor:
            widget.isDarkMode ? Colors.grey[850] : Colors.grey[300],
        onPressed: createTask,
        child: Container(
          height: 50,
          width: 50,
          padding: const EdgeInsets.all(14.0),
          decoration: BoxDecoration(
            color: widget.isDarkMode ? Colors.grey[850] : Colors.grey[300],
            borderRadius: const SmoothBorderRadius.all(
              SmoothRadius(cornerRadius: 15, cornerSmoothing: 1),
            ),
            boxShadow: widget.isDarkMode
                ? [
                    BoxShadow(
                        color: Colors.grey[900]!,
                        offset: const Offset(5.0, 5.0),
                        blurRadius: 5,
                        spreadRadius: 1.0),
                    BoxShadow(
                        color: Colors.grey[800]!,
                        offset: const Offset(-5.0, -5.0),
                        blurRadius: 5.0,
                        spreadRadius: 0.1),
                  ]
                : [
                    BoxShadow(
                        color: Colors.grey[500]!,
                        offset: const Offset(5.0, 5.0),
                        blurRadius: 5.0,
                        spreadRadius: 1.0),
                    BoxShadow(
                        color: Colors.white,
                        offset: const Offset(-5.0, -5.0),
                        blurRadius: 5.0,
                        spreadRadius: 0.1),
                  ],
          ),
          child: Icon(
            Icons.add,
            color: widget.isDarkMode ? Color(0xffE1E8EB) : Colors.black,
            size: 18,
            shadows: [
              Shadow(
                color: widget.isDarkMode ? Color(0xffE1E8EB) : Colors.black,
                offset: Offset(0.2, 0.5),
                blurRadius: 5.0,
              )
            ],
          ),
        ),
      ),
    );
  }
}
