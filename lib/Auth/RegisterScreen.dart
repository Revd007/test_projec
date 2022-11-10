import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RegisterScreen extends StatefulWidget {
  @override
  RegisterScreenState createState() => RegisterScreenState();
}

class RegisterScreenState extends State<RegisterScreen> {
  GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  final emailController = TextEditingController();
  final namaController = TextEditingController();
  final passController = TextEditingController();
  final passwController = TextEditingController();
  final eController = TextEditingController();
  bool isEmail = true;
  bool isPassword = true;
  bool isPasswordVisible = false;
  bool isGender = true;

  var gender;

  Widget buildLoginButton() {
    return Material(
        child: InkWell(
            onTap: () {},
            child: Container(
                width: MediaQuery.of(context).size.width,
                height: 45,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromARGB(255, 42, 65, 135)),
                alignment: Alignment.center,
                child: Text("Daftar",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600)))));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
            child: SingleChildScrollView(
                padding: EdgeInsets.all(30.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    SvgPicture.asset("assets/images/ic_back.svg",
                        width: 20, height: 20),
                    Text(
                      "PENDAFTARAN",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                    ),
                    Divider(),
                    RadioListTile(
                      title: Text("Male",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20)),
                      value: "male",
                      groupValue: gender,
                      onChanged: (value) {
                        setState(() {
                          gender = value.toString();
                        });
                      },
                    ),
                    RadioListTile(
                      title: Text("Female",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20)),
                      value: "female",
                      groupValue: gender,
                      onChanged: (value) {
                        setState(() {
                          gender = value.toString();
                        });
                      },
                    ),
                    Form(
                        key: formKey,
                        child: Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Row(children: [
                                  SvgPicture.asset("assets/images/ic_user.svg",
                                      width: 20, height: 20),
                                  Text("Nama Lengkap",
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 30, 42, 56),
                                          fontSize: 15,
                                          fontFamily: "Times New Roman")),
                                ])
                              ],
                            ),
                            SizedBox(height: 10),
                            Container(
                                height: 35,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                        width: 1, color: Colors.grey)),
                                child: TextFormField(
                                    textAlignVertical: TextAlignVertical.center,
                                    keyboardType: TextInputType.emailAddress,
                                    controller: namaController,
                                    validator: (value) {
                                      if (value?.length == 0) {
                                        setState(() {
                                          isEmail = false;
                                        });
                                      } else {
                                        setState(() {
                                          isEmail = true;
                                        });
                                      }
                                      return null;
                                    },
                                    style: TextStyle(
                                      color: Colors.black,
                                    ),
                                    decoration: InputDecoration(
                                        contentPadding: EdgeInsets.all(14.0)))),
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Row(children: [
                                  SvgPicture.asset("assets/images/ic_mail.svg",
                                      width: 20, height: 20),
                                  Text("Email Aktif",
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 30, 42, 56),
                                          fontSize: 15,
                                          fontFamily: "Times New Roman")),
                                ])
                              ],
                            ),
                            SizedBox(height: 10),
                            Container(
                                height: 35,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                        width: 1, color: Colors.grey)),
                                child: TextFormField(
                                    textAlignVertical: TextAlignVertical.center,
                                    keyboardType: TextInputType.emailAddress,
                                    controller: emailController,
                                    validator: (value) {
                                      if (value?.length == 0) {
                                        setState(() {
                                          isEmail = false;
                                        });
                                      } else {
                                        setState(() {
                                          isEmail = true;
                                        });
                                      }
                                      return null;
                                    },
                                    style: TextStyle(
                                      color: Colors.black,
                                    ),
                                    decoration: InputDecoration(
                                        contentPadding: EdgeInsets.all(14.0)))),
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Row(children: [
                                  SvgPicture.asset("assets/images/ic_call.svg",
                                      width: 20, height: 20),
                                  Text("No HP/WA",
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 30, 42, 56),
                                          fontSize: 15,
                                          fontFamily: "Times New Roman")),
                                ])
                              ],
                            ),
                            SizedBox(height: 5),
                            Container(
                                height: 35,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                        width: 1, color: Colors.grey)),
                                child: TextFormField(
                                    textAlignVertical: TextAlignVertical.center,
                                    keyboardType: TextInputType.number,
                                    validator: (value) {
                                      if (value?.length == 0) {
                                        setState(() {
                                          isEmail = false;
                                        });
                                      } else {
                                        setState(() {
                                          isEmail = true;
                                        });
                                      }
                                      return null;
                                    },
                                    style: TextStyle(
                                      color: Colors.black,
                                    ),
                                    decoration: InputDecoration(
                                        contentPadding: EdgeInsets.all(14.0)))),
                            SizedBox(height: 5),
                            SizedBox(height: 5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                SvgPicture.asset("assets/images/ic_lock.svg",
                                    width: 20, height: 20),
                                Text("Password",
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 30, 42, 56),
                                        fontSize: 15,
                                        fontFamily: "Times New Roman")),
                              ],
                            ),
                            SizedBox(height: 10),
                            Container(
                                height: 35,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                        width: 1, color: Colors.grey)),
                                child: TextFormField(
                                    obscureText: !isPasswordVisible,
                                    controller: passController,
                                    validator: (value) {
                                      if (value?.length == 0) {
                                        setState(() {
                                          isPassword = false;
                                        });
                                      } else {
                                        setState(() {
                                          isPassword = true;
                                        });
                                      }
                                      return null;
                                    },
                                    style: TextStyle(
                                      color: Colors.black,
                                    ),
                                    textAlignVertical: TextAlignVertical.center,
                                    decoration: InputDecoration(
                                        contentPadding: EdgeInsets.all(14.0),
                                        border: InputBorder.none,
                                        suffixIcon: IconButton(
                                            onPressed: () {
                                              setState(() {
                                                isPasswordVisible =
                                                    !isPasswordVisible;
                                              });
                                            },
                                            icon: Icon(
                                                isPasswordVisible
                                                    ? Icons.visibility
                                                    : Icons.visibility_off,
                                                size: 20,
                                                color: Colors.black))))),
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                SvgPicture.asset("assets/images/ic_lock.svg",
                                    width: 20, height: 20),
                                Text("Ulangi Password",
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 30, 42, 56),
                                        fontSize: 15,
                                        fontFamily: "Times New Roman")),
                              ],
                            ),
                            SizedBox(height: 10),
                            Container(
                                height: 35,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                        width: 1, color: Colors.grey)),
                                child: TextFormField(
                                    obscureText: !isPasswordVisible,
                                    controller: passwController,
                                    validator: (value) {
                                      if (value?.length == 0) {
                                        setState(() {
                                          isPassword = false;
                                        });
                                      } else {
                                        setState(() {
                                          isPassword = true;
                                        });
                                      }
                                      return null;
                                    },
                                    style: TextStyle(
                                      color: Colors.black,
                                    ),
                                    textAlignVertical: TextAlignVertical.center,
                                    decoration: InputDecoration(
                                        contentPadding: EdgeInsets.all(14.0),
                                        border: InputBorder.none,
                                        suffixIcon: IconButton(
                                            onPressed: () {
                                              setState(() {
                                                isPasswordVisible =
                                                    !isPasswordVisible;
                                              });
                                            },
                                            icon: Icon(
                                                isPasswordVisible
                                                    ? Icons.visibility
                                                    : Icons.visibility_off,
                                                size: 20,
                                                color: Colors.black))))),
                            SizedBox(height: 25),
                          ],
                        )),
                    SizedBox(height: 20),
                    buildLoginButton(),
                    SizedBox(height: 15),
                  ],
                ))));
  }
}
