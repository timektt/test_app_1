'''import 'package:flutter/material.dart';
import 'package:myapp/models/item.dart';
import 'package:myapp/models/shopping_list.dart';

class ShoppingListProvider with ChangeNotifier {
  final List<ShoppingList> _shoppingLists = [];

  List<ShoppingList> get shoppingLists => _shoppingLists;

  void addShoppingList(String name) {
    _shoppingLists.add(ShoppingList(name: name, items: []));
    notifyListeners();
  }

  void deleteShoppingList(int index) {
    _shoppingLists.removeAt(index);
    notifyListeners();
  }

  void addItem(int listIndex, Item item) {
    _shoppingLists[listIndex].items.add(item);
    notifyListeners();
  }

  void togglePurchased(int listIndex, int itemIndex) {
    _shoppingLists[listIndex].items[itemIndex].isPurchased =
        !_shoppingLists[listIndex].items[itemIndex].isPurchased;
    notifyListeners();
  }

  void deletePurchasedItems(int listIndex) {
    _shoppingLists[listIndex].items.removeWhere((item) => item.isPurchased);
    notifyListeners();
  }
}
''