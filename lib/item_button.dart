import 'package:flutter/material.dart';
import 'package:tags/category_pressed.dart';

class ItemButton extends StatelessWidget {
  final CategoryPressed categoryPressed;
  final Function() itemHandler;

  ItemButton({required this.categoryPressed, required this.itemHandler});

  @override
  Widget build(BuildContext context) {
    // print(categoryPressed.pressed);

    return TextButton(
        onPressed:
          categoryPressed.pressed? itemHandler: itemHandler,
        child: Text(
          categoryPressed.category,
          style: TextStyle(
              fontSize: 32, color: categoryPressed.pressed ? Colors.black : Colors.blue),
        ));
  }
}