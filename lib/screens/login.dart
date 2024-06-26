import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:midterm_mobile_3/consts/sizeConfig.dart';
import 'package:midterm_mobile_3/consts/styles.dart';
import 'package:midterm_mobile_3/controllers/auth_controller.dart';

class Login extends StatefulWidget {
  static const String route = '/login';
  static const String name = 'login';
  const Login({super.key});

  @override
  State<Login> createState() => _LoginPageState();
}

class _LoginPageState extends State<Login> {
  late GlobalKey<FormState> formkey;
  late TextEditingController patientID;
  late TextEditingController password;
  late FocusNode patientIDFN, passwordFN;
  bool _isObscured = true;

  @override
  void initState() {
    super.initState();
    formkey = GlobalKey<FormState>();
    patientID = TextEditingController();
    password = TextEditingController();
    patientIDFN = FocusNode();
    passwordFN = FocusNode();
  }

  @override
  void dispose() {
    patientID.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig sizeConfig = SizeConfig();
    sizeConfig.init(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              appName(),
              mainBody(context),
            ],
          ),
        ),
      ),
    );
  }

  //METHODS
  Positioned appName() {
    return Positioned(
      top: 169.98,
      child: Text('PatientLink',
          style: interBold.copyWith(fontSize: 32, color: orange)),
    );
  }

  Positioned mainBody(BuildContext context) {
    return Positioned(
      top: 200,
      child: SizedBox(
        width: 300,
        height: 700,
        child: Form(
          key: formkey,
          child: Column(
            children: [
              const SizedBox(height: 56),
              inputTitle(),
              const SizedBox(height: 17),
              patientIDfield(),
              const SizedBox(height: 15),
              passwordField(),
              const SizedBox(height: 30),
              trackButton(context),
              const SizedBox(height: 50),
              alternative(),
              const SizedBox(height: 50),
              updateLog(),
              const SizedBox(height: 15),
              scanQR(),
            ],
          ),
        ),
      ),
    );
  }

  Widget alternative() {
    return Text('OR', style: interBold.copyWith(fontSize: 12, color: orange));
  }

  Widget passwordField() {
    return Flexible(
      child: Container(
        margin: const EdgeInsets.only(left: 0, right: 0),
        child: TextFormField(
          focusNode: passwordFN,
          controller: password,
          obscureText: _isObscured,
          onEditingComplete: () {
            passwordFN.unfocus();
          },
          validator: RequiredValidator(errorText: "Password is Required").call,
          decoration: InputDecoration(
            labelText: 'Password',
            labelStyle: interRegular.copyWith(fontSize: 14, color: orange),
            floatingLabelBehavior: FloatingLabelBehavior.auto,
            filled: true,
            fillColor: Colors.white,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xffFE8570)),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Color(0xffFE8570)),
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xffFE8570)),
            ),
            prefixIcon: Transform.scale(
              scale: 0.5,
              child: Icon(
                Icons.lock_open,
                size: 50,
                color: orange,
              ),
            ),
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  _isObscured = !_isObscured;
                });
              },
              child: Transform.scale(
                scale: 0.5,
                child: Icon(
                  _isObscured ? Icons.visibility_off : Icons.visibility,
                  size: 40,
                  color: orange,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget patientIDfield() {
    return Flexible(
      child: Container(
        margin: const EdgeInsets.only(left: 0, right: 0),
        child: TextFormField(
          focusNode: patientIDFN,
          controller: patientID,
          onEditingComplete: () {
            passwordFN.requestFocus();
          },
          validator:
              RequiredValidator(errorText: "Patient ID is Required").call,
          decoration: InputDecoration(
            labelText: 'Patient ID',
            labelStyle: GoogleFonts.poppins(
                fontSize: 14, color: const Color(0xffFE8570)),
            floatingLabelBehavior: FloatingLabelBehavior.auto,
            filled: true,
            fillColor: Colors.white,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 5, horizontal: 25),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xffFE8570)),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Color(0xffFE8570)),
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xffFE8570)),
            ),
            prefixIcon: Transform.scale(
              scale: 0.5,
              child: Icon(
                Icons.person_3_outlined,
                size: 50,
                color: orange,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget inputTitle() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Row(
        children: [
          Container(
            width: 24.54,
            height: 22.03,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/icons/heart_icon.png'),
                fit: BoxFit.contain,
              ),
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          Text('Patient Log',
              style: GoogleFonts.inter(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xffFE8570))),
        ],
      ),
    );
  }

  Widget updateLog() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 24.54,
                height: 22.03,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/icons/heart_icon.png'),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Text('Update Log',
                  style: interBold.copyWith(fontSize: 20, color: orange)),
            ],
          ),
          // Text('(For medical professionals only)',
          //     style: interRegular.copyWith(fontSize: 8, color: Colors.grey)),
        ],
      ),
    );
  }

  ElevatedButton trackButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        onSubmit(context);
      },
      style: ElevatedButton.styleFrom(
        fixedSize: const Size(265, 45),
        backgroundColor: const Color(0xffFE8570),
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Text(
        'View Log',
        style: GoogleFonts.inter(
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget scanQR() {
    return Column(
      children: [
        Container(
          height: SizeConfig.blockSizeVertical! * 20,
          width: SizeConfig.blockSizeHorizontal! * 80,
          decoration: BoxDecoration(
            color: lightOrange,
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(
              'assets/images/scanQR.png',
              fit: BoxFit.fitHeight,
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const Text(
          'Scan QR Code',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }

  Future<void> onSubmit(BuildContext context) async {
    if (formkey.currentState?.validate() ?? false) {
      try {
        await AuthController.I.checkUser(patientID.text.trim(), password.text.trim());
        // Navigate to the next page if login is successful
        Navigator.pushNamed(context, '/nextPage');
      } catch (e) {
        showErrorDialog(context, 'Login Failed', e.toString());
      }
    }
  }

  void showErrorDialog(BuildContext context, String title, String content) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
