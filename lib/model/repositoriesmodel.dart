// ignore_for_file: non_constant_identifier_names

class Repositories {
  Repositories({
    required this.name,
    required this.description,
    required this.html_url,
    // required this.avatar_url,
  });

  final String? name;
  final String? description;
  final String? html_url;
  // final String? avatar_url;

  /* 
  exemplo saida json github:
  "name": "feedback_screen",
  "description": null,
  "html_url": "https://github.com/anabellon/feedback_screen",
  */

  factory Repositories.fromJson(Map<String, dynamic> json) => Repositories(
        name: json['name'],
        description: json['description'],
        html_url: json['html_url'],
        // avatar_url: json['owner']['avatar_url'],
      );

  // verificar o Map e suas passagens, está errado
  Map<String, dynamic> toJson() => {
        "name": name,
        "description": description,
        "html_url": html_url,
        // "avatar_url": avatar_url,
      };
}
