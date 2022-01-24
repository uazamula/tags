import "package:flutter/material.dart";
import 'package:tags/Quote.dart';
import 'package:tags/category_pressed.dart';
import 'package:tags/data/categories.dart';
import 'package:tags/data/quotes.dart';
import 'package:tags/item_button.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  // int width =  TextButton(onPressed: (){}, child: Text('${Categories.categories[0]}',style: TextStyle(fontSize: 32),));
  List<CategoryPressed> categoriesPressed = [];
  String selectedCategory = '';
  List<String> selectedQuotas=[];

  void _showQuotes(CategoryPressed categoryPressed) {
    selectedQuotas=[];
    setState(() {
      for (var e in categoriesPressed) {
        if (e.category != categoryPressed.category) {
          e.pressed = false;
        }
      }
      categoryPressed.pressed = !categoryPressed.pressed;
      selectedCategory =
          categoryPressed.pressed ? categoryPressed.category : '';

      for(var quoteObject in Quotes.quotes) {
        for(var category in quoteObject.category){
          if(categoryPressed.category==category)
            selectedQuotas.add(quoteObject.quote);
        }
      }
      print('in setstate ${categoryPressed.pressed}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: categoriesPressed
                    .where((e) =>
                        categoriesPressed.indexOf(e) <
                        categoriesPressed.length / 2)
                    .map((e) => ItemButton(
                          categoryPressed: e,
                          itemHandler: () {
                            _showQuotes(e);
                          },
                        ))
                    .toList(),
              ),
              Column(
                children: categoriesPressed
                    .where((e) =>
                        categoriesPressed.indexOf(e) >=
                        categoriesPressed.length / 2)
                    .map((e) => ItemButton(
                          categoryPressed: e,
                          itemHandler: () {
                            _showQuotes(e);
                          },
                        ))
                    .toList(),
              ),
            ],
          ),
          selectedCategory.length > 0 ? Container(child: Column(
            children: selectedQuotas.map((e) => Text(e)).toList(),
          ),) : Text('select a category'),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    Categories.categories
        .sort((a, b) => a.toLowerCase().compareTo(b.toLowerCase()));

    categoriesPressed.clear();
    for (int i = 0; i < Categories.categories.length; i++) {
      categoriesPressed.add(CategoryPressed(Categories.categories[i], false));
      print(categoriesPressed[i].pressed);
    }
  }
}
