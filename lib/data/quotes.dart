import 'package:tags/Quote.dart';
import 'package:tags/data/category_enum.dart';

class Quotes{
  static final List<Quote>quotes=[
    Quote(quote: 'Quote1', source: 'Source1', category: ['category2']),
    Quote(quote: 'Quote2', source: 'Source2', category: ['category1', 'category2']),
    Quote(quote: 'Quote3', source: 'Source3', category: ['category1',]),
    Quote(quote: 'Quote4', source: 'Source2', category: ['category1', 'category3']),
    Quote(quote: 'Quote5', source: 'Source1', category: ['category3']),
    Quote(quote: 'Quote6',  ),
  ];
}