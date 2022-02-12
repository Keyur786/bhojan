import 'package:bhojan/models/models.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class HeroCarouselCard extends StatelessWidget {
  final Category? category;
  final Product? product;
  const HeroCarouselCard({Key? key, this.category, this.product})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (product == null) {
          Navigator.pushNamed(context, "/catalog", arguments: category);
        }
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 20),
        child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(12.0)),
            child: Stack(
              children: <Widget>[
                CachedNetworkImage(
                  fit: BoxFit.cover,
                  width: 1000.0,
                  imageUrl:
                      product == null ? category!.imageUrl : product!.imageUrl,
                ),
                Positioned(
                  bottom: 0.0,
                  left: 0.0,
                  right: 0.0,
                  child: Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color.fromARGB(200, 0, 0, 0),
                          Color.fromARGB(0, 0, 0, 0)
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 20.0),
                    child: Text(
                        product == null ? category!.name : "",
                        style: Theme.of(context).textTheme.headline1!.copyWith(color: Colors.white)),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
