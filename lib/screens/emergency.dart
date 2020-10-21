import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
class EmergencyNumbers extends StatefulWidget {
  @override
  _EmergencyNumbersState createState() => _EmergencyNumbersState();
}

class _EmergencyNumbersState extends State<EmergencyNumbers> {
  TextEditingController c1;
  @override
  void initState() {
    c1=new TextEditingController();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    
    
    return Scaffold(
      body: SingleChildScrollView(
              child: Container(
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
                        Center(
                            child: Text("Emergency Numbers",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.bold,
                                ))),
                        SizedBox(height: 50),
                        InkWell(
                          onTap: (){
                                call();
                          },
                          child: Container(
                            child: Row(
                              children:<Widget>[
                                  SizedBox(width:20),
                                  Container(
                                    child:Text("Police Helpline Number ",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ))
                                  ),
                                  Spacer(),
                                   
                            Container(
                              child: Icon(
                                Icons.phone,
                                color: Colors.white,
                              ),
                              // SizedBox()
                            ),
                            SizedBox(width:20)
                              ]
                            ),
                              height: 50,
                              decoration: BoxDecoration(
                                // color: Colors.white,
                                gradient: LinearGradient(
                                  colors: [Color(0xffD32222), Color(0xffE6582E)],
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                ),
                                borderRadius: BorderRadius.circular(50),
                                //color:Colors.white
                              )),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        InkWell(
                           onTap: (){
                            
                          },
                          child: Container(
                            child: Row(
                              children:<Widget>[
                                  SizedBox(width:20),
                                  Container(
                                    child:Text("Mumbai Railway Police",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ))
                                  ),
                                  Spacer(),
                                   
                            Container(
                              child: Icon(
                                Icons.phone,
                                color: Colors.white,
                              ),
                              // SizedBox()
                            ),
                            SizedBox(width:20)
                              ]
                            ),
                              height: 50,
                              decoration: BoxDecoration(
                                // color: Colors.white,
                                gradient: LinearGradient(
                                  colors: [Color(0xffD32222), Color(0xffE6582E)],
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                ),
                                borderRadius: BorderRadius.circular(50),
                                //color:Colors.white
                              )),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        InkWell(
                           onTap: (){
                            
                          },
                          child: Container(
                            child: Row(
                              children:<Widget>[
                                  SizedBox(width:20),
                                  Container(
                                    child:Text("Maharashtra Women Comm.",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ))
                                  ),
                                  Spacer(),
                                   
                            Container(
                              child: Icon(
                                Icons.phone,
                                color: Colors.white,
                              ),
                              // SizedBox()
                            ),
                            SizedBox(width:20)
                              ]
                            ),
                              height: 50,
                              decoration: BoxDecoration(
                                // color: Colors.white,
                                gradient: LinearGradient(
                                  colors: [Color(0xffD32222), Color(0xffE6582E)],
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                ),
                                borderRadius: BorderRadius.circular(50),
                                //color:Colors.white
                              )),
                        ),
                         SizedBox(
                          height: 30,
                        ),
                        InkWell(
                           onTap: (){
                            
                          },
                          child: Container(
                            child: Row(
                              children:<Widget>[
                                  SizedBox(width:20),
                                  Container(
                                    child:Text("Maharashtra Women helpline",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ))
                                  ),
                                  Spacer(),
                                   
                            Container(
                              child: Icon(
                                Icons.phone,
                                color: Colors.white,
                              ),
                              // SizedBox()
                            ),
                            SizedBox(width:20)
                              ]
                            ),
                              height: 50,
                              decoration: BoxDecoration(
                                // color: Colors.white,
                                gradient: LinearGradient(
                                  colors: [Color(0xffD32222), Color(0xffE6582E)],
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                ),
                                borderRadius: BorderRadius.circular(50),
                                //color:Colors.white
                              )),
                        ),
                         SizedBox(
                          height: 30,
                        ),
                        InkWell(
                           onTap: (){
                            
                          },
                          child: Container(
                            child: Row(
                              children:<Widget>[
                                  SizedBox(width:20),
                                  Container(
                                    child:Text("MAJLIS-Maharashtra",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ))
                                  ),
                                  Spacer(),
                                   
                            Container(
                              child: Icon(
                                Icons.phone,
                                color: Colors.white,
                              ),
                              // SizedBox()
                            ),
                            SizedBox(width:20)
                              ]
                            ),
                              height: 50,
                              decoration: BoxDecoration(
                                // color: Colors.white,
                                gradient: LinearGradient(
                                  colors: [Color(0xffD32222), Color(0xffE6582E)],
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                ),
                                borderRadius: BorderRadius.circular(50),
                                //color:Colors.white
                              )),
                        ),
                         SizedBox(
                          height: 30,
                        ),
                        InkWell(
                           onTap: (){
                            
                          },
                          child: Container(
                            child: Row(
                              children:<Widget>[
                                  SizedBox(width:20),
                                  Container(
                                    child:Text("Women Helpline(Domestic)",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ))
                                  ),
                                  Spacer(),
                                   
                            Container(
                              child: Icon(
                                Icons.phone,
                                color: Colors.white,
                              ),
                              // SizedBox()
                            ),
                            SizedBox(width:20)
                              ]
                            ),
                              height: 50,
                              decoration: BoxDecoration(
                                // color: Colors.white,
                                gradient: LinearGradient(
                                  colors: [Color(0xffD32222), Color(0xffE6582E)],
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                ),
                                borderRadius: BorderRadius.circular(50),
                                //color:Colors.white
                              )),
                        ),
                        SizedBox(height:20),
                        Center(
                          child: Text("OR",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                )),
                        ),
                        SizedBox(height: 20,),
                        Container(
                      margin: EdgeInsets.all(5),
                        padding: EdgeInsets.only(left: 20),
                        child: Center(
                          child: TextField(controller: c1,
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                hintText: "Enter phone no",
                                hintStyle: TextStyle(color: Colors.white)),
                            onChanged: (value) {
                              //this.phoneNo = value;
                            },
                          ),
                        ),
                        height: 50,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(50),
                          //color:Colors.white
                        )),
                        SizedBox(height: 10,),
                        InkWell(
                      onTap: () {
                        call2();
                      },
                      child: Container(
                          child: Center(
                              child: Text("Call",
                                  style: TextStyle(
                                    // color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ))),
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(50),
                            //color:Colors.white
                          )),
                    ),

                      ],
                    ))))),
      ),
    );
  }
  call(){
    String phoneno="tel:"+"100";
    launch(phoneno);
  }
  call2(){
    String dial="tel:"+c1.text;
    launch(dial);
  }
}
