import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:messenger_app/dio/api_provider.dart';
import 'package:messenger_app/registerPage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool isVisible = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff367849),
        title: Center(
          child: Text(
            "Login",
            style: TextStyle(
              fontSize: 30,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image.asset(
                    "lib/assets/OIP.jpg",
                    height: 200,
                    width: 200,
                  ),
                ),
                // child: Image(
                //   image: AssetImage("lib/assets/OIP.jpg"),
                //   height: 200,
                //   width: 200,
                // ),
                SizedBox(height: 20),
                Text(
                  "User Login",
                  style: TextStyle(
                    fontSize: 30,
                    color: Color(0xff367849),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: emailController,
                  validator: (value) {
                    bool validateEmail = RegExp(
                      '^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]',
                    ).hasMatch(value!);
                    if (value.isEmpty) return "Email must not be empty";
                    // else if (!validateEmail)
                    //   return "Invalid Email";

                    return null;
                  },
                  onChanged: (value) {
                    print(value);
                  },
                  onFieldSubmitted: (value) {
                    print(value);
                  },
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.email, color: Color(0xff367849)),
                    labelText: 'Email',
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: passwordController,
                  validator: (value) {
                    if (value!.isEmpty) return "Password must not be empty";
                    return null;
                  },
                  keyboardType: TextInputType.visiblePassword,
                  onChanged: (value) {
                    print(value);
                  },
                  onFieldSubmitted: (value) {
                    print(value);
                  },
                  obscureText: isVisible,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.lock, color: Color(0xff367849)),
                    suffixIcon: IconButton(
                      onPressed: () {
                        isVisible = !isVisible;
                        setState(() {
                          isVisible;
                        });
                      },
                      icon: Icon(
                        isVisible ? Icons.remove_red_eye : Icons.visibility_off,
                      ),
                    ),
                    labelText: 'PassWord',
                  ),
                ),

                SizedBox(height: 20),
                MaterialButton(
                  minWidth: double.infinity,
                  height: 50,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      // print(emailController.text);
                      // print(passwordController.text);
                      // await ApiProvider()
                      //     .userLoginEmail(
                      //       email: emailController.text,
                      //       password: passwordController.text,
                      //     )
                      //     .then((value) {
                      //       ScaffoldMessenger.of(context).showSnackBar(
                      //         SnackBar(content: Text("login Success")),
                      //       );
                      //     })
                      //     .catchError((error) {
                      //       ScaffoldMessenger.of(context).showSnackBar(
                      //         SnackBar(content: Text(error.toString())),
                      //       );
                      //     });
                      // formKey.currentState!.reset();
                      try {
                        await FirebaseAuth.instance.signInWithEmailAndPassword(
                          email: emailController.text,
                          password: passwordController.text,
                        );
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Login Successful")),
                        );

                        formKey.currentState!.reset();
                      } catch (e) {
                        print("Error: $e");
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Error: ${e.toString()}")),
                        );
                      }

                      // await FirebaseAuth.instance.sendPasswordResetEmail(
                      //         email: emailController.text,
                      //       );
                    }
                    // final SharedPreferences prefs =
                    //     await SharedPreferences.getInstance();
                    // String tokenfromshared = prefs.getString("token")!;
                  },
                  child: Text(
                    "Login",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  color: Color(0xff367849),
                ),
                Row(
                  children: [
                    Text(
                      "Don't have an account",
                      style: TextStyle(fontSize: 15),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Registerpage(),
                          ),
                        );
                      },
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                          color: Color(0xff367849),
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
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
}
