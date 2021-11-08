import 'package:flutter/material.dart';
import 'package:provider_app/src/models/category_model.dart';
import 'package:provider_app/src/models/news_models.dart';
import 'package:http/http.dart' as http;

class NewsService with ChangeNotifier{

  List <Article> headlines =[];

  String _selectedCategory = 'business';

  List <Category> categories = [
    Category(Icons.monetization_on , 'business'),
    Category(Icons.movie , 'entertainment'),
    Category(Icons.sports_motorsports , 'sports'),
    Category(Icons.biotech_rounded  , 'science'),
    Category(Icons.stay_current_portrait_outlined , 'technology'),
    Category(Icons.favorite , 'health'),
    Category(Icons.public_off_outlined , 'general'),
  ];


  Map<String,List<Article>>categoryArticles ={};


  NewsService() {

    this.getTopHeadlines();

    categories.forEach((item) {
      this.categoryArticles[item.name]=new List();
    });

  }

  get selectedCategory  =>this._selectedCategory;
  set selectedCategory(String valor){
    this._selectedCategory=valor;

    this.getArticlesByCategory(valor);

    notifyListeners();
  }

  List <Article>get getArticulosCategoriaSeleccionada => this.categoryArticles[this.selectedCategory];

  getArticlesByCategory(String category)async{

    if(this.categoryArticles[category].length>0){
      return this.categoryArticles[category];
    }

    final url ='https://newsapi.org/v2/top-headlines?country=ar&apiKey=868a2e7252234fb2985dfaa1aad2095e&category=$category';
    final resp = await http.get(url);

    final newsResponse = newsResponseFromJson(resp.body);

    this.categoryArticles[category].addAll(newsResponse.articles);

    notifyListeners();

  }



  getTopHeadlines() async{
    
    final url ='https://newsapi.org/v2/top-headlines?country=ar&apiKey=868a2e7252234fb2985dfaa1aad2095e';

    final resp = await http.get(url);

    final newsResponse = newsResponseFromJson(resp.body);

    this.headlines.addAll(newsResponse.articles);
    notifyListeners();
    
  }

}