import 'package:flutter/material.dart';

class BoardingBox extends StatelessWidget {
  final AssetImage assetImage;
  final String text1;
  final String text2;

  const BoardingBox(
      {super.key,
      required this.assetImage,
      required this.text1,
      required this.text2});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SizedBox(
      height: height * 0.6,
      width: width * 0.8,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Image(
                image: assetImage,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 10),
            child: Text(
              text1,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 10),
            child: Text(
              text2,
              style:
                  const TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
            ),
          ),
        ],
      ),
    );
  }
}
