import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; //fonts

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);

  final database = FirebaseDatabase.instance
      .ref(); //using database as a reference to realtime database

  @override
  Widget build(BuildContext context) {
    //the data is written in the child of the root of the database at the place '/path'
    final pathRef = database.child('/Users');

    //TextEditingController controllers
    TextEditingController name = TextEditingController();
    TextEditingController psw = TextEditingController();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Container(
          //linear gradient background
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              stops: const [0.1, 0.2, 0.5, 0.5],
              colors: [
                Colors.lightBlueAccent.withOpacity(.84),
                Colors.lightBlueAccent.withOpacity(.74),
                Colors.lightBlue.withOpacity(.64),
                Colors.lightBlue.withOpacity(.44)
              ],
            ),
          ),
          child: Scaffold(
            backgroundColor: Colors.white10,
            body: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                //heading or starting of the screen
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    //App Icon
                    const Icon(
                      Icons.music_note_outlined,
                      color: Colors.black45,
                      size: 115.0,
                    ),
                    //App Name
                    RichText(
                      text: TextSpan(
                        style: GoogleFonts.montserratAlternates(
                            fontSize: 33.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white60),
                        children: const [
                          TextSpan(text: 'Keep'),
                          TextSpan(
                            text: 'My',
                            style: TextStyle(fontStyle: FontStyle.italic),
                          ),
                          TextSpan(
                            text: 'Note',
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                //Form or inputs or text fields
                const SizedBox(height: 100.0),
                Column(
                  children: [
                    Form(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      child: Column(
                        children: [
                          usernameEmailPassword(
                              'Username',
                              const Icon(Icons.person),
                              'Username or Email-id',
                              false,
                              25,
                              name),
                          usernameEmailPassword(
                              'Password',
                              const Icon(Icons.lock),
                              'Password',
                              true,
                              12,
                              psw),
                          button('login', name, psw, pathRef),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  //text input field
  Widget usernameEmailPassword(String title, Icon icon, String hint,
      bool obscureText, int len, TextEditingController tec) {
    return Column(
      children: [
        TextFormField(
          controller: tec,
          cursorColor: Colors.black,
          keyboardAppearance: Brightness.light,
          obscureText: obscureText,
          maxLength: len,
          style: GoogleFonts.roboto(fontSize: 22.0),
          decoration: InputDecoration(
            filled: true,
            enabledBorder: const OutlineInputBorder(
              gapPadding: 1.0,
              borderRadius: BorderRadius.all(
                Radius.elliptical(20.0, 20.0),
              ),
              borderSide: BorderSide(
                  color: Colors.lightBlueAccent, style: BorderStyle.solid),
            ),
            focusedBorder: const OutlineInputBorder(
              gapPadding: 1.0,
              borderRadius: BorderRadius.all(
                Radius.elliptical(10.0, 10.0),
              ),
              borderSide:
                  BorderSide(color: Colors.black, style: BorderStyle.solid),
            ),
            hintText: hint,
            labelStyle: const TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
            labelText: title,
            prefixIcon: icon,
            prefixIconColor: Colors.redAccent,
            fillColor: Colors.white54,
          ),
        ),
        const SizedBox(
          height: 25.0,
        ),
      ],
    );
  }

  //button
  Widget button(String title, TextEditingController uname,
      TextEditingController pass, DatabaseReference path) {
    return ElevatedButton(
      onPressed: () {
        path.push().set({'username': uname.text, 'password': pass.text});
        uname.clear();
        pass.clear();
      },
      child: Text(title),
    );
  }
}
