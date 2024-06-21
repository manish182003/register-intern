import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_logs/flutter_logs.dart';

class RegsiterScreen extends StatefulWidget {
  const RegsiterScreen({super.key});

  @override
  State<RegsiterScreen> createState() => _RegsiterScreenState();
}

class _RegsiterScreenState extends State<RegsiterScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmpasswordController =
      TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  bool isshow = false;
  bool isshow1 = false;
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmpasswordController.dispose();
  }

  String isValidEmail(String email) {
    if (email.isEmpty ||
        !RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
            .hasMatch(email)) {
      FlutterLogs.logInfo("KaamConnect Assignment", "Email Validation",
          "Invalid email: $email");
      return "Please Enter a Valid Email.";
    } else {
      FlutterLogs.logInfo(
          "KaamConnect Assignment", "Email Validation", "Valid email: $email");
      return "";
    }
  }

  String validatePassword(String password) {
    if (password.isEmpty) {
      FlutterLogs.logInfo(
          "KaamConnect Assignment", "Password Validation", "Password Is Empty");
      return 'Please Enter a Valid Password';
    }
    if (password.length < 8 || password.length > 50) {
      FlutterLogs.logInfo("KaamConnect Assignment", "Password Validation",
          "Invalid password length: $password");
      return "Password must be between 8 and 50 characters.";
    }
    if (password.contains('*')) {
      FlutterLogs.logInfo("KaamConnect Assignment", "Password Validation",
          "Password contains asterisk: $password");
      return "Password cannot contain '*'.";
    }
    if (!RegExp(r'[A-Z].*[A-Z]').hasMatch(password)) {
      FlutterLogs.logInfo("KaamConnect Assignment", "Password Validation",
          "Password lacks capital letters: $password");
      return "Password must contain at least two capital letters.";
    }
    if (!RegExp(r'[a-z]').hasMatch(password)) {
      FlutterLogs.logInfo("KaamConnect Assignment", "Password Validation",
          "Password lacks small letters: $password");
      return "Password must contain at least one small letter.";
    }
    if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(password)) {
      FlutterLogs.logInfo("KaamConnect Assignment", "Password Validation",
          "Password lacks special characters: $password");
      return "Password must contain at least one special character.";
    }
    FlutterLogs.logInfo("KaamConnect Assignment", "Password Validation",
        "Valid password: $password");
    return '';
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Form(
        key: formkey,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              'assets/images/b1.jpg',
              fit: BoxFit.fitHeight,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 50,
                ),
                Container(
                  width: size.width * 0.85,
                  height: size.height * 0.6,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.deepOrangeAccent,
                            child: Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 32,
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Don\'t Have an Account?',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'Register Now',
                                style: TextStyle(
                                  color: Colors.teal,
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 30,
                          vertical: 20,
                        ),
                        child: TextFormField(
                          controller: emailController,
                          validator: (value) {
                            String data = isValidEmail(value!);
                            if (data.isNotEmpty) {
                              return data;
                            }
                          },
                          decoration: const InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1,
                              ),
                            ),
                            filled: true,
                            contentPadding: EdgeInsets.all(12),
                            errorStyle: TextStyle(
                              color: Colors.black,
                            ),
                            fillColor: Colors.black45,
                            hintText: 'Enter Your Username',
                            hintStyle: TextStyle(color: Colors.white),
                          ),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: TextFormField(
                          controller: passwordController,
                          validator: (value) {
                            String data = validatePassword(value!);
                            if (data.isNotEmpty) {
                              return data;
                            }
                          },
                          obscureText: !isshow,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                              color: Colors.white,
                              onPressed: () {
                                setState(() {
                                  isshow = !isshow;
                                });
                              },
                              icon: Icon(
                                isshow
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                            ),
                            enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1,
                              ),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1,
                              ),
                            ),
                            filled: true,
                            contentPadding: const EdgeInsets.all(12),
                            fillColor: Colors.black45,
                            hintText: 'Enter Your Password',
                            hintStyle: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                            errorStyle: const TextStyle(
                              color: Colors.black,
                              fontSize: 10,
                            ),
                          ),
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 30,
                          vertical: 20,
                        ),
                        child: TextFormField(
                          controller: confirmpasswordController,
                          obscureText: !isshow1,
                          validator: (value) {
                            if (value != passwordController.text) {
                              return 'Password and confirm password should be same';
                            } else {
                              String data = validatePassword(value!);
                              if (data.isNotEmpty) {
                                return data;
                              }
                            }
                          },
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                              color: Colors.white,
                              onPressed: () {
                                setState(() {
                                  isshow1 = !isshow1;
                                });
                              },
                              icon: Icon(
                                isshow1
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                            ),
                            enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1,
                              ),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1,
                              ),
                            ),
                            filled: true,
                            fillColor: Colors.black45,
                            contentPadding: const EdgeInsets.all(12),
                            hintText: 'Enter Your Confirm Password',
                            hintStyle: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                            errorStyle: const TextStyle(
                              color: Colors.black,
                              fontSize: 10,
                            ),
                          ),
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: size.width * 0.6,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            minimumSize: WidgetStateProperty.all<Size>(
                              const Size(double.infinity, 50),
                            ),
                            shape: WidgetStateProperty.all<OutlinedBorder>(
                              BeveledRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                          ),
                          onPressed: () {
                            if (formkey.currentState!.validate()) {
                              FlutterLogs.logInfo(
                                  "KaamConnect Assignment",
                                  "Registration",
                                  "User registered with email: ${emailController.text}");
                              emailController.text = '';
                              passwordController.text = '';
                              confirmpasswordController.text = '';
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Register success'),
                                ),
                              );
                            }
                          },
                          child: const Text(
                            'Register Now',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
