// To parse this JSON data, do
//
//     final restaurantes = restaurantesFromJson(jsonString);

import 'dart:convert';

List<Restaurantes> restaurantesFromJson(String str) => List<Restaurantes>.from(json.decode(str).map((x) => Restaurantes.fromJson(x)));

String restaurantesToJson(List<Restaurantes> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Restaurantes {
    Restaurantes({
        this.slug,
        this.name,
        this.description,
        this.logo,
        this.rating,
        this.foodType,
        this.reviews,
    });

    String slug;
    String name;
    String description;
    String logo;
    double rating;
    List<String> foodType;
    List<Review> reviews;

    factory Restaurantes.fromJson(Map<String, dynamic> json) => Restaurantes(
        slug: json["slug"],
        name: json["name"],
        description: json["description"],
        logo: json["logo"],
        rating: json["rating"] == null ? null : json["rating"].toDouble(),
        foodType: List<String>.from(json["food_type"].map((x) => x)),
        reviews: List<Review>.from(json["reviews"].map((x) => Review.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "slug": slug,
        "name": name,
        "description": description,
        "logo": logo,
        "rating": rating == null ? null : rating,
        "food_type": List<dynamic>.from(foodType.map((x) => x)),
        "reviews": List<dynamic>.from(reviews.map((x) => x.toJson())),
    };
}

class Review {
    Review({
        this.slug,
        this.restaurant,
        this.email,
        this.comments,
        this.rating,
        this.created,
    });

    String slug;
    String restaurant;
    String email;
    String comments;
    int rating;
    DateTime created;

    factory Review.fromJson(Map<String, dynamic> json) => Review(
        slug: json["slug"],
        restaurant: json["restaurant"],
        email: json["email"],
        comments: json["comments"],
        rating: json["rating"],
        created: DateTime.parse(json["created"]),
    );

    Map<String, dynamic> toJson() => {
        "slug": slug,
        "restaurant": restaurant,
        "email": email,
        "comments": comments,
        "rating": rating,
        "created": created.toIso8601String(),
    };
}
