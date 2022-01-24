import 'dart:math';
import 'package:flutter/material.dart';
import 'package:tags/data/quotes.dart';

class PhraseScreen extends StatefulWidget {
  final String value;

  PhraseScreen({this.value = 'default phrase'});

  @override
  _PhraseScreenState createState() => _PhraseScreenState();
}

class _PhraseScreenState extends State<PhraseScreen> {
  List<String> selectedQuotas = [];
  String randomPhrase = 'default value';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Text(randomPhrase)),
    );
  }

  @override
  void initState() {
    super.initState();

    for (var quoteObject in Quotes.quotes) {
      for (var category in quoteObject.category) {
        if (widget.value == category) {
          selectedQuotas.add(quoteObject.quote);
        }
      }
    }
    randomPhrase = getRandomPhrase();

  }

  String getRandomPhrase() {
    int randomIndex =  Random().nextInt(selectedQuotas.length);
    return selectedQuotas[randomIndex];
  }
}
