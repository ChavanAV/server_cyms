class GroceryList {
  final String name;
  final String? description;
  GroceryList({
    required this.name,
    required this.description,
  });
}

List<GroceryList> groceryList = [
  GroceryList(
    name: 'assets/images/vegitables.jpg',
    description: 'पालेभाज्या व फळभज्या',
  ),
  GroceryList(
    name: 'assets/images/fruits.jpg',
    description: 'फळबागा',
  ),
  GroceryList(
    name: 'assets/images/kad_dhanya.jpeg',
    description: 'कडधान्य',
  ),
  GroceryList(
    name: 'assets/images/Flowers.jpg',
    description: 'फुलबागा',
  ),
];
