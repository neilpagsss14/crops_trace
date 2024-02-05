import 'package:crop_traceability/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class TextFieldWidget extends StatefulWidget {
  final String? hint;
  bool? isObscure;
  final TextEditingController controller;
  final double? width;
  final double? height;
  final int? maxLine;
  final TextInputType? inputType;
  late bool? showEye;
  late Color? color;
  late Color? borderColor;
  late Color? hintColor;
  late double? radius;
  final String? Function(String?)? validator; // Add validator parameter

  final TextCapitalization? textCapitalization;

  TextFieldWidget({
    super.key,
    this.hint = '',
    required this.controller,
    this.isObscure = false,
    this.width = double.infinity,
    this.height = 40,
    this.maxLine = 1,
    this.hintColor = Colors.white,
    this.borderColor = Colors.transparent,
    this.showEye = false,
    this.color = Colors.white,
    this.radius = 5,
    this.textCapitalization = TextCapitalization.sentences,
    this.inputType = TextInputType.text,
    this.validator, // Add validator parameter
  });

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 5,
        ),
        TextFormField(
          style: const TextStyle(
            fontFamily: 'QRegular',
            fontSize: 14,
          ),
          textCapitalization: widget.textCapitalization!,
          keyboardType: widget.inputType,
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.key),
            prefixIconColor: Colors.green,
            suffixIcon: widget.showEye! == true
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        widget.isObscure = !widget.isObscure!;
                      });
                    },
                    icon: widget.isObscure!
                        ? const Icon(Icons.visibility)
                        : const Icon(Icons.visibility_off))
                : const SizedBox(),
            filled: true,
            fillColor: Colors.white70,
            hintText: widget.hint,
            border: InputBorder.none,
            disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: widget.borderColor!,
              ),
              borderRadius: BorderRadius.circular(25),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: widget.borderColor!,
              ),
              borderRadius: BorderRadius.circular(25),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: widget.borderColor!,
              ),
              borderRadius: BorderRadius.circular(25),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.red,
              ),
              borderRadius: BorderRadius.circular(25),
            ),
            errorStyle: const TextStyle(fontFamily: 'QBold', fontSize: 12),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.red,
              ),
              borderRadius: BorderRadius.circular(5),
            ),
          ),

          maxLines: widget.maxLine,
          obscureText: widget.isObscure!,
          controller: widget.controller,
          validator:
              widget.validator, // Pass the validator to the TextFormField
        ),
      ],
    );
  }
}
