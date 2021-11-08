import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_app/src/pages/tabs_page.dart';
import 'package:provider_app/src/services/news_service.dart';
import 'package:provider_app/src/theme/tema.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [

        ChangeNotifierProvider(create:(_)=>new NewsService()),

      ],
      child: MaterialApp(
        title: 'Material App',
        debugShowCheckedModeBanner: false,
        theme: miTema,
        home: TabsPage()
      ),
    );
  }
}