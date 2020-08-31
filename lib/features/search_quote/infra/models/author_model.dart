import 'package:meta/meta.dart';

import '../../domain/entities/author.dart';

class AuthorModel extends Author {
  final String image;
  final String name;
  final String href;

  AuthorModel({
    @required this.image,
    @required this.name,
    @required this.href,
  }) : super(image: image, name: name, href: href);

  Map<String, dynamic> toMap() {
    return {
      'image': image,
      'name': name,
      'href': href,
    };
  }

  factory AuthorModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return AuthorModel(
      image: map['image'],
      name: map['name'],
      href: map['href'],
    );
  }
}
