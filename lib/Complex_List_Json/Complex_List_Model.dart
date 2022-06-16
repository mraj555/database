class Products {
  final int? productId;
  final int? quantity;

  Products({required this.productId, required this.quantity});

  factory Products.fromJson(Map<String, dynamic> data) {
    return Products(productId: data['productId'], quantity: data['quantity'],);
  }
}


class Model {
  final int? id;
  final int? userId;
  final String? date;
  final List<Products>? products;

  Model(
      {required this.id, required this.userId, required this.date,required this.products});


  factory Model.fromJson(Map<String, dynamic> json) {

    var list = json['products'] as List;
    List<Products> products = list.map((e) => Products.fromJson(e)).toList();

    return Model(
        id: json['id'],
        userId: json['userId'],
        date: json['date'],
        products: products
    );
  }
}