import 'createUser.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:form_field_validator/form_field_validator.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    const double kDesignWidth = 375;
    const double kDesignHeight = 812;
    double _widthScale = MediaQuery.of(context).size.width / kDesignWidth;
    double _heightScale = MediaQuery.of(context).size.height / kDesignHeight;
    validator:
    MultiValidator([
      RequiredValidator(errorText: "* Required"),
      EmailValidator(errorText: "Enter valid username"),
    ]);

    MultiValidator([
      RequiredValidator(errorText: "* Required"),
      MinLengthValidator(6,
          errorText: "Password should be atleast 6 characters"),
      MaxLengthValidator(15,
          errorText: "Password should not be greater than 15 characters")
    ]);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.0),
        child: AppBar(
          backgroundColor: Colors.grey.shade50,
          elevation: 0.0,
          centerTitle: false,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: 20.0,
                  ),
                ),
                Text(
                  "Login",
                  style:
                      GoogleFonts.openSans(fontSize: 38, color: Colors.black),
                ),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Hi there!",
                  style:
                      GoogleFonts.openSans(fontSize: 38, color: Colors.black),
                ),
              ],
            ),
            const SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "welcome back you've",
                  style: GoogleFonts.openSans(fontSize: 18),
                ),
              ],
            ),
            // const SizedBox(height: 5.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "been missed",
                  style: GoogleFonts.openSans(fontSize: 18),
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Username',
                      hintText: 'Enter valid Username'),
                  validator: MultiValidator([
                    RequiredValidator(errorText: "* Required"),
                    EmailValidator(errorText: "Enter valid username"),
                  ])),
            ),
            SizedBox(
              height: 10,
            ),

            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 0),
              child: TextFormField(
                  obscureText: _isObscure,
                  decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isObscure ? Icons.visibility_off : Icons.visibility,
                        ),
                        onPressed: () {
                          setState(() {
                            _isObscure = !_isObscure;
                          });
                        },
                      ),
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                      hintText: 'Enter secure password'),
                  validator: MultiValidator([
                    RequiredValidator(errorText: "* Required"),
                    MinLengthValidator(6,
                        errorText: "Password should be atleast 6 characters"),
                    MaxLengthValidator(15,
                        errorText:
                            "Password should not be greater than 15 characters")
                  ])
                  //validatePassword,        //Function to check validation
                  ),
            ),
            // SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    print("Password Changed");
                  },
                  child: Text(
                    "Forgot Passowrd?",
                    style: GoogleFonts.openSans(
                        fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: _widthScale * 10),
              width: _widthScale * 350,
              height: _heightScale * 54,
              child: ElevatedButton(
                  onPressed: () {
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (context) => UserHome()));
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.lightBlueAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(_widthScale * 10.0),
                    ),
                  ),
                  child: Text(
                    "Login",
                    style: GoogleFonts.openSans(
                      textStyle: TextStyle(
                          fontSize: _widthScale * 18,
                          fontWeight: FontWeight.bold),
                    ),
                  )),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                new Divider(
                  thickness: 10.0,
                  color: Colors.black,
                  endIndent: 20,
                ),
                Text("OR",
                    style: GoogleFonts.openSans(fontWeight: FontWeight.bold)),
                new Divider(
                  thickness: 10.0,
                  color: Colors.black,
                  endIndent: 20,
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: (() {
                      print("Opening Google");
                    }),
                    icon: Image.asset('assets/icons/google.png')),
                SizedBox(width: 20),
                IconButton(
                    onPressed: (() {
                      print("Opening Facebook");
                    }),
                    icon: Image.asset('assets/icons/facebook.png')),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Don't have an Account?",
                    style: GoogleFonts.openSans(fontWeight: FontWeight.bold)),
                TextButton(
                  onPressed: () {
                    print("Signing Up!!");
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => CreateUser()));
                  },
                  child: Text(
                    "Sign Up",
                    style: GoogleFonts.openSans(
                        fontWeight: FontWeight.bold,
                        color: Colors.lightBlue.shade300),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
