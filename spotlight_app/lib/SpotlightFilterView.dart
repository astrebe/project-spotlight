import "package:flutter/material.dart";
import 'package:spotlight_app/RecalledProduct.dart';

class SpotlightFilterView extends StatefulWidget {
  const SpotlightFilterView({Key? key}) : super(key: key);

  @override
  _SpotlightfilterviewState createState() => _SpotlightfilterviewState();
}

class _SpotlightfilterviewState extends State<SpotlightFilterView> {
  var keyText = "";
  var manText = "";
  var distText = "";
  var hazVal = "-";
  var catVal = "-";
  Color mainColor = const Color.fromARGB(255, 153, 0, 0);

  DateTime selectedDateStart = DateTime.now();
  DateTime selectedDateEnd = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1973, 6, 8),
        lastDate: DateTime.now(),
        helpText: "Select Start Date",
        errorFormatText: "Enter a Valid Date",
        errorInvalidText: "Date Out of Range",
        builder: (context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
                colorScheme: ColorScheme.light(
                    primary: mainColor,
                    onPrimary: Colors.white,
                    onSurface: mainColor),
                textButtonTheme: TextButtonThemeData(
                    style: TextButton.styleFrom(primary: mainColor))),
            child: child!,
          );
        });
    if (picked != null && picked != selectedDateStart) {
      setState(() {
        selectedDateStart = picked;
      });
    }
  }

  Widget _keyWordSearch() {
    return Container(
      margin: const EdgeInsets.all(20),
      height: 70,
      child: TextFormField(
        style: TextStyle(color: mainColor),
        cursorColor: mainColor,
        onChanged: (newText) {
          setState(() {
            keyText = newText;
          });
        },
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          enabledBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: mainColor)),
          focusedBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: mainColor)),
          //border: UnderlineInputBorder(),
          labelText: 'Keyword Search',
          labelStyle: TextStyle(color: Color.fromARGB(255, 77, 77, 77)),
          hintText: 'Keywords',
        ),
      ),
    );
  }

  Widget _dropDownSearch(String label, List<String> list) {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 10),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(label,
                style: const TextStyle(
                    fontSize: 13, color: Color.fromARGB(255, 77, 77, 77))),
            SizedBox(
                // padding: const EdgeInsets.symmetric(
                //     horizontal: 10, vertical: 1),
                // decoration: BoxDecoration(
                //     color: Colors.white,
                //     borderRadius: BorderRadius.circular(10)),
                width: 160,
                //color: Colors.black,
                child: DropdownButton<String>(
                  isExpanded: true,
                  alignment: const Alignment(-0.7, 0),
                  value: hazVal,
                  icon: const Icon(
                    Icons.arrow_downward_rounded,
                  ),
                  iconSize: 12,
                  elevation: 16,
                  style: TextStyle(
                    color: mainColor,
                  ),
                  underline: Container(
                    height: 2,
                    color: mainColor,
                  ),
                  onChanged: (String? newValue) {
                    setState(() {
                      hazVal = newValue!;
                    });
                  },
                  items: list.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ))
          ]),
    );
  }

  Widget _datePicker(String label) {
    return Container(
      margin: const EdgeInsets.only(top: 20, bottom: 20, left: 20, right: 10),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(label, style: TextStyle(color: Colors.grey.shade600)),
            SizedBox(
                width: 160,
                child: OutlinedButton(
                  style: ButtonStyle(
                      side: MaterialStateProperty.all<BorderSide>(
                          BorderSide(color: mainColor, width: 1)),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.white60)),
                  child: const Text(
                    "mm/dd/yyyy",
                    style: TextStyle(color: Color.fromARGB(255, 100, 0, 0)),
                  ),
                  onPressed: () {
                    _selectDate(context);
                  },
                ))
          ]),
    );
  }

  Widget _businessKeySearch(String label) {
    return Container(
      margin: const EdgeInsets.only(bottom: 25, left: 20, right: 10, top: 20),
      width: 160,
      child: TextFormField(
        style: TextStyle(color: mainColor),
        cursorColor: mainColor,
        onChanged: (newText) {
          setState(() {
            manText = newText;
          });
        },
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: mainColor),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: mainColor),
            borderRadius: BorderRadius.circular(10),
          ),
          labelText: label,
          labelStyle: const TextStyle(color: Color.fromARGB(255, 77, 77, 77)),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: mainColor,
          title: const Text("Filter Results"),
        ),
        body: Container(
            color: Colors.grey.shade200,
            height: double.maxFinite,
            child: SingleChildScrollView(
                child: Container(
                    child: Column(children: <Widget>[
              Container(child: _keyWordSearch()),
              Row(
                children: <Widget>[
                  _dropDownSearch("Hazard Type",
                      <String>['-', 'Exploding', "Chemical Burns", 'Falling']),
                  _dropDownSearch("Category",
                      <String>['-', 'Baby Carriers', "Furniture", 'Toys'])
                ],
              ),
              Row(children: <Widget>[
                _datePicker("Start Date"),
                _datePicker("End Date"),
              ]),
              Row(
                children: <Widget>[
                  _businessKeySearch("Manufacturer"),
                  _businessKeySearch("Distributor"),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Container(
                      margin: EdgeInsets.only(right: 20, top: 10),
                      padding: EdgeInsets.all(8),
                      width: 150,
                      child: ElevatedButton(
                        child: Row(children: const <Widget>[
                          Icon(Icons.search),
                          Text("Search"),
                        ]),
                        onPressed: () {},
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(mainColor)),
                      ))
                ],
              )
            ])))));
  }
}
