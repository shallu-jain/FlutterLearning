import 'package:flutter/material.dart';
import 'package:flutter_catalog/utils/routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool changeButton = false;

  // these formkey is created so that our username,password works well
  final _formkey = GlobalKey<FormState>();

  moveToHome(BuildContext context) async {
    if (_formkey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });

      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoutes.homeRoute);
      setState(() {
        changeButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        child: SingleChildScrollView(
      child: Form(
        key: _formkey,
        child: Column(
          children: [
            Image.asset(
              "assets/images/login_image.png",
              fit: BoxFit.cover,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Welcome $name",
              style: TextStyle(
                  color: Colors.red, fontSize: 28, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 35),
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: "Enter User Name", labelText: "User Name"),
                    validator: (String ? value) {
                      if (value!=null && value.isEmpty) {
                        return "UserName can't be empty";
                      }
                      return null;
                    },
                    onChanged: (value) {
                      name = value;
                      setState(() {});
                    },
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                        hintText: "Enter Password", labelText: "Password"),
                    validator: (String ? value) {
                      if (value!=null && value.isEmpty) {
                        return "Password can't be empty";
                      }
                      else if (value!.length <6) {
                        return "Password should be atleast 6";
                      }
                      return null;
                    },
                  ),

                  SizedBox(
                    height: 25,
                  ),

                  // ElevatedButton(
                  //   onPressed: () {
                  //     Navigator.pushNamed(context, MyRoutes.homeRoute);
                  //   },
                  //   child: Text("Login"),
                  //   style: TextButton.styleFrom(minimumSize: Size(150, 40)),
                  // ),

                  // or we can also create button by our self
                  Material(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(changeButton ? 20 : 12),
                    child: InkWell(
                      // onTap: () async {
                      // setState(() {
                      //   changeButton = true;
                      // });
                      //
                      // await Future.delayed(Duration(seconds: 1));
                      // await Navigator.pushNamed(context, MyRoutes.homeRoute);
                      // setState(() {
                      //   changeButton = false;
                      // });
                      //},
                      // we are calling moveTOHome method below
                      onTap: () => moveToHome(context),
                      child: AnimatedContainer(
                        duration: Duration(seconds: 1),
                        width: changeButton ? 50 : 120,
                        height: 50,
                        alignment: Alignment.center,
                        child: changeButton
                            ? Icon(Icons.done, color: Colors.white)
                            : Text(
                                "Login",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                        // decoration: BoxDecoration(
                        //   color: Colors.red,
                        //   shape:
                        //       changeButton ? BoxShape.circle : BoxShape.rectangle,
                        //borderRadius:
                        //  BorderRadius.circular(changeButton ? 20 : 12),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
