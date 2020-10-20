import 'dart:ffi';

import "package:flutter/material.dart";
import 'package:safety_app/screens/dashboard.dart';
import '../services/storage.dart';
import '../models/contactModel.dart';
import 'dart:async';

class ContactList extends StatefulWidget {
  @override
  _ContactListState createState() => _ContactListState();
}

class _ContactListState extends State<ContactList> {
  final TextEditingController newContactField = new TextEditingController();
  // Map<String, String> newContact = {};
  // getContact() async {
  //   final contactData = await Storage.db.getContact();
  //   return contactData;
  // }

  Future<List<ContactModel>> contacts;
  String number;
  var dbHelper;
  bool isUpdating;
  final formKey = new GlobalKey<FormState>();

  void initState() {
    super.initState();
    dbHelper = Storage();
    isUpdating = false;
    refreshList();
  }

  refreshList() {
    setState(() {
      contacts = dbHelper.getContacts();
    });
  }

  validate() {
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      ContactModel c = ContactModel(number);
      dbHelper.save(c);
      refreshList();
      newContactField.clear();
    }
  }

  Container numberTable(List<ContactModel> contacts) {
    return Container(
      // scrollDirection: Axis.vertical,
      child: DataTable(
        columns: [
          DataColumn(
            label: Text("Phone Numbers", style:TextStyle(color:Colors.white, fontSize:24)),
          ),
          DataColumn(
            label: Text(""),
          ),
        ],
        rows: contacts
            .map(
              (contact) => DataRow(cells: [
                DataCell(
                  Text(contact.number, style:TextStyle(color:Colors.white, fontSize:20)),
                ),
                DataCell(IconButton(
                    icon: Icon(Icons.delete, color: Colors.white,),
                    onPressed: () {
                      dbHelper.delete(contact.number);
                      refreshList();
                    })),
              ]),
            )
            .toList(),
      ),
    );
  }

  list() {
    return Expanded(
      child: FutureBuilder(
        future: contacts,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            print("hasdata");
            return numberTable(snapshot.data);
          }

          if (snapshot.data == null || snapshot.data.length == 0) {
            return Text("No Numbers Added");
          }
          print(snapshot.hasData);
          print("PROBLEMMM" + snapshot.data[0].number);

          return CircularProgressIndicator();
        },
      ),
    );
  }

  form() {
    return Form(
      key: formKey,
      child: Padding(
        padding: EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          verticalDirection: VerticalDirection.down,
          children: <Widget>[

            Container(
                    margin: EdgeInsets.all(5),
                      padding: EdgeInsets.only(left: 20),
                      child: Center(
                        child: TextFormField(
                          controller: newContactField,
              keyboardType: TextInputType.text,
              //decoration: InputDecoration(labelText: 'Enter Number'),
              validator: (val) => val.length == 0 ? 'Enter Number' : null,
              onSaved: (val) => number = val,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              hintText: "Enter phone no",
                              hintStyle: TextStyle(color: Colors.white)),
                         
                        ),
                      ),
                      height: 50,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(50),
                        //color:Colors.white
                      )),

                      SizedBox(height:20),








            // TextFormField(
            //   controller: newContactField,
            //   keyboardType: TextInputType.text,
            //   decoration: InputDecoration(labelText: 'Enter Number'),
            //   validator: (val) => val.length == 0 ? 'Enter Number' : null,
            //   onSaved: (val) => number = val,
            // ),




            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                InkWell(
                    onTap: validate,
                    child: Container(
                      width: 100,

                        child: Center(
                            child: 
                                 Text("Add",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ))
                                 ),
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(50),
                          //color:Colors.white
                        )),
                  )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<bool> onBackPressed() async {
    print("back pressed");

    // Navigator.push(
    //   context,
    //   MaterialPageRoute(builder: (context) => DashboardPage(contacts)),
    // );
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onBackPressed,
      child: Scaffold(
        
        body: Center(
          child: Container(
            decoration: BoxDecoration(
           
            image: DecorationImage(
                image: AssetImage('assets/images/back.jpg'),
                fit: BoxFit.cover)),
                      child: Container(
                         decoration: BoxDecoration(
              gradient: LinearGradient(begin: Alignment.bottomRight, colors: [
            Colors.black.withOpacity(.9),
            Colors.black.withOpacity(.4)
          ])),
              padding: EdgeInsets.all(20),
              child: SafeArea(
                              child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                
                    // FutureBuilder(
                    //   future: getContact(),
                    //   builder: (_, contactData) {
                    //     if (contactData == null) {
                    //       return Container();
                    //     }
                    //     switch (contactData.connectionState) {
                    //       case ConnectionState.none:
                    //       case ConnectionState.waiting:
                    //       case ConnectionState.active:
                    //       case ConnectionState.done:
                    //         if (!newContact.containsKey('number')) {
                    //           newContact = Map<String, String>.from(contactData.data);
                    //         }
                    //         return Container(
                    //           padding: EdgeInsets.all(10),
                    //           child: Text(newContact[0][0]),
                    //         );
                    //         // return ListView.builder(
                    //         //   itemCount: newContact.length,
                    //         //   itemBuilder: (BuildContext context, int index) {
                    //         //     return ListTile(
                    //         //       title: Text(newContact[index]),
                    //         //     );
                    //         //   },
                    //         // );
                    //     }
                    //     return Container();
                    //   },
                    // ),
                    // Text("Hello"),
                    // Expanded(child: Container()),
                    // Row(
                    //   children: <Widget>[
                    //     Flexible(
                    //       child: TextField(
                    //         controller: newContactField,
                    //       ),
                    //     ),
                    //     RaisedButton(
                    //       child: Text("Button"),
                    //       onPressed: () {
                    //         // var newContact =
                    //         //     ContactModel(newContactField.text.trim());
                    //         // Storage.db.newContact(newContact);
                    //       },
                    //     ),
                    //   ],
                    // ),

                    list(),
                    Expanded(child: Container()),
                    form(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
