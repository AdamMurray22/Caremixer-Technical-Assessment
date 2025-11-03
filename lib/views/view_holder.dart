import 'package:flutter/material.dart';

import '../view_models/view_holder_view_model.dart';

/// Contains the main navigation between the three tasks.
class ViewHolder extends StatelessWidget {
  ViewHolder({super.key});

  late final ViewHolderViewModel _viewHolderViewModel = ViewHolderViewModel();

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: _viewHolderViewModel,
      builder: (BuildContext context, Widget? child) {
        return Scaffold(
          body: IndexedStack(
            index: _viewHolderViewModel.currentIndex,
            children: _viewHolderViewModel.getViewsInOrder(),
          ),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            items: _addItemsToBottomNavigationBar(),
            currentIndex: _viewHolderViewModel.currentIndex,
            selectedItemColor: Colors.amber[800],
            onTap: (index) {
              _viewHolderViewModel.currentIndex = index;
            },
          ),
        );
      },
    );
  }

  // Returns the navigation bar items in order.
  List<BottomNavigationBarItem> _addItemsToBottomNavigationBar() {
    List<BottomNavigationBarItem> navBarItems = [];
    for (NavigationBarItem item in _viewHolderViewModel.getItemsInOrder()) {
      navBarItems.add(
        BottomNavigationBarItem(icon: item.icon, label: item.label),
      );
    }
    return navBarItems;
  }
}
