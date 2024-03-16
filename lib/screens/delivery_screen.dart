import 'package:crop_traceability/utils/colors.dart';
import 'package:crop_traceability/widgets/button_widget.dart';
import 'package:crop_traceability/widgets/input_quantity.dart';
import 'package:crop_traceability/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Order {
  final String cropName;
  final int quantity;
  final String unit;

  Order({
    required this.cropName,
    required this.quantity,
    required this.unit,
  });
}

class DeliveryScreen extends StatefulWidget {
  const DeliveryScreen({Key? key}) : super(key: key);

  @override
  State<DeliveryScreen> createState() => _DeliveryScreenState();
}

class _DeliveryScreenState extends State<DeliveryScreen> {
  void addCropToOrders(String cropName, int quantity, String unit) {
    setState(() {
      orders.add(Order(
        cropName: cropName,
        quantity: quantity,
        unit: unit,
      ));
    });
  }

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> _sendOrdersToFirestore() async {
    CollectionReference ordersCollection = _firestore.collection('orders');
    DateTime now = DateTime.now();
    for (Order order in orders) {
      await ordersCollection.add({
        'cropName': order.cropName,
        'quantity': order.quantity,
        'unit': order.unit,
        'checkoutDateTime': now,
      });
    }
    // Clear orders list after sending to Firestore
    setState(() {
      orders.clear();
    });
  }

  String dropdownValue = 'crates';
  final name = "Farmer";
  final List<Order> orders = [];

  int selectedQuantity = 0;

  @override
  Widget build(BuildContext context) {
    Widget buildClickableCard(String imagePath, String cropName) {
      return Expanded(
        child: GestureDetector(
          onTap: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return StatefulBuilder(
                  builder: (BuildContext context, StateSetter setState) {
                    return AlertDialog(
                      title: const Text('Enter Quantity Information'),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          InputQty(
                            maxVal: double.maxFinite,
                            initVal: 0,
                            onQtyChanged: (val) {
                              setState(() {
                                selectedQuantity = val;
                              });
                            },
                            fontSize: 20,
                          ),
                          DropdownButton<String>(
                            value: dropdownValue,
                            onChanged: (String? newValue) {
                              setState(() {
                                dropdownValue = newValue!;
                              });
                            },
                            items: <String>['crates', 'sacks']
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('Close'),
                        ),
                        TextButton(
                          onPressed: () {
                            addCropToOrders(
                              cropName,
                              selectedQuantity,
                              dropdownValue,
                            );
                            Navigator.of(context).pop();
                          },
                          child: const Text('Save'),
                        ),
                      ],
                    );
                  },
                );
              },
            );
          },
          child: SizedBox(
            height: 200,
            child: Card(
              color: primary,
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(15),
                      ),
                      child: Image.asset(
                        imagePath,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 8,
                      bottom: 8,
                    ),
                    child: TextWidget(
                      text: cropName,
                      fontSize: 25,
                      fontFamily: 'Bold',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: background,
        appBar: AppBar(
          centerTitle: true,
          title: TextWidget(
            text: "Delivery",
            fontSize: 25,
            color: Colors.black,
            fontFamily: 'Bold',
          ),
          actions: [
            IconButton(
              onPressed: () {
                showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: TextWidget(
                        text: 'Order Details',
                        fontSize: 20,
                        fontFamily: 'Bold',
                      ),
                      content: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: orders.map((order) {
                            return ListTile(
                              title: TextWidget(
                                text: order.cropName,
                                fontSize: 20,
                                fontFamily: "bold",
                              ),
                              subtitle: TextWidget(
                                text: "${order.quantity} ${order.unit}",
                                fontSize: 15,
                                fontFamily: "bold",
                              ),
                              trailing: IconButton(
                                icon: const Icon(Icons.delete),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                  setState(() {
                                    orders.remove(order);
                                  });
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content:
                                          Text('Deleted ${order.cropName}'),
                                      duration: const Duration(seconds: 3),
                                      action: SnackBarAction(
                                        label: 'Undo',
                                        onPressed: () {
                                          setState(() {
                                            orders.add(order);
                                          });
                                        },
                                      ),
                                    ),
                                  );
                                },
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: TextWidget(
                            color: background,
                            text: 'Close',
                            fontSize: 15,
                            fontFamily: "Bold",
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                            showDialog(
                                barrierDismissible: false,
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: TextWidget(
                                      text:
                                          'Are you sure you want to proceed checkout?',
                                      fontSize: 20,
                                      fontFamily: "Bold",
                                    ),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: TextWidget(
                                          color: background,
                                          text: 'Close',
                                          fontSize: 15,
                                          fontFamily: "Bold",
                                        ),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          if (orders.isNotEmpty) {
                                            _sendOrdersToFirestore();
                                          } else {
                                            // Show a message that orders list is empty
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              const SnackBar(
                                                content: Text(
                                                    'No crops added for checkout.'),
                                                duration: Duration(seconds: 3),
                                              ),
                                            );
                                          }
                                          Navigator.of(context).pop();
                                        },
                                        child: TextWidget(
                                          color: background,
                                          text: 'OK',
                                          fontSize: 15,
                                          fontFamily: "Bold",
                                        ),
                                      ),
                                    ],
                                  );
                                });
                          },
                          child: TextWidget(
                            color: background,
                            text: 'Checkout Crops',
                            fontSize: 15,
                            fontFamily: "Bold",
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
              icon: const Icon(Icons.shopping_basket_rounded),
            ),
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        padding: const EdgeInsets.all(7),
                        child: const Icon(
                          Icons.person,
                          size: 35,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      TextWidget(
                        text: 'Hello $name',
                        fontSize: 20,
                        color: primary,
                        fontFamily: 'Bold',
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ButtonWidget(
                        color: primary,
                        // radius: 120,
                        width: 20,
                        fontSize: 20,
                        height: 45,
                        textcolor: background,
                        fontFamily: 'Bold',
                        label: 'Add Crops',
                        onPressed: () {},
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          buildClickableCard(
                              'assets/images/cabbage.webp', 'Cabbage'),
                          const SizedBox(width: 8),
                          buildClickableCard(
                              'assets/images/eggplant.png', 'Eggplant'),
                        ],
                      ),
                      const SizedBox(height: 40),
                      Row(
                        children: [
                          buildClickableCard(
                              'assets/images/carrots.png', 'Carrots'),
                          const SizedBox(width: 8),
                          buildClickableCard(
                              'assets/images/potato.png', 'Potato'),
                        ],
                      ),
                      const SizedBox(height: 40),
                      Row(
                        children: [
                          buildClickableCard(
                              'assets/images/pechay.png', 'Pechay'),
                          const SizedBox(width: 8),
                          buildClickableCard(
                              'assets/images/onions.png', 'Onions'),
                        ],
                      ),
                      const SizedBox(height: 40),
                      Row(
                        children: [
                          buildClickableCard(
                              'assets/images/garlic.png', 'Garlic'),
                          const SizedBox(width: 8),
                          buildClickableCard(
                              'assets/images/ginger.png', 'Ginger'),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
