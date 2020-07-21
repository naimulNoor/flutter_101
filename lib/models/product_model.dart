class Product{
  int id;
  String name;
  double price;
  String category;
  String date;
  String imagePath;
  int stockCount;

  Product({this.name, this.price, this.category, this.date, this.imagePath, this.stockCount});

  @override
  String toString() {
    return 'Product{id: $id, name: $name, price: $price, category: $category, date: $date, imagePath: $imagePath, stockCount: $stockCount}';
  }
}