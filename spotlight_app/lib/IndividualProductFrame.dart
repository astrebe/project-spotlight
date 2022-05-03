import "package:flutter/material.dart";
import "RecalledProduct.dart";
import 'dart:ui';

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
          title: Text(widget.product.productName),
        ),
        backgroundColor: Colors.white,
        body: ListView(
          children: [
            (widget.product.imgLoc != null)
                ? Padding(
                    padding: const EdgeInsets.all(10),
                    child: Image.asset(
                      widget.product.imgLoc!,
                      width: physicalWidth,
                    ))
                : const Text("[Image not Provided]"),
            const Text("Description: ",
                style: TextStyle(fontWeight: FontWeight.bold)),
            const Text(""),
            Text(widget.product.productDesc),
            const Text(""),
            const Text("Hazard: ",
                style: TextStyle(fontWeight: FontWeight.bold)),
            const Text(""),
            Text(widget.product.hazType),
            const Text(""),
            const Text("Incidents: ",
                style: TextStyle(fontWeight: FontWeight.bold)),
            const Text(""),
            Text(widget.product.incidents),
            const Text(""),
            const Text("Remedy: ",
                style: TextStyle(fontWeight: FontWeight.bold)),
            const Text(""),
            Text(widget.product.remedy),
            const Text(""),
            const Text("Recall Date: ",
                style: TextStyle(fontWeight: FontWeight.bold)),
            const Text(""),
            Text(widget.product.recallDate),
            const Text(""),
            const Text("Units: ",
                style: TextStyle(fontWeight: FontWeight.bold)),
            const Text(""),
            Text(widget.product.units.toString()),
            const Text(""),
            const Text("Consumer Contact: ",
                style: TextStyle(fontWeight: FontWeight.bold)),
            const Text(""),
            Text("Company phone number: ${widget.product.compPhnum}"),
            Text("Company email: ${widget.product.compEmail}"),
            (widget.product.manufacturer != null)
                ? Padding(
                    padding: const EdgeInsets.all(10),
                    child:
                        Text("Manufacturer: ${widget.product.manufacturer!}"),
                  )
                : const Text("Manufacturer not provided"),
            (widget.product.distributors != null)
                ? Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text("Distributor: ${widget.product.distributors!}"),
                  )
                : const Text("Distributor not provided"),
            const Text(""),
            const Text("Sold at: ",
                style: TextStyle(fontWeight: FontWeight.bold)),
            const Text(""),
            Text(widget.product.soldAt),
            const Text(""),
            const Text("Importers: ",
                style: TextStyle(fontWeight: FontWeight.bold)),
            const Text(""),
            Text(widget.product.importers),
            const Text(""),
            const Text("Origin Country: ",
                style: TextStyle(fontWeight: FontWeight.bold)),
            const Text(""),
            Text(widget.product.countryOrigin),
            const Text(""),
            const Text("Recall No.: ",
                style: TextStyle(fontWeight: FontWeight.bold)),
            const Text(""),
            Text(widget.product.recallNum.toString()),
            const Text(""),
          ],
        ));
  }
}
