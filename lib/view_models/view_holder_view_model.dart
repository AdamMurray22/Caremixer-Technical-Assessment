import 'package:caremixer_technical_assesment/views/chatbot/chatbot_view.dart';
import 'package:caremixer_technical_assesment/views/pokedex/pokedex_view.dart';
import 'package:caremixer_technical_assesment/views/timeline/timeline_view.dart';
import 'package:flutter/material.dart';
import 'package:tuple/tuple.dart';

class ViewHolderViewModel with ChangeNotifier
{
  // links the nav bar items to the views
  final List<Tuple2<NavigationBarItem, Widget>> _itemsInOrder = [];
  int _currentIndex = 0;

  ViewHolderViewModel()
  {
    _itemsInOrder.add(Tuple2(
        NavigationBarItem.timelineView,
        TimelineView()));
    _itemsInOrder.add(Tuple2(
        NavigationBarItem.pokemonView,
        PokedexView()));
    _itemsInOrder.add(Tuple2(
        NavigationBarItem.chatbotView,
        ChatbotView()));
  }

  int get currentIndex => _currentIndex;
  set currentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  /// Returns the enums in the order of the navigation bar.
  List<NavigationBarItem> getItemsInOrder() {
    return _itemsInOrder.map((e) => e.item1).toList();
  }

  /// Returns the views in order.
  List<Widget> getViewsInOrder() {
    return _itemsInOrder.map((e) => e.item2).toList();
  }
}

/// Contains all the information for the nav bar items, except the view/viewmodel
enum NavigationBarItem {
  timelineView(0, Icon(Icons.timeline), "Timeline"),
  pokemonView(1, Icon(Icons.catching_pokemon_sharp), "Pokemon"),
  chatbotView(2, Icon(Icons.chat), "Chatbot");

  const NavigationBarItem(this.position, this.icon, this.label);

  final int position; // The position in the nav bar, starting from 0.
  final Icon icon;
  final String label;
}