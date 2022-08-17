import 'dart:io';

import 'package:demoapp/screens/createUser.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'motorVehicleInsurance.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:file_picker/file_picker.dart';

import 'login.dart';

class LicenceDetails extends StatefulWidget {
  const LicenceDetails({Key? key}) : super(key: key);

  @override
  State<LicenceDetails> createState() => _LicenceDetailsState();
}

class _LicenceDetailsState extends State<LicenceDetails> {
  bool _isObscure = true;
  final List<String> tags = [
    'Yes',
    'No',
  ];
  String? selectedValue;
  String? selectedValue1;
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
        padding: EdgeInsets.only(
          left: 10.0,
          right: 10,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Licence Details",
                  style:
                      GoogleFonts.openSans(fontSize: 38, color: Colors.black),
                ),
              ],
            ),
            const SizedBox(
              height: 10.0,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 0),
              child: TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Drivers Licence Number*',
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 0),
              child: TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Driver Licence Type*',
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 0),
              child: TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Drivers Licence Upload(dd/mm/yyyy)',
                  suffixIcon: IconButton(
                    onPressed: (() async {
                      await Tooltip(
                        message: 'Driving Licence',
                        // child: Text("Driving Licence"),
                      );
                    }),
                    icon: Icon(
                      Icons.info,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 0),
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
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Have you even been disqualified from driving *",
                    style: GoogleFonts.openSans()),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            FormField<String>(
              builder: (FormFieldState<String> state) {
                return InputDecorator(
                  decoration: InputDecoration(
                      labelText: 'Please Select',
                      hintText: 'Please select',
                      hintStyle: TextStyle(color: Colors.black),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0))),
                  isEmpty: selectedValue == '',
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: selectedValue,
                      isDense: true,
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedValue = newValue;
                          state.didChange(newValue);
                        });
                      },
                      items: tags.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Container(
                            child: Row(
                              children: [Text(value)],
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                );
              },
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 0),
              child: TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'If yes please explain*',
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Do you have criminal convictions*",
                    style: GoogleFonts.openSans()),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            FormField<String>(
              builder: (FormFieldState<String> state) {
                return InputDecorator(
                  decoration: InputDecoration(
                      labelText: 'Please Select',
                      hintText: 'Please select',
                      hintStyle: TextStyle(color: Colors.black),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0))),
                  isEmpty: selectedValue1 == '',
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: selectedValue1,
                      isDense: true,
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedValue1 = newValue;
                          state.didChange(newValue);
                        });
                      },
                      items: tags.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                );
              },
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 0),
              child: TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'If yes please explain*',
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 0),
              child: TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'White Card number',
                ),
              ),
            ),
            SizedBox(
              height: 30,
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
                                builder: (context) => CreateUser()));
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
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MotorVehicleInsurance()));
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
