import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; //fonts

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);

  //creating a reference to the form i.e creating a form key
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Container(
          //linear gradient background
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient:
                LinearGradient(begin: Alignment.bottomCenter, stops: const [
              0.1,
              0.5,
              0.5
            ], colors: [
              Colors.lightBlueAccent.withOpacity(.74),
              Colors.lightBlue.withOpacity(.69),
              Colors.lightBlue.withOpacity(.59)
            ]),
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
                              style: TextStyle(fontStyle: FontStyle.italic)),
                          TextSpan(
                              text: 'Note',
                              style: TextStyle(color: Colors.black)),
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
                              'username',
                              const Icon(Icons.person),
                              'username or E-mail',
                              false,
                              30),
                          usernameEmailPassword('password',
                              const Icon(Icons.key), 'password', true, 15),
                          button('Login'),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget usernameEmailPassword(
      String title, Icon icon, String hint, bool obscureText, int len) {
    return Column(
      children: [
        TextFormField(
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
          height: 30.0,
        )
      ],
    );
  }

  Widget button(String title) {
    return ElevatedButton(
      onPressed: () {},
      child: Text(title),
    );
  }
}
