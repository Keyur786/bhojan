import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final String title;
  const CustomAppBar({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      foregroundColor: Colors.white,
      actions: [
        Opacity(
            opacity: 0.0,
            child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: const Icon(Icons.stop)))
      ],
      backgroundColor: Colors.deepOrange,
      elevation: 0.0,
      title: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .headline2!
              .copyWith(fontWeight: FontWeight.bold),
        ),
      ]),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}
