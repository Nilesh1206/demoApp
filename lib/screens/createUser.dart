import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:intl/intl.dart';
import 'licenceDetails.dart';
import 'login.dart';

class CreateUser extends StatefulWidget {
  const CreateUser({Key? key}) : super(key: key);

  @override
  State<CreateUser> createState() => _CreateUserState();
}

class _CreateUserState extends State<CreateUser> {
  bool _isObscure = true;
  final List<String> tags = [
    'Student',
    'Working Professional',
    'Worker',
    'Employee',
    'Lawyer',
    'Doctor',
    'Engineer',
    'Professor',
    'Teacher',
  ];
  String? selectedValue;
  String? _initialDate;
  TextEditingController _dateInput = TextEditingController();
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
                  "Create User",
                  style:
                      GoogleFonts.openSans(fontSize: 38, color: Colors.black),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Personal Details",
                  style:
                      GoogleFonts.openSans(fontSize: 20, color: Colors.black),
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
                  labelText: 'First Name*',
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
                  labelText: 'Last Name',
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
                    labelText: 'Email Id*',
                  ),
                  validator: MultiValidator([
                    RequiredValidator(errorText: "* Required"),
                    EmailValidator(errorText: "Enter valid email id"),
                  ])),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 0),
              child: TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Username*',
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            FormField<String>(
              builder: (FormFieldState<String> state) {
                return InputDecorator(
                  decoration: InputDecoration(
                      labelText: 'Profile*',
                      hintText: 'Profile*',
                      hintStyle: TextStyle(color: Colors.black),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0))),
                  isEmpty: selectedValue == 'Working Professional',
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
                  labelText: 'Contact Number*',
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 0),
              child: TextFormField(
                readOnly: true,
                controller: _dateInput,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Date of Birth*',
                    suffixIcon: IconButton(
                        onPressed: (() async {
                          DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1970),
                              lastDate: DateTime(2101));
                          String formattedDate =
                              DateFormat('yyyy-MM-dd').format(pickedDate!);
                          print(formattedDate);

                          setState(() {
                            _dateInput.text = formattedDate;
                            print(_initialDate);
                          });
                        }),
                        icon: Icon(Icons.calendar_month))),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
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
                    Icons.arrow_forward,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    right: 30.0,
                  ),
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
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
