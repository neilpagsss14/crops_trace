import 'package:flutter/material.dart';

class InputQty extends StatefulWidget {
  final double maxVal;
  final int initVal;
  final Function(int) onQtyChanged;
  final double fontSize; // Add this property
  final bool isVisible; // Add this property

  const InputQty({
    Key? key,
    required this.maxVal,
    required this.initVal,
    required this.onQtyChanged,
    this.fontSize = 14, // Default font size
    this.isVisible = true,
  }) : super(key: key);

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
  void dispose() {
    _cropsController.dispose();
    super.dispose();
  }

  void _clearField() {
    setState(() {
      _cropsController.clear();
    });
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
