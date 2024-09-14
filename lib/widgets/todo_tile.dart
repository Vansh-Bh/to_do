import 'package:figma_squircle/figma_squircle.dart';

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoTile extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  final Function(bool?)? onTap;
  final Function(BuildContext)? deleteTask;
  final bool isDarkMode;

  TodoTile(
      {super.key,
      required this.taskName,
      required this.taskCompleted,
      required this.onTap,
      required this.deleteTask,
      required this.isDarkMode});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 18, 16, 0),
      child: Slidable(
        endActionPane: ActionPane(
          extentRatio: 0.25,
          motion: const BehindMotion(),
          children: [
            SlidableAction(
              onPressed: deleteTask,
              icon: Icons.delete_outline,
              backgroundColor: Colors.red[400]!,
              borderRadius: const SmoothBorderRadius.all(
                SmoothRadius(cornerRadius: 15, cornerSmoothing: 1),
              ),
            ),
          ],
        ),
        child: Container(
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: isDarkMode ? Colors.grey[850] : Colors.grey[300],
            borderRadius: const SmoothBorderRadius.all(
              SmoothRadius(cornerRadius: 15, cornerSmoothing: 1),
            ),
            boxShadow: isDarkMode
                ? [
                    BoxShadow(
                        color: Colors.grey[900]!,
                        offset: const Offset(5.0, 5.0),
                        blurRadius: 15.0,
                        spreadRadius: 1.0),
                    BoxShadow(
                        color: Colors.grey[800]!,
                        offset: const Offset(-5.0, -5.0),
                        blurRadius: 10.0,
                        spreadRadius: 1.0),
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
          child: Row(
            children: [
              Checkbox(
                value: taskCompleted,
                onChanged: onTap,
                checkColor: isDarkMode ? Colors.white : Colors.black,
                fillColor: WidgetStatePropertyAll(
                    isDarkMode ? Colors.grey[600] : Colors.grey[500]),
                shape: const RoundedRectangleBorder(
                  borderRadius: SmoothBorderRadius.all(
                    SmoothRadius(cornerRadius: 6, cornerSmoothing: 1),
                  ),
                ),
                side: BorderSide(
                    color: isDarkMode ? Colors.grey[600]! : Colors.grey[500]!),
              ),
              Text(
                taskName,
                style: TextStyle(
                    // color: taskCompleted ? Colors.grey[350] : Colors.black,
                    fontSize: 16,
                    fontFamily: 'Nunito',
                    fontWeight: FontWeight.w500,
                    decoration: taskCompleted
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                    decorationThickness: 3),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
