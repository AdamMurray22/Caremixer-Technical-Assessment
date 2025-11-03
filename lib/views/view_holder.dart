import 'package:flutter/material.dart';

import '../view_models/view_holder_view_model.dart';

/// Contains the main navigation between the three tasks.
class ViewHolder extends StatefulWidget {
  ViewHolder({super.key});

  final ViewHolderViewModel _viewHolderViewModel = ViewHolderViewModel();

  @override
  State<ViewHolder> createState() => _ViewHolderState();
}

class _ViewHolderState extends State<ViewHolder> {

  late final ViewHolderViewModel _viewHolderViewModel;

  @override
  void initState() {
    _viewHolderViewModel = widget._viewHolderViewModel;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
          index: _viewHolderViewModel.getSelectedIndex(), children: _viewHolderViewModel.getViewsInOrder()),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: _addItemsToBottomNavigationBar(),
        currentIndex: _viewHolderViewModel.getSelectedIndex(),
        selectedItemColor: Colors.amber[800],
        onTap: (index) {
          setState(() {
            _viewHolderViewModel.setSelectedIndex(index);
          });
        },
      ),
    );
  }

  // Returns the navigation bar items in order.
  List<BottomNavigationBarItem> _addItemsToBottomNavigationBar() {
    List<BottomNavigationBarItem> navBarItems = [];
    for (NavigationBarItem item in _viewHolderViewModel.getItemsInOrder()) {
      navBarItems.add(BottomNavigationBarItem(
        icon: item.icon,
        label: item.label,
      ));
    }
    return navBarItems;
  }
}