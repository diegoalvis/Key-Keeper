import 'package:flutter/material.dart';

class AddAccountBottomSheet extends StatefulWidget {
  @override
  _AddAccountBottomSheetState createState() => _AddAccountBottomSheetState();
}

class _AddAccountBottomSheetState extends State<AddAccountBottomSheet> {
  bool _showSecond = false;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      backgroundColor: Colors.transparent,
      onClosing: () {},
      builder: (BuildContext context) {
        return Container(
          margin: EdgeInsets.all(16),
          decoration: BoxDecoration(color: ThemeData.dark().cardColor, borderRadius: BorderRadius.circular(30)),
          child: AnimatedCrossFade(
              firstChild: Container(
                padding: EdgeInsets.all(12),
                constraints: BoxConstraints.expand(height: MediaQuery.of(context).size.height - 200),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Icon(Icons.lock_outline),
                      TextFormField(
                        decoration: InputDecoration(border: OutlineInputBorder(), labelText: "Name", hintText: 'i.e. Gmail, Amazon, iCloud, Netflix...'),
                        textCapitalization: TextCapitalization.sentences,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        decoration: InputDecoration(border: OutlineInputBorder(), labelText: "User", hintText: 'john@example.com'),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        decoration: InputDecoration(border: OutlineInputBorder(), labelText: "Password"),
                        obscureText: true,
                        keyboardType: TextInputType.visiblePassword,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                      RaisedButton(
                        onPressed: () => validateNewAccountSubmit(context),
                        padding: EdgeInsets.all(15),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
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
              ),
              secondChild: Container(
                constraints: BoxConstraints.expand(height: MediaQuery.of(context).size.height / 3),
                padding: EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text("Great!", style: Theme.of(context).textTheme.headline5),
                    Text("A new account has been added to your list."),
                    SizedBox(height: 20),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: FloatingActionButton(
                        backgroundColor: Colors.green,
                        onPressed: () => Navigator.pop(context),
                        child: Icon(Icons.check, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
              crossFadeState: !_showSecond ? CrossFadeState.showSecond : CrossFadeState.showFirst,
              duration: Duration(milliseconds: 250)),
        );
      },
    );
  }

  void validateNewAccountSubmit(BuildContext context) {
    if (_formKey.currentState.validate()) {
      setState(() => _showSecond = true);
    } else {
      Scaffold.of(context).showSnackBar(SnackBar(content: Text('Processing Data')));
    }
  }
}
