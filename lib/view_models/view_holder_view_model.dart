import 'package:caremixer_technical_assesment/views/chatbot_view.dart';
import 'package:caremixer_technical_assesment/views/pokemon_view.dart';
import 'package:caremixer_technical_assesment/views/timeline_view.dart';
import 'package:flutter/material.dart';
import 'package:tuple/tuple.dart';

class ViewHolderViewModel
{
  // links the nav bar items to the views
  final List<Tuple2<NavigationBarItem, Widget>> _itemsInOrder = [];

  ViewHolderViewModel()
  {
    _itemsInOrder.add(Tuple2(
        NavigationBarItem.timelineView,
        TimelineView()));
    _itemsInOrder.add(Tuple2(
        NavigationBarItem.pokemonView,
        PokemonView()));
    _itemsInOrder.add(Tuple2(
        NavigationBarItem.chatbotView,
        ChatbotView()));
  }

  int _selectedIndexBottomNavBar = 0;

  /// Returns the selected index in the nav bar.
  int getSelectedIndex() {
    return _selectedIndexBottomNavBar;
  }

  /// Sets the selected index in the nav bar.
  void setSelectedIndex(int index) {
    _selectedIndexBottomNavBar = index;
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
  timelineView(0, Icon(Icons.home), "Timeline"),
  pokemonView(1, Icon(Icons.home), "Pokemon"),
  chatbotView(2, Icon(Icons.home), "Chatbot");

  const NavigationBarItem(this.position, this.icon, this.label);

  final int position; // The position in the nav bar, starting from 0.
  final Icon icon;
  final String label;
}