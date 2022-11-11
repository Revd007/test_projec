import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_project/Bloc/Auth/Login/LoginState.dart';
import 'package:test_project/Home/HomeScreen.dart';

import '../Bloc/Auth/Login/LoginBloc.dart';
import 'RegisterScreen.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers : [
          BlocProvider<LoginBloc>(
              create : ( context ) => LoginBloc()
          )
        ],
        child : LoginScreens()
    );
  }
}

class LoginScreens extends StatefulWidget {
  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreens> {
  GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final eController = TextEditingController();
  bool isEmail = true;
  bool isPassword = true;
  bool isPasswordVisible = false;
  late LoginBloc loginBloc;
  Widget buildLoginButton() {
    return Material(
        child: InkWell(
            onTap: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                      (route) => false);
            },
            child: Container(
                width: MediaQuery.of(context).size.width,
                height: 45,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromARGB(255, 42, 65, 135)),
                alignment: Alignment.center,
                child: Text("Masuk",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600)))));
  }

  @override
  Widget build(BuildContext context) {
    loginBloc = BlocProvider.of<LoginBloc>(context);
    return BlocListener<LoginBloc , LoginState>(
      listener : ( context , state ) {

      },
      child : Scaffold(
          backgroundColor: Colors.white,
          body: Center(
              child: SingleChildScrollView(
                  padding: EdgeInsets.all(30.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Form(
                          key: formKey,
                          child: Column(
                            children: <Widget>[
                              Image.asset("app_logo.jpeg",
                                  width: 150, height: 150),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Row(children: [
                                    SvgPicture.asset("assets/images/ic_user.svg",
                                        width: 20, height: 20),
                                    Text("Username/Email/Phone",
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
                              SizedBox(height: 5),
                              SizedBox(height: 15),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
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
                              SizedBox(height: 5),
                            ],
                          )),
                      SizedBox(height: 5),
                      Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                        InkWell(
                            onTap: () {},
                            child: Text("Lupa Password?",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 240, 50, 49),
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600)))
                      ]),
                      SizedBox(height: 20),
                      buildLoginButton(),
                      SizedBox(height: 15),
                      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                        Text("Anda Anggota Baru?",
                            style: TextStyle(color: Colors.black, fontSize: 15))
                      ]),
                      SizedBox(height: 10),
                      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                        GestureDetector(
                          child: Text("DAFTAR DISINI",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 240, 50, 49),
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600)),
                          onTap: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(
                              builder: (BuildContext context) {
                                return RegisterScreen();
                              },
                            ));
                          },
                        )
                      ])
                    ],
                  ))))
    );
  }
}
