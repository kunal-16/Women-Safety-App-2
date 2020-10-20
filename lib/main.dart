import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:safety_app/services/authservice.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AuthService().handleAuth(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String phoneNo;
  String smsCode;
  String verificationId;

  bool codeSent = false;

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
                gradient: LinearGradient(begin: Alignment.bottomRight, colors: [
              Colors.black.withOpacity(.9),
              Colors.black.withOpacity(.4)
            ])),
            child: Padding(
              padding: EdgeInsets.all(30),
              child: ListView(
                reverse: true,

                //crossAxisAlignment: CrossAxisAlignment.start,
                //mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  //Container(height: 100,),
                  Center(
                      child: Container(
                    padding: EdgeInsets.all(120),
                    height: 250,
                    width: 250,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/logo.png'))),
                  )),
                  SizedBox(height: 30),
                  Text('Your safety, our lookout!',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold)),
                  SizedBox(height: 30),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Register yourself and ensure your safety',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'wherever you go',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),

                  SizedBox(height: 40),




//Text Field

                  Container(
                    margin: EdgeInsets.all(5),
                      padding: EdgeInsets.only(left: 20),
                      child: Center(
                        child: TextField(
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
                            this.phoneNo = value;
                          },
                        ),
                      ),
                      height: 50,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(50),
                        //color:Colors.white
                      )),

                  codeSent
                      ? Container(
                        margin: EdgeInsets.all(5),
                          padding: EdgeInsets.only(left: 20),
                          child: Center(
                            child: TextField(
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  disabledBorder: InputBorder.none,
                                  hintText: "OTP",
                                  hintStyle: TextStyle(color: Colors.white)),
                              onChanged: (value) {
                                this.smsCode = value;
                              },
                            ),
                          ),
                          height: 50,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(50),
                            //color:Colors.white
                          ))
                      : Container(),

                  SizedBox(
                    height: 20,
                  ),


//Button
                  InkWell(
                    onTap: () {
                      codeSent
                          ? AuthService().signInWithOTP(smsCode, verificationId)
                          : verifyPhone(phoneNo);
                    },
                    child: Container(
                        child: Center(
                            child: codeSent
                                ? Text("Login",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ))
                                : Text("Verify",
                                    style: TextStyle(
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

                  //child: codeSent ? Text("Login") : Text("Verify"),
                ].reversed.toList(),
              ),
            )),
      ),
    );
  }

//Verification
  Future<void> verifyPhone(phoneNo) async {
    final PhoneVerificationCompleted verified = (AuthCredential authResult) {
      AuthService().signIn(authResult);
    };

    final PhoneVerificationFailed verificationFailed =
        (AuthException exception) {
      print(exception.message);
    };

    final PhoneCodeSent smsSent = (String verId, [int forceResend]) {
      this.verificationId = verId;
      setState(() {
        this.codeSent = true;
      });
    };

    final PhoneCodeAutoRetrievalTimeout autoTimeout = (String verId) {
      this.verificationId = verId;
    };

    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phoneNo,
        timeout: const Duration(seconds: 5),
        verificationCompleted: verified,
        verificationFailed: verificationFailed,
        codeSent: smsSent,
        codeAutoRetrievalTimeout: autoTimeout);
  }
}





