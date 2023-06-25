// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);


import 'dart:convert';
// fungsi untuk mengkonversi string JSON menjadi daftar objek Produk
List<Product> productFromJson(String str) => List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));
// fungsi untuk mengkonversi daftar objek product menjadi string JSON
String productToJson(List<Product> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Product {
    Product({ // mendefinisikan kelas product dengan beberapa properti
        required this.id,
        required this.title,
        required this.price,
        required this.description,
        required this.images,
        required this.creationAt,
        required this.updatedAt,
        required this.category,
    });
// membuat variabel konstan dimana nilai properti tetap dan tidak dapat diubah
    final int id;
    final String title;
    final int price;
    final String description;
    final List<String> images;
    final DateTime creationAt;
    final DateTime updatedAt;
    final Category category;

    // fungsi untuk sebuah factory constructor yang digunakan untuk membuat objek product dari sebuah map JSON
    factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        title: json["title"],
        price: json["price"],
        description: json["description"],
        images: List<String>.from(json["images"].map((x) => x)),
        creationAt: DateTime.parse(json["creationAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        category: Category.fromJson(json["category"]),
    );

    // fungsi untuk metode yang digunakan untuk mengkonversi objek product menjadi sebuah map JSON
    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "price": price,
        "description": description,
        "images": List<dynamic>.from(images.map((x) => x)),
        "creationAt": creationAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "category": category.toJson(),
    };
}

class Category {
    Category({ // mendefinisikan kelas category dengan beberapa properti
        required this.id,
        required this.name,
        required this.image,
        required this.creationAt,
        required this.updatedAt,
    });
// membuat variabel konstan dimana nilai properti tetap dan tidak dapat diubah
    final int id;
    final String name;
    final String image;
    final DateTime creationAt;
    final DateTime updatedAt;

    // fungsi untuk sebuah factory constructor yang digunakan untuk membuat objek category dari sebuah map JSON
    factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        creationAt: DateTime.parse(json["creationAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
    );
// fungsi untuk metode yang digunakan untuk mengkonversi objek category menjadi sebuah map JSON
    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "creationAt": creationAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
    };
}
