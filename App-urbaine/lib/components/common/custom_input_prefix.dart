import 'package:flutter/material.dart';

//Ce sont les champs qui sont utilisé dans l'application
class CustomPrefixInput extends StatefulWidget {
  final String labelText;
  final String hintText;
  final String? Function(String?) validator;
  final Icon? prefixIcon;
  final bool suffixIcon;
  final bool prefixPresent;
  final bool obscureText;
  final bool inputPresent;
  final TextEditingController textEditingController;
  final TextInputType? textInputType;

  const CustomPrefixInput(
      {super.key,
      required this.labelText,
      required this.hintText,
      required this.validator,
      this.prefixIcon,
      this.suffixIcon = false,
      this.prefixPresent = false,
      this.inputPresent = false,
      this.obscureText = false,
      required this.textEditingController,
      this.textInputType});

  @override
  State<CustomPrefixInput> createState() => _CustomPrefixInputState();
}

class _CustomPrefixInputState extends State<CustomPrefixInput> {
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.9,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 3),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              widget.labelText,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: size.height * 0.01,
          ),
          TextFormField(
            obscureText: (widget.obscureText && _obscureText),
            keyboardType: widget.inputPresent ? widget.textInputType : null,
            controller: widget.textEditingController,
            decoration: InputDecoration(
              hintText: widget.hintText,
              prefixIcon: widget.prefixPresent ? widget.prefixIcon : null,
              prefixIconColor: MaterialStateColor.resolveWith(
                (states) => states.contains(MaterialState.focused)
                    ? const Color.fromARGB(255, 0, 181, 105)
                    : Colors.grey,
              ),
              suffixIcon: widget.suffixIcon
                  ? IconButton(
                      icon: Icon(
                        _obscureText
                            ? Icons.remove_red_eye
                            : Icons.visibility_off_outlined,
                        color: Colors.black54,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                    )
                  : null,
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black38),
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Color.fromARGB(255, 0, 181, 105)),
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ), // This is the color when selected
              ),
            ),
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: widget.validator,
          ),
        ],
      ),
    );
  }
}
