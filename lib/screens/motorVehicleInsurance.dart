import 'package:demoapp/screens/createUser.dart';
import 'package:demoapp/screens/licenceDetails.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:form_field_validator/form_field_validator.dart';

import 'login.dart';

class MotorVehicleInsurance extends StatefulWidget {
  const MotorVehicleInsurance({Key? key}) : super(key: key);

  @override
  State<MotorVehicleInsurance> createState() => _MotorVehicleInsuranceState();
}

class _MotorVehicleInsuranceState extends State<MotorVehicleInsurance> {
  bool _isObscure = true;

  TextEditingController _fileName = TextEditingController();
  @override
  Widget build(BuildContext context) {
    const double kDesignWidth = 375;
    const double kDesignHeight = 812;
    double _widthScale = MediaQuery.of(context).size.width / kDesignWidth;
    double _heightScale = MediaQuery.of(context).size.height / kDesignHeight;

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
                  "Motor Vehicle Insurance",
                  style:
                      GoogleFonts.openSans(fontSize: 28, color: Colors.black),
                ),
              ],
            ),
            const SizedBox(
              height: 10.0,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Insurance Company Name*',
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Policy Number*',
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Motor Vechicle Insurance Upload(dd/mm/yyyy)',
                  labelStyle: TextStyle(fontSize: 15),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextFormField(
                controller: _fileName,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                      onPressed: () async {
                        print("Choose File");
                        FilePickerResult? result =
                            await FilePicker.platform.pickFiles(
                          type: FileType.custom,
                          allowedExtensions: ['jpg', 'pdf', 'doc'],
                        );
                        setState(() {
                          _fileName.text = result!.files[0].name;
                        });
                        // print("Res1: ${result!.files[0].name}");
                        // print("Result ${result.runtimeType}");
                      },
                      icon: Icon(
                        Icons.add_circle_outline,
                        color: Colors.grey.shade600,
                      )),
                  border: OutlineInputBorder(),
                  labelText: 'Choose File*',
                ),
              ),
            ),
            SizedBox(
              height: 210,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FloatingActionButton(
                      backgroundColor: Colors.lightBlueAccent,
                      onPressed: (() {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LicenceDetails()));
                      }),
                      child: Icon(
                        Icons.arrow_back,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(
                    right: 100.0,
                    left: 100,
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    FloatingActionButton(
                      backgroundColor: Colors.lightBlueAccent,
                      onPressed: (() {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => MotorVehicleInsurance()));
                      }),
                      child: Icon(
                        Icons.arrow_forward,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Already User?",
                    style: GoogleFonts.openSans(fontWeight: FontWeight.bold)),
                TextButton(
                  onPressed: () {
                    print("Signing Up!!");
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginPage()));
                  },
                  child: Text(
                    "Login",
                    style: GoogleFonts.openSans(
                        fontWeight: FontWeight.bold,
                        color: Colors.lightBlue.shade300),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
