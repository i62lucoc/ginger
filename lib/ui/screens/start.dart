import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import '../../models/cocktail.dart';
import '../../models/home.dart';
import '../../models/intelligent.dart';
import '../../models/profile.dart';
import '../../models/query.dart';
import '../../models/search.dart';
import '../tabs/cocktail.dart';
import '../tabs/home.dart';
import '../tabs/intelligent.dart';
import '../tabs/profile.dart';
import '../tabs/search.dart';

class StartScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  int _currentIndex = 0;

  static final List<QueryModel> _modelTab = [
    HomeModel(),
    CocktailModel(),
    SearchModel(),
    IntelligentModel(),
    ProfileModel(),
  ];

  static final List<ScopedModel> _tabs = [
    ScopedModel<HomeModel>(
      model: _modelTab[0],
      child: HomeTab(),
    ),
    ScopedModel<CocktailModel>(
      model: _modelTab[1],
      child: CocktailTab(),
    ),
    ScopedModel<SearchModel>(
      model: _modelTab[2],
      child: SearchTab(),
    ),
    ScopedModel<IntelligentModel>(
      model: _modelTab[3],
      child: IntelligentTab(),
    ),
    ScopedModel<ProfileModel>(
      model: _modelTab[4],
      child: ProfileTab(),
    ),
  ];

  @override
  initState() {
    super.initState();
    _modelTab.forEach((model) => model.loadData());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: (index) => setState(() => _currentIndex = index),
        currentIndex: _currentIndex,
        fixedColor: Theme.of(context).accentColor,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            title: const Text('Home'),
            icon: const Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            title: const Text('Cocktails'),
            icon: const Icon(Icons.local_bar),
          ),
          BottomNavigationBarItem(
            title: const Text('Search'),
            icon: const Icon(Icons.search),
          ),
          BottomNavigationBarItem(
            title: const Text('Stats'),
            icon: const Icon(Icons.star),
          ),
          BottomNavigationBarItem(
            title: const Text('Profile'),
            icon: const Icon(Icons.person),
          ),
        ],
      ),
    );
  }
}
