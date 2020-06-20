

import 'package:flutter/material.dart';

class AddAccountBottomSheet extends StatefulWidget {
  @override
  _AddAccountBottomSheetState createState() => _AddAccountBottomSheetState();
}

class _AddAccountBottomSheetState extends State<AddAccountBottomSheet> {
  bool _showSecond = false;

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      backgroundColor: Colors.transparent,
      onClosing: () {},
      builder: (BuildContext context) {
        return Container(
          margin: EdgeInsets.all(20),
          decoration: BoxDecoration(color: ThemeData.dark().cardColor, borderRadius: BorderRadius.circular(30)),
          child: AnimatedCrossFade(
              firstChild: Container(
                padding: EdgeInsets.all(20),
                constraints: BoxConstraints.expand(height: MediaQuery.of(context).size.height - 200),
                child: Column(
                  children: <Widget>[
                    Spacer(),
                    Icon(Icons.account_circle),
                    TextField(),
                    TextField(),
                    TextField(),
                    Spacer(),
                    RaisedButton(
                      onPressed: () => setState(() => _showSecond = true),
                      padding: EdgeInsets.all(15),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("Add account"),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              secondChild: Container(
                constraints: BoxConstraints.expand(height: MediaQuery.of(context).size.height / 3),
                padding: EdgeInsets.all(20),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: FloatingActionButton(
                    backgroundColor: Colors.green,
                    onPressed: () => setState(() => _showSecond = false),
                    child: Icon(
                      Icons.check,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              crossFadeState: _showSecond ? CrossFadeState.showSecond : CrossFadeState.showFirst,
              duration: Duration(milliseconds: 250)),
//          duration: Duration(milliseconds: 300),
        );
      },
    );
  }
}
