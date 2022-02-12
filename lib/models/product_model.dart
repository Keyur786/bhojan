import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String name;
  final String imageUrl;
  final int price;
  final bool isRecommended;
  final bool isPopular;
  final String category;
  final String desc;

  const Product(
      {required this.category,
      required this.imageUrl,
      required this.isPopular,
      required this.isRecommended,
      required this.name,
      required this.price,
      required this.desc});

  @override
  List<Object?> get props =>
      [name, price, imageUrl, isPopular, isRecommended, category];

  static Product fromSnapshot(DocumentSnapshot snap) {
    Product product = Product(
        category: snap['category'],
        imageUrl: snap['imageUrl'],
        isPopular: snap['isPopular'],
        isRecommended: snap['isRecommended'],
        name: snap['name'],
        price: snap['price'],
        desc: snap['desc']);
    return product;
  }

  static List<Product> products = [
    const Product(
        category: "Veg",
        imageUrl:
            "https://media.istockphoto.com/photos/plain-dosa-dish-picture-id1318571167?b=1&k=20&m=1318571167&s=170667a&w=0&h=y6-UzyZaDysAXmkUeA9TJyxgkGRxccygadwNS_26WZM=",
        isPopular: true,
        isRecommended: false,
        name: "Masala Dhosa",
        price: 399,
        desc: "GAMING"),
    const Product(
        category: "NonVeg",
        imageUrl:
            "https://media.istockphoto.com/photos/image-of-indian-meal-of-homemade-nan-naan-bread-sliced-with-butter-picture-id1154928317?b=1&k=20&m=1154928317&s=170667a&w=0&h=uBNWkT1Uw6o_EQyU-SmiC9RjniM4e6M8lDnpeP86Mpg=",
        isPopular: false,
        isRecommended: true,
        name: "Chicken Tika",
        price: 249,
        desc: "GAMING"),
    const Product(
        category: "NonVeg",
        imageUrl:
            "https://media.istockphoto.com/photos/baked-chicken-drumsticks-picture-id964765254?k=20&m=964765254&s=612x612&w=0&h=F1jgOH__u1bxuTHe2RviILM_fM9gplwnXum3UIyLTOQ=",
        isPopular: false,
        isRecommended: true,
        name: "Chicken Sticks",
        price: 499,
        desc: "GAMING"),
    const Product(
        category: "Sweet",
        imageUrl:
            "https://media.istockphoto.com/photos/motichur-laddu-made-from-besan-special-festival-indain-sweets-picture-id1337187550?b=1&k=20&m=1337187550&s=170667a&w=0&h=acDhzNeuWzihuqg6zCb0UCrhFSDmcTR4wqifE3dF6Ac=",
        isRecommended: false,
        name: "Laddu",
        price: 599,
        isPopular: true,
        desc: "GAMING"),
    const Product(
        category: "Veg",
        imageUrl:
            "https://media.istockphoto.com/photos/indian-pulav-or-vegetables-rice-or-veg-biryani-orange-background-picture-id495201462?k=20&m=495201462&s=612x612&w=0&h=gDhrYVsBvpkf0WVbgde8kwvaM1YfFr-C2iSZuVjMsoU=",
        isPopular: true,
        isRecommended: true,
        name: " Vegetables Rice",
        price: 299,
        desc: "GAMING"),
    const Product(
        category: "Spicy",
        imageUrl:
            "https://media.istockphoto.com/photos/prawns-with-chimichurri-picture-id474164285?k=20&m=474164285&s=612x612&w=0&h=FcFhxNWhjqgOVSDnlaKE6sdxz_otf27Xv2RdPcUYRzQ=",
        isPopular: true,
        isRecommended: false,
        name: "Chimichurri",
        price: 399,
        desc: "GAMING"),
    const Product(
        category: "FastFood",
        imageUrl:
            "https://media.istockphoto.com/photos/fresh-tasty-burger-picture-id495204032?k=20&m=495204032&s=612x612&w=0&h=x44AnT8kHv-apqnG9t1ILwf2sIr4uq14CUB7MBaiuOI=",
        isPopular: false,
        isRecommended: true,
        name: " Veg Burger",
        price: 149,
        desc: "GAMING"),
  ];
}
