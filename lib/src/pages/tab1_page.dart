import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_app/src/services/news_service.dart';
import 'package:provider_app/src/services/news_service.dart';
import 'package:provider_app/src/widgets/lista_noticias.dart';

class Tab1Page extends StatefulWidget {
  @override
  _Tab1PageState createState() => _Tab1PageState();
}

class _Tab1PageState extends State<Tab1Page> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {

    final headlines = Provider.of<NewsService>(context).headlines;

    //newsService.headlines;

    return SafeArea(
          child: Scaffold(
        //body: ListNoticias(headlines),
        body: (headlines.length == 0)
        ? Center(
          child:CircularProgressIndicator())
        :ListNoticias(headlines)
        ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}