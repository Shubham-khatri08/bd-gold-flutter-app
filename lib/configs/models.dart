
class ExploreItemModel {
  String url;
  String title;
  String description;

  ExploreItemModel(this.url, this.title, this.description);
}

class ColorModel {
  int id;
  String color;

  ColorModel(this.id, this.color);
}

class ItemModel {
  int id;
  String title;
  String image;
  double price;

  ItemModel(this.id, this.title, this.image, this.price);
}