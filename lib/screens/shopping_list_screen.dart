import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/providers/shopping_list_provider.dart';
import 'package:myapp/screens/item_list_screen.dart';
import 'package:provider/provider.dart';

class ShoppingListScreen extends StatelessWidget {
  final TextEditingController _listNameController = TextEditingController();

  ShoppingListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping Lists', style: GoogleFonts.lato()),
      ),
      body: Consumer<ShoppingListProvider>(
        builder: (context, provider, child) {
          return ListView.builder(
            itemCount: provider.shoppingLists.length,
            itemBuilder: (context, index) {
              final list = provider.shoppingLists[index];
              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                child: ListTile(
                  title: Text(list.name, style: GoogleFonts.lato()),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ItemListScreen(listIndex: index),
                      ),
                    );
                  },
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.redAccent),
                    onPressed: () => provider.deleteShoppingList(index),
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddListDialog(context),
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showAddListDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('New Shopping List', style: GoogleFonts.lato()),
          content: TextField(
            controller: _listNameController,
            decoration: const InputDecoration(hintText: 'Enter list name'),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                if (_listNameController.text.isNotEmpty) {
                  Provider.of<ShoppingListProvider>(context, listen: false)
                      .addShoppingList(_listNameController.text);
                  _listNameController.clear();
                  Navigator.pop(context);
                }
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }
}
