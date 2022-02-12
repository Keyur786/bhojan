import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Category extends Equatable {
  final String name;
  final String imageUrl;
  const Category({required this.name, required this.imageUrl});

  @override
  List<Object?> get props => [name, imageUrl];

  static Category fromSnapshot(DocumentSnapshot snap) {
    Category category =
        Category(name: snap['name'], imageUrl: snap['imageUrl']);
    return category;
  }

  static List<Category> categories = [
    const Category(
        name: 'Veg',
        imageUrl:
            "https://media.istockphoto.com/photos/woman-preparing-tasty-vegan-tacos-picture-id1241880776?b=1&k=20&m=1241880776&s=170667a&w=0&h=sXCMlMPsCpx4nulY7u8g0Wu0uMmpgadr_ocOyEvClu0="),
    const Category(
        name: 'NonVeg',
        imageUrl:
            "https://images.unsplash.com/photo-1585039261108-ec658b915e37?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8MXwzODcxNzk3N3x8ZW58MHx8fHw%3D&auto=format&fit=crop&w=500&q=60"),
    const Category(
        name: 'FastFood',
        imageUrl:
            "https://images.unsplash.com/photo-1615996001375-c7ef13294436?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8ZmFzdGZvb2R8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60"),
    const Category(
        name: 'Sweet',
        imageUrl:
            "https://images.unsplash.com/photo-1551106652-a5bcf4b29ab6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OXx8c3dlZXR8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60"),
    const Category(
        name: 'Spicy',
        imageUrl:
            "https://images.unsplash.com/photo-1455619452474-d2be8b1e70cd?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8c3BpY3l8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60"),
  ];
}
