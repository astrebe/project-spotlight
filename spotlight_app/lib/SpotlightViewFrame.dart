import "package:flutter/material.dart";

class SpotlightViewFrame extends StatefulWidget {
  const SpotlightViewFrame({Key? key}) : super(key: key);

  @override
  _SpotlightViewFrameState createState() => _SpotlightViewFrameState();
}

class _SpotlightViewFrameState extends State<SpotlightViewFrame> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("All Recall Products"),
      ),
      body: Column(
        children: <Widget>[
          const Padding(padding: EdgeInsets.symmetric(horizontal: 10, vertical: 30),
          child:Text("Recall Stage")),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding (padding: const EdgeInsets.symmetric(horizontal: 30), 
                child:ElevatedButton(
                  onPressed: () {}, 
                  child: const Text("Filter"),
                ),
              ),
              
              Padding (padding: const EdgeInsets.symmetric(horizontal: 30), 
                child:ElevatedButton(
                  onPressed: () {}, 
                  child: const Text("Search") 
                ),
              ),
            ],
          ),
          Expanded(
            child: Container(),)
        ],
      )
    );
  }

}