import 'package:caremixer_technical_assesment/view_models/view_holder_view_model.dart';
import 'package:caremixer_technical_assesment/views/chatbot_view.dart';
import 'package:caremixer_technical_assesment/views/pokemon_view.dart';
import 'package:caremixer_technical_assesment/views/timeline_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:test/test.dart';


void main() {
  test('ViewHolderViewModel index should be initialised to 0', () {
    final viewHolderViewModel = ViewHolderViewModel();

    expect(viewHolderViewModel.getSelectedIndex(), 0);
  });

  test('ViewHolderViewModel index should be updated', () {
    final viewHolderViewModel = ViewHolderViewModel();

    expect(viewHolderViewModel.getSelectedIndex(), 0);
    viewHolderViewModel.setSelectedIndex(2);
    expect(viewHolderViewModel.getSelectedIndex(), 2);
  });

  test('ViewHolderViewModel items should be in order', () {
    final viewHolderViewModel = ViewHolderViewModel();

    List<NavigationBarItem> itemsInOrder = [
      NavigationBarItem.timelineView,
      NavigationBarItem.pokemonView,
      NavigationBarItem.chatbotView
    ];

    expect(viewHolderViewModel.getItemsInOrder(), itemsInOrder);
  });

  test('ViewHolderViewModel views should be in order', () {
    final viewHolderViewModel = ViewHolderViewModel();

    List<Widget> itemsInOrder = viewHolderViewModel.getViewsInOrder();


    expect(itemsInOrder[0], isA<TimelineView>());
    expect(itemsInOrder[1], isA<PokemonView>());
    expect(itemsInOrder[2], isA<ChatbotView>());
    expect(itemsInOrder.length, 3);
  });
}