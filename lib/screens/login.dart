import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:midterm_mobile_3/consts/styles.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginPageState();
}

class _LoginPageState extends State<Login> {
  @override
  Widget build(BuildContext context) {
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
            style: interBold.copyWith(fontSize: 32, color: orange)));
  }

  Positioned mainBody(BuildContext context) {
    return Positioned(
      top: 200,
      child: SizedBox(
        width: 300,
        height: 700,
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
          ],
        ),
      ),
    );
  }

  Widget alternative() {
    return Text('OR', style: interBold.copyWith(fontSize: 12, color: orange));
  }

  Container passwordField() {
    return Container(
        margin: const EdgeInsets.only(left: 0, right: 0),
        child: TextField(
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
            hintText: 'Password',
            hintStyle: interRegular.copyWith(fontSize: 14, color: orange),
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xffFE8570))),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                  color: Color(0xffFE8570)), //ngano di mo change color
            ),
            enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xffFE8570))),
            prefixIcon: Transform.scale(
                scale: 0.5,
                child: Image.asset('assets/icons/key_icon.png',
                    width: 5, height: 5)),
            suffixIcon: GestureDetector(
              onTap: () {
                // Handle the tap on the suffix icon
              },
              child: Transform.scale(
                scale: 0.5,
                //child: Image.asset('assets/icons/eye_icon.png',
                //    width: 5, height: 5)),
              ),
            ),
          ),
        ));
  }

  Container patientIDfield() {
    return Container(
        margin: const EdgeInsets.only(left: 0, right: 0),
        child: TextField(
            decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 5, horizontal: 25),
          hintText: 'Patient ID',
          hintStyle:
              GoogleFonts.poppins(fontSize: 14, color: const Color(0xffFE8570)),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xffFE8570))),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
                color: Color(0xffFE8570)), //ngano di mo change color
          ),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xffFE8570))),
          prefixIcon: Transform.scale(
            scale: 0.5,
            //child: Image.asset('assets/icons/patient_icon.png',
            //    width: 5, height: 5)),
          ),
        )));
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
        ));
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
            Text('(For medical professionals only)',
                style: interRegular.copyWith(fontSize: 1, color: orange)),
          ],
        ));
  }

  ElevatedButton trackButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) {
        //       return LoginPag();
        //     },
        //   ),
        // );
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
}
