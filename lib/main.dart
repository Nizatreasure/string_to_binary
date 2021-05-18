import 'package:flutter/material.dart';
import 'package:string_to_binary/developer.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ConvertString(),
    theme: ThemeData(
      accentColor: Colors.brown[400],
    ),
  ));
}

class ConvertString extends StatefulWidget {
  @override
  _ConvertStringState createState() => _ConvertStringState();
}

class _ConvertStringState extends State<ConvertString> {
  bool showResult = false;
  bool showConvert = false;
  String value;
  List binaryRep;
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null)
          currentFocus.focusedChild.unfocus();
      },
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: Colors.brown[300],
        appBar: AppBar(
          backgroundColor: Colors.brown[500],
          title: Text(
            'String to Binary Converter',
            style: TextStyle(color: Colors.brown[200]),
          ),
          centerTitle: true,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.menu, color: Colors.brown[200]),
            onPressed: () {
              _scaffoldKey.currentState.openDrawer();
            },
          ),
        ),
        drawer: Drawer(
          child: Container(
            color: Colors.brown[300],
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Spacer(),
                SafeArea(
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Developer()));
                    },
                    child: Container(
                      height: 80,
                      width: double.infinity,
                      color: Colors.brown[400].withOpacity(0.4),
                      padding: EdgeInsets.only(left: 20),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'About Developer',
                        style: TextStyle(
                          color: Colors.brown[900],
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
                Spacer(flex: 2),
              ],
            ),
          ),
        ),
        body: ListView(
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.fromLTRB(20, 40, 20, 20),
              child: TextField(
                onChanged: (val) {
                  value = val;
                  if (val.trim().length > 0)
                    setState(() {
                      showConvert = true;
                    });
                  else
                    setState(() {
                      showConvert = false;
                    });
                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.brown[500])),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            BorderSide(color: Colors.brown[500], width: 3)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            BorderSide(color: Colors.brown[500], width: 3)),
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 12, vertical: 0),
                    hintText: 'Enter string to convert to binary',
                    hintStyle: TextStyle(color: Colors.brown[500])),
                cursorColor: Colors.brown[500],
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.brown[500],
                    fontWeight: FontWeight.w600),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: Align(
                alignment: Alignment.topRight,
                child: TextButton(
                  child: Text(
                    'Convert',
                    style: TextStyle(
                        color:
                            showConvert ? Colors.brown[200] : Colors.brown[300],
                        fontSize: 20),
                  ),
                  onPressed: showConvert
                      ? () {
                          binaryRep = binaryValues(value);
                          setState(() {
                            showResult = true;
                          });
                        }
                      : null,
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          showConvert ? Colors.brown[500] : Colors.brown[400])),
                ),
              ),
            ),
            if (showResult)
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: ListView(
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 30, 20, 0),
                      child: Align(
                          alignment: Alignment.topRight,
                          child: IconButton(
                            icon: Icon(
                              Icons.cancel_outlined,
                              size: 30,
                            ),
                            onPressed: () {
                              setState(() {
                                showResult = false;
                              });
                            },
                            color: Colors.brown[500],
                          )),
                    ),
                    Container(
                        width: double.infinity,
                        padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                            color: Colors.brown[400],
                            borderRadius: BorderRadius.circular(12)),
                        child: ListView.builder(
                            itemCount: binaryRep.length,
                            shrinkWrap: true,
                            physics: BouncingScrollPhysics(),
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.only(
                                    bottom: index != (binaryRep.length - 1)
                                        ? 10
                                        : 0),
                                child: Text(
                                  binaryRep[index],
                                  style: TextStyle(
                                      color: Colors.brown[100],
                                      fontSize: 18,
                                      letterSpacing: 1,
                                      wordSpacing: 5),
                                ),
                              );
                            }))
                  ],
                ),
              )
          ],
        ),
        resizeToAvoidBottomInset: false,
      ),
    );
  }

  List binaryValues(String f) {
    List<String> binaryName = [];
    List name = f.split(' ');
    for (int i = 0; i < name.length; i++) {
      if (name[i] != '') {
        List<int> binaryOutput = [];
        for (int j = 0; j < name[i].length; j++) {
          int decimalValue = name[i].codeUnitAt(j);
          int binaryValue = 0;
          int value = 1;

          while (decimalValue > 0) {
            binaryValue = binaryValue + (decimalValue % 2) * value;

            decimalValue = (decimalValue / 2).floor();

            value = value * 10;
          }

          binaryOutput.insert(j, binaryValue);
        }
        binaryName.add(binaryOutput.join());
      }
    }

    return binaryName;
  }
}
