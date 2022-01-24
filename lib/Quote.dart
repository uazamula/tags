import 'package:tags/data/category_enum.dart';

class Quote{
  final String quote;
  final String source;
  // final List<Category> categoryEnum;
  // Quote.withEnum(this.category, { this.quote='default Quote',this.source='default author', this.categoryEnum=const [Category.category1]});
  final List<String> category;
  Quote( {this.quote='default Quote',this.source='default author', this.category=const ['category1']});

}