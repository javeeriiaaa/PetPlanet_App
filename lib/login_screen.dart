import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pet_planet/Bottom_Screens/home_screen.dart';
import 'package:pet_planet/register_user.dart';

import 'bottom_home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  void LogIn() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text,
          password: passController.text
      );
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => BottomHomeScreen()),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Fluttertoast.showToast(
            msg: "No user found for that email.",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.teal.shade900,
            textColor: Colors.white70,
            fontSize: 16.0
        );
      } else if (e.code == 'wrong-password') {
        Fluttertoast.showToast(
            msg: "Wrong password provided for that user.",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.teal.shade900,
            textColor: Colors.white70,
            fontSize: 16.0
        );
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal.shade50,
        body: SafeArea(
          child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              padding: const EdgeInsets.all(20),
              child: SingleChildScrollView(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                    Text('User Login',
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                              color: Colors.teal.shade700
                          ),
                        ),
                        Image.asset('assets/PetPlanetInAppLogo.png',
                          height: 100,
                          width: 100,
                        ),
                      const SizedBox(height: 25),
                      // USERNAME
                      TextField(
                        style: TextStyle(
                            color: Colors.teal.shade900
                        ),
                        controller: emailController,
                        obscureText: false,
                        cursorColor: Colors.teal,
                        decoration: InputDecoration(
                          hintText: 'Email',
                          hintStyle: TextStyle(
                              color: Colors.teal.shade800.withOpacity(0.4)
                          ),
                          prefixIcon: const Icon(
                              Icons.person_outline,
                              color: Colors.teal
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25)
                          ),
                        ),
                      ),

                      const SizedBox(height: 20),

                      // PASSWORD
                      TextField(
                        style: TextStyle(
                            color: Colors.teal.shade900
                        ),
                        controller: passController,
                        obscureText: true,
                        cursorColor: Colors.teal,
                        decoration: InputDecoration(
                          hintText: 'password',
                          hintStyle: TextStyle(
                              color: Colors.teal.shade800.withOpacity(0.4)
                          ),
                          prefixIcon: const Icon(
                              Icons.password,
                              color: Colors.teal,
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25)
                          ),
                        ),
                      ),

                      const SizedBox(height: 40),

                      // LOG IN
                      ElevatedButton(
                        onPressed: () {
                          LogIn();
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(Colors.teal.shade100),
                        ),
                        child: Text(
                          'LOGIN',
                          style: TextStyle(
                              color: Colors.teal.shade700,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(height: 40),
                      // DIVIDER
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Divider(
                              thickness: 2,
                              color: Colors.teal.shade700,
                              height: 20,
                            ),
                          ),
                          const Text(
                            '  DON\'T HAVE AN ACCOUNT? ',
                            style: TextStyle(
                                color: Colors.teal
                            ),
                          ),
                          Expanded(
                            child: Divider(
                              thickness: 2,
                              color: Colors.teal.shade700,
                              height: 20,
                            ),
                          )
                        ],
                      ),

                      const SizedBox(height: 40),

                      // REGISTER
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => RegisterUserScreen()));
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(Colors.teal.shade100),
                        ),
                        child: Text(
                          'REGISTER',
                          style: TextStyle(
                              color: Colors.teal.shade700,
                              fontSize: 24,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              ),
        ),
        );
    }
}


// import 'dart:ui';
// import 'package:flutter/material.dart';
// import 'package:pet_planet/components/custom_textfield.dart';
// import 'package:pet_planet/register_user.dart';
// import 'package:pet_planet/utils/constants.dart';
// import 'components/primarybutton.dart';
// import 'components/secondarybutton.dart';
//
// class LoginScreen extends StatefulWidget {
//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }
//
// class _LoginScreenState extends State<LoginScreen> {
//   bool isPasswordShown = false;
//   final _formKey = GlobalKey<FormState>();
//   final _formData = Map<String, Object>();
//
//   _onSubmit() {
//     _formKey.currentState!.save();
//     print(_formData['email']);
//     print(_formData['password']);
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.teal.shade50,
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: SingleChildScrollView(
//             child: Column(
//               children: [
//                 Container(
//                   height: MediaQuery.of(context).size.height * 0.3,
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       Text('User Login',
//                         style: TextStyle(
//                           fontSize: 40,
//                           fontWeight: FontWeight.bold,
//                           color: primaryColor),
//                       ),
//                       Image.asset('assets/PetPlanetInAppLogo.png',
//                         height: 100,
//                         width: 100,
//                       ),
//                     ],
//                   ),
//                 ),
//                 Container(
//                   height: MediaQuery.of(context).size.height * 0.4,
//                   child: Form(
//                     key: _formKey,
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [
//                         CustomTextField(
//                           hintText: 'Enter Email',
//                           textInputAction: TextInputAction.next,
//                           keyboardtype: TextInputType.emailAddress,
//                           prefix: Icon(Icons.person),
//                           onsave: (email) {
//                             _formData['email'] = email ?? "";
//                           },
//                           validate: (email) {
//                             if (email!.isEmpty ||
//                                 email.length < 3 ||
//                                 !email.contains("@")) {
//                               return 'enter correct email';
//                             }
//                             return null;
//                           },
//                         ),
//                         CustomTextField(
//                           hintText: 'Enter Password',
//                           isPassword: isPasswordShown,
//                           prefix: Icon(Icons.vpn_key_rounded),
//                           onsave: (password) {
//                             _formData['[password]'] = password ?? "";
//                           },
//                           validate: (password) {
//                             if (password!.isEmpty || password.length < 7) {
//                               return 'enter correct password';
//                             }
//                             return null;
//                           },
//                           suffix: IconButton(
//                               onPressed: (){
//                                 setState(() {
//                                   isPasswordShown = !isPasswordShown;
//                                 });
//                           }, icon: isPasswordShown?
//                                 Icon(Icons.visibility_off) :
//                                 Icon(Icons.visibility)),
//                         ),
//                         PrimaryButton(
//                             title: "LOGIN",
//                             onPressed: () {
//                               progressIndicator(context);
//                               if (_formKey.currentState!.validate()) {
//                                 _onSubmit();
//                               }
//                         }),
//                       ],
//                     ),
//                   ),
//                 ),
//                 Container(
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text(
//                         "Forgot Password?",
//                         style: TextStyle(fontSize: 18),
//                       ),
//                       SecondaryButton(title: "click here", onPressed: (){}),
//                     ],
//                   ),
//                 ),
//                 SecondaryButton(
//                     title: "Register new user",
//                     onPressed: (){
//                       goTo(context, RegisterUserScreen());
//                     })
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
