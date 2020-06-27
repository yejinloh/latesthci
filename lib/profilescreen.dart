import 'package:unique/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:toast/toast.dart';
import 'package:recase/recase.dart';
//import 'package:flutter_cache_manager/flutter_cache_manager.dart';
//import 'dart:convert';
//import 'dart:io';

void main() => runApp(ProfileScreen());

class ProfileScreen extends StatefulWidget {
  final User user;

  const ProfileScreen({Key key, this.user}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  double screenHeight, screenWidth;
  final f = new DateFormat('dd-MM-yyyy hh:mm a');
  var parsedDate;
  String server = "https://yjjmappflutter.com/Unique";

  @override
  void initState() {
    super.initState();
    print("profile screen");
  }

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    //parsedDate = DateTime.parse(widget.user.datereg);

    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        backgroundColor: Colors.yellow[100],
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          title: Text('User Profile'),
          backgroundColor: Colors.yellow[800],
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.yellowAccent, Colors.deepOrangeAccent]),
                ),
                child: Container(
                    width: double.infinity,
                    height: screenHeight / 5,
                    child: Center(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            CircleAvatar(
                              backgroundImage: NetworkImage(
                                "https://www.pngitem.com/pimgs/m/108-1083736_transparent-discord-icon-png-discord-profile-png-download.png",
                              ),
                              radius: 40.0,
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              widget.user.name,
                              style: TextStyle(
                                fontSize: 22.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ]),
                    )),
              ),
              Container(
                  color: Colors.white,
                  padding: EdgeInsets.all(10.0),
                  margin:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.email,
                        color: Colors.orange,
                      ),
                      SizedBox(width: 20.0),
                      Text(
                        widget.user.email,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.orangeAccent,
                        ),
                      ),
                    ],
                  )),
              Container(
                  color: Colors.white,
                  padding: EdgeInsets.all(10.0),
                  margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 25.0),
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.phone,
                        color: Colors.orange,
                      ),
                      SizedBox(width: 20.0),
                      Text(
                        widget.user.phone,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.orangeAccent,
                        ),
                      ),
                    ],
                  )),
              /* Container(
                  color: Colors.white,
                  padding: EdgeInsets.all(10.0),
                  margin: EdgeInsets.symmetric(vertical:5.0, horizontal: 25.0 ),
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.date_range,
                        color: Colors.orange,
                      ),
                      SizedBox(width:20.0),
                      Text(f.format(parsedDate), style: TextStyle(
                         fontWeight: FontWeight.bold,
                                              fontSize: 14,
                        color: Colors.orangeAccent,
                      ),),
                    ],)
                )*/
              // SizedBox(height: 10.0),
              Container(
                //color: Colors.white,
                padding: EdgeInsets.all(10.0),
                margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 25.0),

                child: Column(
                  children: <Widget>[
                    Divider(
                      height: 2,
                      color: Colors.orangeAccent,
                    ),
                    Text(
                      "UPDATE YOUR PROFILE",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Divider(
                      height: 2,
                      color: Colors.orangeAccent,
                    ),
                  ],
                ),
              ),
              Container(
                //padding: EdgeInsets.all(5.0),
                margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                child: Row(
                  children: <Widget>[
                    RawMaterialButton(
                      onPressed: changeName,
                      elevation: 2.0,
                      fillColor: Colors.orange,
                      child: Icon(
                        Icons.person,
                        size: 20.0,
                        color: Colors.white,
                      ),
                      padding: EdgeInsets.all(15.0),
                      shape: CircleBorder(),
                    ),
                    Text(
                      "Change your username",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                //padding: EdgeInsets.all(5.0),
                margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                child: Row(
                  children: <Widget>[
                    RawMaterialButton(
                      onPressed: changePassword,
                      elevation: 2.0,
                      fillColor: Colors.orange,
                      child: Icon(
                        Icons.lock,
                        size: 20.0,
                        color: Colors.white,
                      ),
                      padding: EdgeInsets.all(15.0),
                      shape: CircleBorder(),
                    ),
                    Text(
                      "Change your password",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                //padding: EdgeInsets.all(5.0),
                margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                child: Row(
                  children: <Widget>[
                    RawMaterialButton(
                      onPressed: changePhone,
                      elevation: 2.0,
                      fillColor: Colors.orange,
                      child: Icon(
                        Icons.phone,
                        size: 20.0,
                        color: Colors.white,
                      ),
                      padding: EdgeInsets.all(15.0),
                      shape: CircleBorder(),
                    ),
                    Text(
                      "Change your phone",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<bool> _onBackPressed() {
    return showDialog(
          context: context,
          builder: (context) => new AlertDialog(
            title: new Text('Are you sure?',
                style: TextStyle(
                  color: Colors.yellow[900],
                )),
            content: new Text('Do you want to exit an App?'),
            actions: <Widget>[
              MaterialButton(
                  onPressed: () {
                    SystemChannels.platform.invokeMethod('SystemNavigator.pop');
                  },
                  child: Text("Exit",
                      style: TextStyle(
                        color: Colors.yellow,
                      ))),
              MaterialButton(
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                  child: Text("Cancel",
                      style: TextStyle(
                        color: Colors.yellow,
                      ))),
            ],
          ),
        ) ??
        false;
  }

  void changeName() {
    TextEditingController nameController = TextEditingController();
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
              title: new Text(
                "Change your name?",
               
              ),
              content: new TextField(
                 
                  controller: nameController,
                  decoration: InputDecoration(
                    labelText: 'Name',
                    icon: Icon(
                      Icons.person,
                      color: Colors.orange,
                    ),
                  )),
              actions: <Widget>[
                new FlatButton(
                    child: new Text(
                      "Yes",
                      style: TextStyle(
                        color: Colors.orange,
                      ),
                    ),
                    onPressed: () =>
                        _changeName(nameController.text.toString())),
                new FlatButton(
                  child: new Text(
                    "No",
                    style: TextStyle(
                      color: Colors.orange,
                    ),
                  ),
                  onPressed: () => {Navigator.of(context).pop()},
                ),
              ]);
        });
  }

  _changeName(String name) {
    if (name == "" || name == null) {
      Toast.show("Please enter your new name", context,
          duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
      return;
    }
    ReCase rc = new ReCase(name);
    print(rc.titleCase.toString());
    http.post(server + "/php/updateProfile.php", body: {
      "email": widget.user.email,
      "name": rc.titleCase.toString(),
    }).then((res) {
      if (res.body == "success") {
        print('in success');

        setState(() {
          widget.user.name = rc.titleCase;
        });
        Toast.show("Success", context,
            duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
        Navigator.of(context).pop();
        return;
      } else {}
    }).catchError((err) {
      print(err);
    });
  }

  void changePassword() {
    TextEditingController passController = TextEditingController();
    TextEditingController pass2Controller = TextEditingController();
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
              title: new Text(
                "Change your password?",
                
              ),
              content: new Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  TextField(
                      
                      controller: passController,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Old Password',
                        icon: Icon(
                          Icons.lock,
                          color: Colors.orange,
                        ),
                      )),
                  TextField(
                      
                      obscureText: true,
                      controller: pass2Controller,
                      decoration: InputDecoration(
                        labelText: 'New Password',
                        icon: Icon(
                          Icons.lock,
                          color: Colors.orange,
                        ),
                      )),
                ],
              ),
              actions: <Widget>[
                new FlatButton(
                    child: new Text(
                      "Yes",
                      style: TextStyle(
                        color: Colors.orange,
                      ),
                    ),
                    onPressed: () => updatePassword(
                        passController.text, pass2Controller.text)),
                new FlatButton(
                  child: new Text(
                    "No",
                    style: TextStyle(
                      color: Colors.orange,
                    ),
                  ),
                  onPressed: () => {Navigator.of(context).pop()},
                ),
              ]);
        });
  }

  updatePassword(String pass1, String pass2) {
    if (pass1 == "" || pass2 == "") {
      Toast.show("Please enter your password", context,
          duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
      return;
    }

    http.post(server + "/php/updateProfile.php", body: {
      "email": widget.user.email,
      "oldpassword": pass1,
      "newpassword": pass2,
    }).then((res) {
      if (res.body == "success") {
        print('in success');
        setState(() {
          widget.user.password = pass2;
        });
        Toast.show("Success", context,
            duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
        Navigator.of(context).pop();
        return;
      } else {}
    }).catchError((err) {
      print(err);
    });
  }

  void changePhone() {
    TextEditingController phoneController = TextEditingController();
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
              title: new Text(
                "Change your name?",
               
              ),
              content: new TextField(
                 
                  controller: phoneController,
                  decoration: InputDecoration(
                    labelText: 'New Phone Number',
                    icon: Icon(
                      Icons.phone,
                      color: Colors.orange,
                    ),
                  )),
              actions: <Widget>[
                new FlatButton(
                    child: new Text(
                      "Yes",
                      style: TextStyle(
                        color: Colors.orange,
                      ),
                    ),
                    onPressed: () =>
                        _changePhone(phoneController.text.toString())),
                new FlatButton(
                  child: new Text(
                    "No",
                    style: TextStyle(
                      color: Colors.orange,
                    ),
                  ),
                  onPressed: () => {Navigator.of(context).pop()},
                ),
              ]);
        });
  }

  _changePhone(String phone) {
    if (phone == "" || phone == null || phone.length < 9) {
      Toast.show("Please enter your new phone number", context,
          duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
      return;
    }
    http.post(server + "/php/updateProfile.php", body: {
      "email": widget.user.email,
      "phone": phone,
    }).then((res) {
      if (res.body == "success") {
        print('in success');

        setState(() {
          widget.user.phone = phone;
        });
        Toast.show("Success", context,
            duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
        Navigator.of(context).pop();
        return;
      } else {}
    }).catchError((err) {
      print(err);
    });
  }
}
