import 'package:flutter/material.dart';
import 'package:mychatproject/main.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: mq.height * 0.12,
      left: mq.width * 0.005,
      width: mq.width * 0.99,
      height: mq.height * 0.08,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SearchBar(
          backgroundColor: MaterialStateProperty.all(Colors.grey.shade300),
          leading: const Icon(Icons.search),
          hintText: "Search",
          hintStyle: MaterialStateProperty.all(const TextStyle(fontSize: 18)),
          elevation: MaterialStateProperty.all(0.5),
          shape: MaterialStateProperty.all(const StadiumBorder(side: BorderSide.none),
        ),
      ),
    ),
    );
  }
}