import 'dart:ffi';

import 'package:flutter/material.dart';

class ClassicCustomBox extends StatefulWidget {
  final String firstText;
  final String? secondText;
  final String? thirdText;
  final int numberOfButtons;
  const ClassicCustomBox({
    super.key,
    required this.firstText,
    this.secondText,
    this.thirdText,
    required this.numberOfButtons,
  });

  @override
  State<ClassicCustomBox> createState() => _ClassicCustomBoxState();
}

class _ClassicCustomBoxState extends State<ClassicCustomBox> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      height: height * 0.5,
      width: width * 0.8,
      decoration: BoxDecoration(
        color: Colors.white,
        border:
            Border.all(color: const Color.fromARGB(255, 0, 181, 105), width: 3),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: <Widget>[
          const Center(
              child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Image(
              image: AssetImage('assets/images/trash.png'),
            ),
          )),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "Prochaine action à faire",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 20,
          ),
          if (widget.secondText != null)
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Text(
                  widget.secondText!,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ),
          if (widget.thirdText != null)
            const SizedBox(
              height: 10,
            ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Text(
                widget.thirdText!,
                style: const TextStyle(
                  color: Colors.black54,
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              if (widget.numberOfButtons == 1)
                Align(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
                    onPressed: () {
                      //Write the code to do the rest
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black, // Background color
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                          side: const BorderSide(
                              color: Colors.black) // Border radius
                          ),
                    ),
                    child: const Text(
                      "J'y vais",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )
              else if (widget.numberOfButtons == 2)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: () {
                        //Write the code to do the rest
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green[100], // Background color
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                            side: const BorderSide(
                                color: Color.fromARGB(
                                    255, 0, 181, 105)) // Border radius
                            ),
                      ),
                      child: const Text(
                        "M'indiquer le chemin",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        //Write the code to do the rest
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black, // Background color
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                            side: const BorderSide(
                                color: Colors.black) // Border radius
                            ),
                      ),
                      child: const Text(
                        "J'y suis",
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  ],
                )
            ],
          )
        ],
      ),
    );
  }
}
