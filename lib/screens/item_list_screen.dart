import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/models/item.dart';
import 'package:myapp/providers/shopping_list_provider.dart';
import 'package:provider/provider.dart';

class ItemListScreen extends StatelessWidget {
  final int listIndex;
  final TextEditingController _itemController = TextEditingController();

  ItemListScreen({super.key, required this.listIndex});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ShoppingListProvider>(context);
    final shoppingList = provider.shoppingLists[listIndex];

    return Scaffold(
      appBar: AppBar(
        title: Text(shoppingList.name, style: GoogleFonts.lato()),
        actions: [
          TextButton(
            onPressed: () => provider.deletePurchasedItems(listIndex),
            child: Text(
              'Clear Purchased',
              style: GoogleFonts.lato(color: Colors.white),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: shoppingList.items.length,
              itemBuilder: (context, itemIndex) {
                final item = shoppingList.items[itemIndex];
                return ListTile(
                  leading: Checkbox(
                    value: item.isPurchased,
                    onChanged: (value) {
                      provider.togglePurchased(listIndex, itemIndex);
                    },
                  ),
                  title: Text(
                    item.name,
                    style: GoogleFonts.lato(
                      decoration: item.isPurchased
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _itemController,
                    decoration: const InputDecoration(
                      hintText: 'Add a new item...',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 8.0),
                ElevatedButton(
                  onPressed: () {
                    if (_itemController.text.isNotEmpty) {
                      final newItem = Item(name: _itemController.text);
                      provider.addItem(listIndex, newItem);
                      _itemController.clear();
                    }
                  },
                  child: const Text('Add'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
