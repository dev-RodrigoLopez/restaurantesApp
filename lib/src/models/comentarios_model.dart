// To parse this JSON data, do
//
//     final comentario = comentarioFromJson(jsonString);

import 'dart:convert';

Comentario comentarioFromJson(String str) => Comentario.fromJson(json.decode(str));

String comentarioToJson(Comentario data) => json.encode(data.toJson());

class Comentario {
    Comentario({
        // this.slug,
        this.restaurant,
        this.email,
        this.comments,
        this.rating,
        // this.created,
    });

    // String slug;
    String restaurant;
    String email;
    String comments;
    String rating;
    // DateTime created;

    factory Comentario.fromJson(Map<String, dynamic> json) => Comentario(
        // slug: json["slug"],
        restaurant: json["restaurant"],
        email: json["email"],
        comments: json["comments"],
        rating: json["rating"],
        // created: DateTime.parse(json["created"]),
    );

    Map<String, dynamic> toJson() => {
        // "slug": slug,
        "restaurant": restaurant,
        "email": email,
        "comments": comments,
        "rating": rating,
        // "created": null,
    };
}
