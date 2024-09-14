import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:to_do/widgets/button.dart';

class DialogBox extends StatelessWidget {
  TextEditingController textController = TextEditingController();
  VoidCallback onSave;
  VoidCallback onCancel;
  final bool isDarkMode;

  DialogBox(
      {super.key,
      required this.textController,
      required this.onCancel,
      required this.onSave,
      required this.isDarkMode});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: const RoundedRectangleBorder(
        borderRadius: SmoothBorderRadius.all(
          SmoothRadius(cornerRadius: 20, cornerSmoothing: 0.5),
        ),
      ),
      backgroundColor: Colors
          .transparent, // Make dialog background transparent for shadow effect
      child: Container(
        decoration: BoxDecoration(
          color: isDarkMode ? Colors.grey[850] : Colors.grey[350],
          borderRadius: const SmoothBorderRadius.all(
            SmoothRadius(cornerRadius: 20, cornerSmoothing: 0.5),
          ),
          boxShadow: isDarkMode
              ? [
                  BoxShadow(
                    color: Colors.grey[900]!,
                    offset: const Offset(5, 5),
                    blurRadius: 7.5,
                    spreadRadius: 0.5,
                  ),
                  BoxShadow(
                    color: Colors.grey[800]!,
                    offset: const Offset(-5, -5),
                    blurRadius: 7.5,
                    spreadRadius: 0.5,
                  ),
                ]
              : [
                  BoxShadow(
                    color: Colors.grey[500]!,
                    offset: const Offset(5, 5),
                    blurRadius: 7.5,
                    spreadRadius: 0.5,
                  ),
                  BoxShadow(
                    color: Colors.white,
                    offset: const Offset(-5, -5),
                    blurRadius: 7.5,
                    spreadRadius: 0.5,
                  ),
                ],
        ),
        padding: const EdgeInsets.all(16.0), // Padding inside the dialog
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: TextField(
                cursorColor: const Color(0xff1A1A1A),
                controller: textController,
                decoration: InputDecoration(
                  hintText: "Add a new task..",
                  hintStyle: TextStyle(color: Colors.grey[500]),
                  focusedBorder: const OutlineInputBorder(
                    borderRadius: SmoothBorderRadius.all(
                      SmoothRadius(cornerRadius: 20, cornerSmoothing: 0.5),
                    ),
                  ),
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: SmoothBorderRadius.all(
                      SmoothRadius(cornerRadius: 20, cornerSmoothing: 0.5),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
                height:
                    20), // Add some spacing between the text field and buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: MyButton(
                    text: 'Save',
                    onPressed: onSave,
                    color: Colors.black,
                    textColor: Colors.white,
                    width: 150,
                  ),
                ),
                MyButton(
                  textColor: Colors.black,
                  text: 'Cancel',
                  onPressed: onCancel,
                  color: Colors.white,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
