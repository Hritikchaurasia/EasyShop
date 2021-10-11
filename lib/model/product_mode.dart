import 'dart:convert';

import 'package:e_commerce_app_flutter/utils/custome_function.dart';
import 'package:flutter/foundation.dart';



class Product {
  final String id;
  final String name;
  final String brand;
  final String category;
  final List<String> imageURL;
  final double price;
  final List<String> colors;
  final List<String> size;
  final String description;
  final double rating;

  Product({
    this.id,
    this.name,
    this.brand,
    this.category,
    this.imageURL,
    this.price,
    this.colors,
    this.size,
    this.description,
    this.rating,
 
   } );


  Product copyWith({
    String id,
    String name,
    String brand,
    String category,
    List<String> imageURL,
    double price,
    List<String> colors,
    List<String> size,
    String description,
    double rating,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      brand: brand ?? this.brand,
      category: category ?? this.category,
      imageURL: imageURL ?? this.imageURL,
      price: price ?? this.price,
      colors: colors ?? this.colors,
      size: size ?? this.size,
      description: description ?? this.description,
      rating: rating ?? this.rating,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'brand': brand,
      'category': category,
      'imageURL': listToMap(imageURL),
      'price': price,
      'colors': listToMap(colors),
      'size': listToMap(size),
      'description': description,
      'rating': rating,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return Product(
      id: map['id'],
      name: map['name'],
      brand: map['brand'],
      category: map['category'],
      imageURL: listFromMap(map['imageURL']),
      price: map['price'].toDouble(),
      colors: listFromMap(map['colors']),
      size: listFromMap(map['size']),
      description: map['description'],
      rating: map['rating'].toDouble(),
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) => Product.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Product(id: $id, name: $name, brand: $brand, category: $category, imageURL: $imageURL, price: $price, colors: $colors, size: $size, description: $description, rating: $rating)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is Product &&
      o.id == id &&
      o.name == name &&
      o.brand == brand &&
      o.category == category &&
      listEquals(o.imageURL, imageURL) &&
      o.price == price &&
      listEquals(o.colors, colors) &&
      listEquals(o.size, size) &&
      o.description == description &&
      o.rating == rating;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      brand.hashCode ^
      category.hashCode ^
      imageURL.hashCode ^
      price.hashCode ^
      colors.hashCode ^
      size.hashCode ^
      description.hashCode ^
      rating.hashCode;
  }


  
}
