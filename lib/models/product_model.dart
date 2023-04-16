class ProductModel {
  final int id;
  final String title;
  final dynamic price;
  final String description;
  final String category;
  final String image;
  final RatingModel rating;

  ProductModel({
    required this.id,
    required this.category,
    required this.description,
    required this.image,
    required this.price,
    required this.title,
    required this.rating,
  });

  factory ProductModel.fromJson(jsondata) {
    return ProductModel(
        id: jsondata['id'],
        category: jsondata['category'],
        description: jsondata['description'],
        image: jsondata['image'],
        price: jsondata['price'],
        title: jsondata['title'],
        rating: RatingModel.fromJson(jsondata['rating']));
  }
}

class RatingModel {
  final dynamic rate;
  final dynamic count;
  RatingModel({
    required this.rate,
    required this.count,
  });

  factory RatingModel.fromJson(jsondata) {
    return RatingModel(rate: jsondata['rate'], count: jsondata['count']);
  }
}
