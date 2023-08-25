import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pet_planet/login_screen.dart';
import 'package:pet_planet/utils/constants.dart';
import 'components/secondarybutton.dart';

class RegisterUserScreen extends StatefulWidget {
  @override
  State<RegisterUserScreen> createState() => _RegisterUserScreenState();
}

class _RegisterUserScreenState extends State<RegisterUserScreen> {
  bool isPasswordShown = true;

  TextEditingController nameController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController rpassController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final _formData = Map<String, Object>();

  void RegisterNewUser() async{
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passController.text,
      );

      Navigator.push(context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );

    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Fluttertoast.showToast(
            msg: "The password provided is too weak.",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.teal.shade900,
            textColor: Colors.white70,
            fontSize: 16.0
        );
      } else if (e.code == 'email-already-in-use') {
        Fluttertoast.showToast(
            msg: "The account already exists for that email.",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.teal.shade900,
            textColor: Colors.white70,
            fontSize: 16.0
        );
      }
    } catch (e) {
      Fluttertoast.showToast(
          msg: e.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.teal.shade900,
          textColor: Colors.white70,
          fontSize: 16.0
      );
    }

  }

  _onSubmit() async {
    _formKey.currentState!.save();
    if (_formData['password'] != _formData['rpassword']) {
      dialogueBox(context, 'Password and Retype Password should be equal');
    } else {
      progressIndicator(context);
      try {
        FirebaseAuth auth = FirebaseAuth.instance;
        auth.createUserWithEmailAndPassword(
            email: _formData['email'].toString(),
            password: _formData['password'].toString())
            .whenComplete(() => goTo(context, LoginScreen()));
      } on FirebaseAuthException catch (e){
        dialogueBox(context, e.toString());
      }
      catch (e){
        dialogueBox(context, e.toString());
      }
    }
    print(_formData['email']);
    print(_formData['password']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.teal.shade50,
        body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                padding: const EdgeInsets.all(20),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('Register User',
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
                        hintText: 'username',
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
                            color: Colors.teal
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25)
                        ),
                      ),
                    ),

                    const SizedBox(height: 40),

                    // SIGN IN
                    ElevatedButton(
                      onPressed: () {
                        RegisterNewUser();
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
                    SecondaryButton(
                        title: "Login with your account",
                        onPressed: (){
                          goTo(context, LoginScreen());
                        })
                  ],
                ),
              ),
            ),
            ),
        ),
    );
    }
}


// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:pet_planet/login_screen.dart';
// import 'package:pet_planet/utils/constants.dart';
//
// import 'components/custom_textfield.dart';
// import 'components/primarybutton.dart';
// import 'components/secondarybutton.dart';
//
// class RegisterUserScreen extends StatefulWidget {
//   @override
//   State<RegisterUserScreen> createState() => _RegisterUserScreenState();
// }
//
// class _RegisterUserScreenState extends State<RegisterUserScreen> {
//   bool isPasswordShown = true;
//
//   final _formKey = GlobalKey<FormState>();
//   final _formData = Map<String, Object>();
//
//   _onSubmit() async {
//     _formKey.currentState!.save();
//     if (_formData['password'] != _formData['rpassword']) {
//       dialogueBox(context, 'Password and Retype Password should be equal');
//     } else {
//       progressIndicator(context);
//       try {
//         FirebaseAuth auth = FirebaseAuth.instance;
//         auth.createUserWithEmailAndPassword(
//             email: _formData['email'].toString(),
//             password: _formData['password'].toString())
//             .whenComplete(() => goTo(context, LoginScreen()));
//       } on FirebaseAuthException catch (e){
//         dialogueBox(context, e.toString());
//       }
//       catch (e){
//         dialogueBox(context, e.toString());
//       }
//     }
//     print(_formData['email']);
//     print(_formData['password']);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.teal.shade50,
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 10),
//           child: SingleChildScrollView(
//             child: Column(
//               children: [
//                 Container(
//                   height: MediaQuery.of(context).size.height * 0.3,
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       Text('REGISTER',
//                         style: TextStyle(
//                             fontSize: 40,
//                             fontWeight: FontWeight.bold,
//                             color: primaryColor),
//                       ),
//                       Image.asset('assets/PetPlanetInAppLogo.png',
//                         height: 100,
//                         width: 100,
//                       ),
//                     ],
//                   ),
//                 ),
//                 Container(
//                   height: MediaQuery.of(context).size.height * 0.52,
//                   child: Form(
//                     key: _formKey,
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [
//                         CustomTextField(
//                           hintText: 'Enter Name',
//                           textInputAction: TextInputAction.next,
//                           keyboardtype: TextInputType.name,
//                           prefix: Icon(Icons.person),
//                           onsave: (name) {
//                             _formData['name'] = name ?? "";
//                           },
//                           validate: (email) {
//                             if (email!.isEmpty ||
//                                 email.length < 3) {
//                               return 'enter correct name';
//                             }
//                             return null;
//                           },
//                         ),
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
//                               }, icon: isPasswordShown?
//                           Icon(Icons.visibility_off) :
//                           Icon(Icons.visibility)),
//                         ),
//                         CustomTextField(
//                           hintText: 'Retype Password',
//                           isPassword: isPasswordShown,
//                           prefix: Icon(Icons.vpn_key_rounded),
//                           onsave: (password) {
//                             _formData['[rpassword]'] = password ?? "";
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
//                               }, icon: isPasswordShown?
//                           Icon(Icons.visibility_off) :
//                           Icon(Icons.visibility)),
//                         ),
//                         PrimaryButton(
//                             title: "REGISTER",
//                             onPressed: () {
//                               if (_formKey.currentState!.validate()) {
//                                 _onSubmit();
//                               }
//                             }),
//                       ],
//                     ),
//                   ),
//                 ),
//                 SecondaryButton(
//                     title: "Login with your account",
//                     onPressed: (){
//                       goTo(context, LoginScreen());
//                     })
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
