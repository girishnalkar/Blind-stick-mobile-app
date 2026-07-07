import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  String email = "";
  String password = "";
  String username = "";
  String phone = "";

  bool isLoading = false;
  bool hidePassword = true;

  void login() async {
    if (_formKey.currentState!.validate()) {
      setState(() => isLoading = true);

      await Future.delayed(Duration(seconds: 2));

      setState(() => isLoading = false);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Login Successful ✅")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 60),

                Icon(Icons.lock, size: 80, color: Colors.blue),

                SizedBox(height: 20),

                Text(
                  "Login",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),

                SizedBox(height: 20),

                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Username",
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (val) => username = val,
                  validator: (val) =>
                  val!.isEmpty ? "Enter username" : null,
                ),

                SizedBox(height: 15),

                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Email",
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (val) => email = val,
                  validator: (val) {
                    if (val!.isEmpty) return "Enter email";
                    if (!val.contains("@")) return "Invalid email";
                    return null;
                  },
                ),

                SizedBox(height: 15),

                TextFormField(
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    labelText: "Phone",
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (val) => phone = val,
                  validator: (val) =>
                  val!.length != 10 ? "Enter valid phone" : null,
                ),

                SizedBox(height: 15),

                TextFormField(
                  obscureText: hidePassword,
                  decoration: InputDecoration(
                    labelText: "Password",
                    border: OutlineInputBorder(),
                    suffixIcon: IconButton(
                      icon: Icon(hidePassword
                          ? Icons.visibility
                          : Icons.visibility_off),
                      onPressed: () {
                        setState(() {
                          hidePassword = !hidePassword;
                        });
                      },
                    ),
                  ),
                  onChanged: (val) => password = val,
                  validator: (val) {
                    if (val!.length < 6)
                      return "Password must be 6+ chars";
                    return null;
                  },
                ),

                SizedBox(height: 15),

                // ✅ FIXED BORDER
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "City",
                    border: OutlineInputBorder(),
                  ),
                  validator: (val) =>
                  val!.isEmpty ? "Enter city" : null,
                ),

                SizedBox(height: 15),

                // ✅ FIXED BORDER
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "Pincode",
                    border: OutlineInputBorder(),
                  ),
                  validator: (val) =>
                  val!.length != 6 ? "Enter valid pincode" : null,
                ),

                SizedBox(height: 15),

                // ✅ FIXED BORDER
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "Age",
                    border: OutlineInputBorder(),
                  ),
                  validator: (val) {
                    if (val!.isEmpty) return "Enter age";
                    int age = int.parse(val);
                    if (age < 18) return "Must be 18+";
                    return null;
                  },
                ),

                SizedBox(height: 20),

                ElevatedButton(
                  onPressed: isLoading ? null : login,
                  child: isLoading
                      ? SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: Colors.white,
                    ),
                  )
                      : Text("Login"),
                ),

                SizedBox(height: 10),

                TextButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Forgot Password Clicked")),
                    );
                  },
                  child: Text("Forgot Password?"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}