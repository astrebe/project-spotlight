import "package:flutter/material.dart";

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
  var startInteracted = false;
  var endInteracted = false;

  DateTime selectedDateStart = DateTime.now();
  DateTime selectedDateEnd = DateTime.now();

  Color mainColor = const Color.fromARGB(255, 153, 0, 0);

  Future<void> _selectDate(BuildContext context, int formNum) async {
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
        _inputFormVal(formNum, picked);
      });
    }
  }

  void _inputFormVal(int form, var value) {
    try {
      if (form == 2) {
        hazVal = value;
      } else if (form == 3) {
        catVal = value;
      } else if (form == 4) {
        selectedDateStart = value;
      } else if (form == 5) {
        selectedDateEnd = value;
      } else if (form == 6) {
        manText = value;
      } else if (form == 7) {
        distText = value;
      } else {
        throw Exception("Form Number not Found");
      }
    } on FormatException {
      debugPrint("Wrong input val passed for Form");
    } catch (e) {
      debugPrint("$e");
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
          labelStyle: const TextStyle(color: Color.fromARGB(255, 77, 77, 77)),
          hintText: 'Keywords',
        ),
      ),
    );
  }

  Widget _dropDownSearch(String label, List<String> list, int formNum) {
    if (formNum != 2 && formNum != 3) {
      throw "_dropDownSearch: Invalid Form Num Passed.";
    }

    return Container(
      margin: const EdgeInsets.only(left: 20, right: 10),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(label,
                style: const TextStyle(
                    fontSize: 13, color: Color.fromARGB(255, 77, 77, 77))),
            SizedBox(
                width: 160,
                child: DropdownButton<String>(
                  isExpanded: true,
                  alignment: const Alignment(-0.7, 0),
                  value: formNum == 2 ? hazVal : catVal,
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
                      _inputFormVal(formNum, newValue!);
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

  Widget _datePicker(String label, int formNum) {
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
                  child: Text(
                    (() {
                      if (formNum == 4) {
                        if (startInteracted == true) {
                          return "${selectedDateStart.month}/${selectedDateStart.day}/${selectedDateStart.year}";
                        } else {
                          return "mm/dd/yyyy";
                        }
                      } else {
                        if (endInteracted == true) {
                          return "${selectedDateEnd.month}/${selectedDateEnd.day}/${selectedDateEnd.year}";
                        } else {
                          return "mm/dd/yyyy";
                        }
                      }
                    })(),
                    style:
                        const TextStyle(color: Color.fromARGB(255, 100, 0, 0)),
                  ),
                  onPressed: () {
                    if (formNum == 4) {
                      startInteracted = true;
                    } else {
                      endInteracted = true;
                    }
                    _selectDate(context, formNum);
                  },
                ))
          ]),
    );
  }

  Widget _businessKeySearch(String label, int formNum) {
    return Container(
      margin: const EdgeInsets.only(bottom: 25, left: 20, right: 10, top: 20),
      width: 160,
      child: TextFormField(
        style: TextStyle(color: mainColor),
        cursorColor: mainColor,
        onChanged: (newText) {
          setState(() {
            _inputFormVal(formNum, newText);
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

  Widget _searchButton() {
    return Container(
        margin: const EdgeInsets.only(right: 20, top: 10),
        padding: const EdgeInsets.all(8),
        width: 150,
        child: ElevatedButton(
          child: Row(children: const <Widget>[
            Icon(Icons.search),
            Text("Search"),
          ]),
          onPressed: () {},
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(mainColor)),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: mainColor,
              title: const Text("Filter Results"),
            ),
            body: Container(
                color: Colors.grey.shade200,
                height: double.maxFinite,
                child: SingleChildScrollView(
                    child: Column(children: <Widget>[
                  Container(child: _keyWordSearch()),
                  Row(
                    children: <Widget>[
                      _dropDownSearch(
                          "Hazard Type",
                          <String>[
                            '-',
                            'Exploding',
                            "Chemical Burns",
                            'Falling'
                          ],
                          2),
                      _dropDownSearch(
                          "Category",
                          <String>['-', 'Baby Carriers', "Furniture", 'Toys'],
                          3)
                    ],
                  ),
                  Row(children: <Widget>[
                    _datePicker("Start Date", 4),
                    _datePicker("End Date", 5),
                  ]),
                  Row(
                    children: <Widget>[
                      _businessKeySearch("Manufacturer", 6),
                      _businessKeySearch("Distributor", 7),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[_searchButton()],
                  )
                ])))));
  }
}
