import 'package:flutter/material.dart';

class InputQty extends StatefulWidget {
  final double maxVal;
  final int initVal;
  final Function(int) onQtyChanged;
  final double fontSize; // Add this property

  const InputQty({
    super.key,
    required this.maxVal,
    required this.initVal,
    required this.onQtyChanged,
    this.fontSize = 14, // Default font size
  });

  @override
  _InputQtyState createState() => _InputQtyState();
}

class _InputQtyState extends State<InputQty> {
  final TextEditingController _cropsController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _cropsController.text = widget.initVal.toString();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      height: 100,
      child: TextFormField(
        controller: _cropsController,
        keyboardType: TextInputType.number,
        style: TextStyle(fontSize: widget.fontSize), // Set the font size here
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
        ),
        onChanged: (value) {
          if (value.isNotEmpty) {
            int qty = int.parse(value);
            if (qty > widget.maxVal) {
              _cropsController.text = widget.maxVal.toString();
              qty = widget.maxVal.toInt();
            }
            widget.onQtyChanged(qty);
          }
        },
      ),
    );
  }
}
