import 'package:challenge/size_config.dart';
import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> with SingleTickerProviderStateMixin{
  late TextEditingController _tfController;

  @override
  void initState() {
    super.initState();
    // Start listening to changes.
    _tfController = TextEditingController(text: ' ');
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the widget tree.
    super.dispose();
    _tfController.dispose();
  }
  bool visibility=false;
  Future<double> get _width => Future<double>.value(SizeConfig.safeBlockHorizontal*100);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double safeBlockHorizontal = SizeConfig.safeBlockHorizontal;
    double safeBlockVertical = SizeConfig.safeBlockVertical;
    final borderWidth = safeBlockHorizontal*0.4;
    final containerWidth=safeBlockHorizontal * 1.1;
    final borderRadius = safeBlockHorizontal * 10;
    
    //controller.animateWith(simulation)
    return FutureBuilder<double>(
        future: _width,
        initialData: safeBlockHorizontal*15,
        builder: (context, snapshot) {
          return AnimatedContainer(
              duration: Duration(seconds: 2),
              width: snapshot.data,
              child: Padding(
                padding: EdgeInsets.fromLTRB(
                    safeBlockHorizontal * 5, 0, safeBlockHorizontal * 5, 0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(borderRadius),
                    // Creates border
                    border: Border.all(
                      color: Colors.orangeAccent,
                      width: containerWidth,
                    ),
                  ),
                  child: TextField(
                    controller: _tfController,
                    onSubmitted: (_) {
                      setState(() {
                        visibility = true;
                      });
                    },
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      //hintText: "Search for items by name or date",
                      hintStyle: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                            Radius.circular(borderRadius)),
                        borderSide: BorderSide(
                            color: Colors.black, width: borderWidth),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                            Radius.circular(borderRadius)),
                        borderSide: BorderSide(
                            color: Colors.black, width: borderWidth
                        ),
                      ),
                      filled: true,
                      fillColor: Colors.orangeAccent,
                      suffixIcon: Visibility(visible: visibility,
                          child: Icon(
                            Icons.arrow_forward, color: Colors.black,)),
                    ),
                  ),
                ),
              )
          );
        }
    );
  }
}
