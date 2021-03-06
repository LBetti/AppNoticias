import 'package:provider/provider.dart';
import 'package:provider_app/main.dart';
import 'package:flutter/material.dart';
import 'package:provider_app/src/pages/tab1_page.dart';
import 'package:provider_app/src/pages/tab2_page.dart';

 
 
class TabsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_)=> new _NavegacionModel(),
      child: Scaffold(
        body: _Paginas(),
        bottomNavigationBar: _Navegacion(),
      ),
    );
  }
}

class _Navegacion extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final navegacionModel=Provider.of<_NavegacionModel>(context);

    return BottomNavigationBar(
      currentIndex: navegacionModel.paginaActual,
      onTap:  (i)=>navegacionModel.paginaActual = i,
      items: [
        BottomNavigationBarItem(icon:Icon(Icons.person_pin),title: Text('Para Ti') ),
        BottomNavigationBarItem(icon:Icon(Icons.public_sharp),title: Text('Encabezados') ),

      ],
      );
  }
}

class _Paginas extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    final navegacionModel = Provider.of<_NavegacionModel>(context);

    return PageView(
      controller:navegacionModel.pageController ,
      physics: NeverScrollableScrollPhysics(),
      children:<Widget> [
        
        Tab1Page(),

        Tab2Page(),

      ],
    );
  }
}

class _NavegacionModel with ChangeNotifier{

  int _paginaActual=0;
  PageController _pageController= new PageController(initialPage: 1);

  int get paginaActual => this._paginaActual;

  set paginaActual (int valor){
    this._paginaActual = valor;

  _pageController.animateToPage(valor, duration: Duration(milliseconds: 250), curve: Curves.easeInOut);

    notifyListeners();
    
  }

PageController get pageController => this._pageController;


}