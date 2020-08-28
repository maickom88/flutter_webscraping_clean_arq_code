import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Author extends Equatable {
  final String image;
  final String name;
  final String href;

  Author({
    @required this.image,
    @required this.name,
    @required this.href,
  });

  @override
  List<Object> get props => [image, name, href];
}
