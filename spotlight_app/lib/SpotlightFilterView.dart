import "package:flutter/material.dart";
import 'package:spotlight_app/SpotlightViewFrame.dart';

class SpotlightFilterView extends StatefulWidget {
  const SpotlightFilterView({Key? key, required this.hazards, required this.categories}) : super(key: key);

  final List<String> hazards;
  final List<String> categories;

  

  @override
  _SpotlightfilterviewState createState() => _SpotlightfilterviewState();
}

class _SpotlightfilterviewState extends State<SpotlightFilterView> {

  final filterFormKey = GlobalKey<FormState>();

  //Because the government database seemingly no longer tracks the actual value of hazards these
  //are the hard coded search options on their website. Hazards is still calculated in the DB
  //in case they ever add it back?

  List<String> hazardsHardCoded = [
    "-", "Chemical Burn", "Chemical Ingestion", "Electrocution", "Heat-Related Explosion", 
    "Smoke Inhalation", "Chemical Explosion", "Electrical Smoke", "Checmical Fire", 
    "Electrical Shock", "Electrical Burn", "Electrical Overheating", "Other Heavy Metals", 
    "Electrical Fire", "Pain", "Poisoning", "Pinching", "Physical", "Lead", "Impact", 
    "Heat-Related", "Ingestion", "Injury", "Inhalation", "Projectile", "Scalding", "Tip Over", 
    "Suffocation", "Friction Burn", "Safety Equipment Malfunction", "Shorting", "Sparking", "Struck by", 
    "Roll Over", "Falling", "Choking", "Chemical", "Collapse", "Collision", "Crash", "Concussions", 
    "Carbon Monoxide", "Cadminium Poisoning", "Arcing", "Amputation", "Asphyxiation", "Aspiration", 
    "Burn", "Bruising", "Crushing", "Cuts", "Entaglement", "Entrapment", "Explosion", 
    "Fire", "Allergic Reaction", "Ejection", "Drowning", "Electrical", "Flame-Retardant Chemicals"
  ];

  var keyText = "";
  var manText = "";
  var retText = "";
  var hazVal = "-";
  var catVal = "-";
  var startInteracted = false;
  var endInteracted = false;
  DateTime now = DateTime.now();
  DateTime selectedDateStart = DateTime.now();  
  DateTime selectedDateEnd = DateTime.now(); 

  Color mainColor = const Color.fromARGB(255, 153, 0, 0);

  @override
  void initState() {
    super.initState();
    selectedDateStart = DateTime(now.year, now.month, now.day);
    selectedDateEnd = DateTime(now.year, now.month, now.day);
  }

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
        retText = value;
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
          hintText: 'Keywords in Title',
        ),
      ),
    );
  }

  Widget _dropDownSearch(String label, List<String> list, int formNum) {
    hazardsHardCoded.sort();

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
          onPressed: () {
            //TODO: Validate Data
            Navigator.push(context, MaterialPageRoute(builder: (context) => SpotlightViewFrame(dbURL: _createURLExtension(),)));
          },
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(mainColor)),
        ));
  }

  String _createURLExtension() {
    DateTime curDate = DateTime(now.year, now.month, now.day);
    String url = "";

    if(keyText != "") {
      url += "&RecallTitle=$keyText";
    }
    if (manText != "") {
      url+= "&Manufacturer=$manText";
    }
    if (retText != "") {
      url+= "&Retailer=$retText";
    }
    if(selectedDateStart != curDate) {
      url+= "&RecallDateStart=${selectedDateStart.year}-${selectedDateStart.month}-${selectedDateStart.day}";
    }
    if(selectedDateEnd != curDate) {
      url+= "&RecallDateEnd=${selectedDateEnd.year}-${selectedDateEnd.month}-${selectedDateEnd.day}";
    }
    if(hazVal != "-") {
      url+="&HazardType=$hazVal";
    }
    if(catVal != "-") {
      url+="ProductType=$catVal";
    }

    print(url);
    return url;
  }

  Widget _clearButton() {
    return Container(
      margin: const EdgeInsets.only(right: 50, top: 10),
      padding: const EdgeInsets.all(8),
      width: 150,
      child: ElevatedButton(
      onPressed: () {
        setState(() {
          filterFormKey.currentState!.reset();
          keyText = "";
        manText = "";
        retText = "";
        hazVal = "-";
        catVal = "-";
        startInteracted = false;
        endInteracted = false;
        selectedDateStart = DateTime.now();
        selectedDateEnd = DateTime.now();
        });
      }, 
      child: Text("Clear"),
      style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(mainColor)),),
    );
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
            body: 
            Form (
              key: filterFormKey,
              child:Container(
                color: Colors.grey.shade200,
                height: double.maxFinite,
                child: SingleChildScrollView(
                    child: Column(children: <Widget>[
                  Container(child: _keyWordSearch()),
                  Row(
                    children: <Widget>[
                      _dropDownSearch(
                          "Hazard Type",
                          hazardsHardCoded,
                          2),
                      _dropDownSearch(
                          "Category",
                          widget.categories,
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
                      _businessKeySearch("Retailer", 7),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[_clearButton(), _searchButton(), ],
                  )
                ]))),
              )
          )
    );
  }
}