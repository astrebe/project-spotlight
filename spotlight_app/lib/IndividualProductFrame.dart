import "package:flutter/material.dart";
import 'RecalledProductDatabase.dart';
import 'dart:ui';
import 'package:flutter/src/widgets/image.dart' as flutterImage;

var physicalScreenSize = window.physicalSize;
var physicalWidth = physicalScreenSize.width;

class IndividualProductFrame extends StatefulWidget {
  final RecalledProduct product;
  const IndividualProductFrame(this.product, {Key? key}) : super(key: key);

  @override
  _IndividualProductFrameState createState() => _IndividualProductFrameState();
}

class _IndividualProductFrameState extends State<IndividualProductFrame> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 153, 0, 0),
          title: Text(widget.product.products![0].name!),
        ),
        backgroundColor: Colors.white,
        body: Container(
            margin: const EdgeInsets.symmetric(vertical: 20.0),
            height: physicalScreenSize.height,
            child: ListView(
              padding: const EdgeInsets.all(8),
              children: [
                if (widget.product.images != null) ...[
                  SizedBox(
                      height: 200,
                      child:
                          ListView(scrollDirection: Axis.horizontal, children: [
                        for (var i = 0; i < widget.product.images!.length; i++)
                          Padding(
                              padding: const EdgeInsets.all(10),
                              child: flutterImage.Image.network(
                                widget.product.images![i].url!,
                                width: 200,
                              )),
                      ])),
                ] else ...[
                  const Text("No images provided"),
                  const Text(""),
                ],
                if (widget.product.description != null) ...[
                  const Text("Description: ",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  const Text(""),
                  Text(widget.product.description!),
                  const Text(""),
                ] else ...[
                  const Text("Description: ",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  const Text(""),
                  const Text("No description provided"),
                  const Text(""),
                ],
                if (widget.product.hazards!.isNotEmpty) ...[
                  const Text("Hazard: ",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  const Text(""),
                  for (var i = 0; i < widget.product.hazards!.length; i++)
                    Text(widget.product.hazards![i].name!),
                  const Text(""),
                ] else ...[
                  const Text("Hazard: ",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  const Text(""),
                  const Text("No hazard provided"),
                  const Text(""),
                ],
                if (widget.product.injuries!.isNotEmpty) ...[
                  const Text("Injuries/incidents: ",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  const Text(""),
                  for (var i = 0; i < widget.product.injuries!.length; i++)
                    Text(widget.product.injuries![i].name!),
                  const Text(""),
                ] else ...[
                  const Text("Injuries/incidents: ",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  const Text(""),
                  const Text("No injuries reported/provided"),
                  const Text(""),
                ],
                if (widget.product.remedies!.isNotEmpty) ...[
                  const Text("Remedies: ",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  const Text(""),
                  for (var i = 0; i < widget.product.remedies!.length; i++)
                    Text(widget.product.remedies![i].name!),
                  const Text(""),
                ] else ...[
                  const Text("Remedies: ",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  const Text(""),
                  const Text("No remedies provided"),
                  const Text(""),
                ],
                if (widget.product.recallDate != null) ...[
                  const Text("Recall Date: ",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  const Text(""),
                  Text(widget.product.recallDate!.toString()),
                  const Text(""),
                ] else ...[
                  const Text("Recall Date: ",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  const Text(""),
                  const Text("No recall date provided"),
                  const Text(""),
                ],
                if (widget.product.products!.isNotEmpty) ...[
                  const Text("Units: ",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  const Text(""),
                  for (var i = 0; i < widget.product.products!.length; i++)
                    Text(widget.product.products![i].numberOfUnits!),
                  const Text(""),
                ] else ...[
                  const Text("Units: ",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  const Text(""),
                  const Text("Number of units not provided"),
                  const Text(""),
                ],
                if (widget.product.consumerContact != null) ...[
                  const Text("Consumer Contact: ",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  const Text(""),
                  Text(widget.product.consumerContact!),
                  const Text(""),
                ] else ...[
                  const Text("Consumer Contact: ",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  const Text(""),
                  const Text("Contact information not provided"),
                  const Text(""),
                ],
                if (widget.product.retailers!.isNotEmpty) ...[
                  const Text("Retailers: ",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  const Text(""),
                  for (var i = 0; i < widget.product.retailers!.length; i++)
                    Text(widget.product.retailers![i].name!),
                  const Text(""),
                ] else ...[
                  const Text("Retailers: ",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  const Text(""),
                  const Text("Retail locations not provided"),
                  const Text(""),
                ],
                if (widget.product.importers!.isNotEmpty) ...[
                  const Text("Importers: ",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  const Text(""),
                  for (var i = 0; i < widget.product.importers!.length; i++)
                    Text(widget.product.importers![i].name!),
                  const Text(""),
                ] else ...[
                  const Text("Importers: ",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  const Text(""),
                  const Text("Importers not provided"),
                  const Text(""),
                ],
                if (widget.product.manufacturers!.isNotEmpty) ...[
                  const Text("Manufacturer: ",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  const Text(""),
                  for (var i = 0; i < widget.product.manufacturers!.length; i++)
                    Text(widget.product.manufacturers![i].name!),
                  const Text(""),
                ] else ...[
                  const Text("Manufacturer: ",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  const Text(""),
                  const Text("Manufacturer not provided"),
                  const Text(""),
                ],
                if (widget.product.manufacturerCountries!.isNotEmpty) ...[
                  const Text("Origin Country: ",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  const Text(""),
                  for (var i = 0; i < widget.product.manufacturerCountries!.length; i++)
                    Text(widget.product.manufacturerCountries![i].country!),
                  const Text(""),
                ] else ...[
                  const Text("Origin Country: ",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  const Text(""),
                  const Text("Countries not provided"),
                  const Text(""),
                ],
                if (widget.product.recallNumber != null) ...[
                  const Text("Recall Number: ",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  const Text(""),
                  Text(widget.product.recallId!.toString()),
                  const Text(""),
                ] else ...[
                  const Text("Recall Number: ",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  const Text(""),
                  const Text("Recall number not provided"),
                  const Text(""),
                ],
              ],
            )));
  }
}
