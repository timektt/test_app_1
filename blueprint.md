# Blueprint: Shopping List App

## Overview

A clean and efficient shopping list app designed for managing groceries. Key features include adding items, marking them as purchased, deleting completed items, and creating multiple distinct lists. The app will have a fresh, light green and white theme.

## Features

*   **Multiple Shopping Lists:** Users can create, view, and delete multiple shopping lists (e.g., "Groceries", "Hardware Store").
*   **Add Items:** Users can add new items to any shopping list.
*   **Mark as Purchased:** Items can be marked as purchased, which will visually distinguish them (e.g., strikethrough).
*   **Delete Completed Items:** A button will be available to delete all purchased items from a list.
*   **State Management:** The app will use the `provider` package to manage the state of the shopping lists.

## Design

*   **Theme:** A light and fresh theme with a primary color of light green and a white background.
*   **Fonts:** Use the `google_fonts` package for clean and readable typography. The `Lato` font will be used for its modern and friendly feel.
*   **Layout:** A simple and intuitive layout. The main screen will display the list of shopping lists. Tapping on a list will navigate to a screen showing the items in that list.
*   **Iconography:** Material Design icons will be used for actions like adding, deleting, and marking items.

## Implementation Plan

1.  **Dependencies:** Add `provider` and `google_fonts` to `pubspec.yaml`.
2.  **Models:**
    *   Create an `Item` model with `name` (String) and `isPurchased` (bool) properties.
    *   Create a `ShoppingList` model with a `name` (String) and a `items` (List<Item>) property.
3.  **Provider:**
    *   Create a `ShoppingListProvider` that extends `ChangeNotifier`.
    *   This provider will manage a list of `ShoppingList` objects.
    *   It will include methods to:
        *   Add a new shopping list.
        *   Delete a shopping list.
        *   Add an item to a shopping list.
        *   Toggle the `isPurchased` status of an item.
        *   Delete all purchased items from a list.
4.  **Screens:**
    *   **`ShoppingListScreen`:**
        *   Displays a list of all shopping lists.
        *   An `ElevatedButton` to add a new shopping list.
        *   Each list will be a `Card` with a `ListTile` showing the list name and a delete button.
        *   Tapping on a list navigates to the `ItemListScreen`.
    *   **`ItemListScreen`:**
        *   Displays the items in the selected shopping list.
        *   A `TextField` and `ElevatedButton` to add new items.
        *   Each item will be a `ListTile` with a `Checkbox` to mark it as purchased and the item name. The name will have a strikethrough when purchased.
        *   An `ElevatedButton` to "Clear Purchased Items".
5.  **Main.dart:**
    *   Set up the `ChangeNotifierProvider` for the `ShoppingListProvider`.
    *   Define the theme using `ThemeData` with a light green and white color scheme and `google_fonts`.
    *   Set up routing to navigate between the `ShoppingListScreen` and `ItemListScreen`.
