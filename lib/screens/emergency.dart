import 'package:flutter/material.dart';

class EmergencyNumbers extends StatefulWidget {
  @override
  _EmergencyNumbersState createState() => _EmergencyNumbersState();
}

class _EmergencyNumbersState extends State<EmergencyNumbers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/back.jpg'),
                  fit: BoxFit.cover)),
          child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.bottomRight,
                      colors: [
                    Colors.black.withOpacity(.9),
                    Colors.black.withOpacity(.4)
                  ])),
              child: Padding(
                  padding: EdgeInsets.all(30),
                  child: Container(
                      child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 50,
                      ),
                      Container(
                          height: 50,
                         decoration: BoxDecoration(
                            // color: Colors.white,
                            gradient: LinearGradient(
                                begin: Alignment.bottomRight,
                                colors: [
                                  Colors.white10.withOpacity(.9),
                                  Colors.white.withOpacity(.4)
                                ]),
                            
                            borderRadius: BorderRadius.circular(50),
                            //color:Colors.white
                          )),
                      Divider(),
                      Container(
                          height: 50,
                          decoration: BoxDecoration(
                            // color: Colors.white,
                            gradient: LinearGradient(
                                begin: Alignment.bottomRight,
                                colors: [
                                  Colors.white10.withOpacity(.9),
                                  Colors.white.withOpacity(.4)
                                ]),
                            
                            borderRadius: BorderRadius.circular(50),
                            //color:Colors.white
                          )),
                    ],
                  ))))),
    );
  }
}
