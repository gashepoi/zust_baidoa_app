import 'package:flutter/material.dart';
import 'signup_page.dart';
import 'student_dashboard.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _studentIdController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscurePassword = true;

  // Fake MongoDB User Data (this should come from a database)
  final Map<String, String> users = {
    '12345': 'password123',
    '67890': 'securepass'
  };

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      String studentId = _studentIdController.text;
      String password = _passwordController.text;

      if (users.containsKey(studentId) && users[studentId] == password) {
        // Login successful -> Go to Student Dashboard
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => StudentDashboard()),
        );
      } else {
        // Show error message
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Invalid Student ID or Password'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.white, Colors.blue.shade100],
                    ),
                  ),
                  child: SingleChildScrollView(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          SizedBox(height: 60),

                          // University Logo
                          Image.network(
                            'https://i0.wp.com/zust.edu.so/wp-content/uploads/2022/12/2222-01.png?fit=1375%2C366&ssl=1',
                            height: 100,
                          ),

                          SizedBox(height: 80),

                          // Input Fields
                          Container(
                            padding: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.shade300,
                                  blurRadius: 10,
                                  spreadRadius: 2,
                                )
                              ],
                            ),
                            child: Column(
                              children: [
                                // Student ID Field
                                TextFormField(
                                  controller: _studentIdController,
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(Icons.person, color: Colors.blue),
                                    hintText: 'Student ID',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide.none,
                                    ),
                                    filled: true,
                                    fillColor: Colors.grey[200],
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Student ID is required';
                                    }
                                    return null;
                                  },
                                ),
                                SizedBox(height: 15),

                                // Password Field with Show/Hide feature
                                TextFormField(
                                  controller: _passwordController,
                                  obscureText: _obscurePassword,
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(Icons.lock, color: Colors.blue),
                                    suffixIcon: IconButton(
                                      icon: Icon(
                                        _obscurePassword ? Icons.visibility : Icons.visibility_off,
                                        color: Colors.grey,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          _obscurePassword = !_obscurePassword;
                                        });
                                      },
                                    ),
                                    hintText: 'Password',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide.none,
                                    ),
                                    filled: true,
                                    fillColor: Colors.grey[200],
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Password is required';
                                    }
                                    return null;
                                  },
                                ),

                                SizedBox(height: 20),

                                // Login Button
                                ElevatedButton(
                                  onPressed: _submitForm,
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.blue,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    padding: EdgeInsets.symmetric(horizontal: 100, vertical: 12),
                                  ),
                                  child: Text(
                                    'Login',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),

                                SizedBox(height: 10),

                                TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => ForgotPasswordPage()),
                                    );
                                  },
                                  child: Text(
                                    'Forgot Password',
                                    style: TextStyle(color: Colors.red),
                                  ),
                                ),

                                SizedBox(height: 10),

                                RichText(
                                  text: TextSpan(
                                    text: "Don't have an account? ",
                                    style: TextStyle(color: Colors.black),
                                    children: [
                                      WidgetSpan(
                                        child: GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(builder: (context) => SignUpPage()),
                                            );
                                          },
                                          child: Text(
                                            "Sign Up",
                                            style: TextStyle(
                                              color: Colors.red,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ForgotPasswordPage extends StatelessWidget {
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,  // Background-ka AppBar-ka waa buluug
        title: Text(
          "Reset Password",
          style: TextStyle(color: Colors.white),  // Qoraalka "Reset Password" wuxuu noqonayaa cad
        ),
      ),
      body: SingleChildScrollView( // Ensures visibility even with keyboard open
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30), // Hoos u soo celi qoraalka 30 pixels
            Text("Enter your new password:", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            TextField(
              controller: _newPasswordController,
              decoration: InputDecoration(labelText: "New Password", border: OutlineInputBorder()),
              obscureText: true,
            ),
            SizedBox(height: 10),
            TextField(
              controller: _confirmPasswordController,
              decoration: InputDecoration(labelText: "Confirm New Password", border: OutlineInputBorder()),
              obscureText: true,
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Reset the password logic goes here
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                ),
                child: Text("Change Password", style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}




// import 'package:flutter/material.dart';
// import 'signup_page.dart';
// import 'student_dashboard.dart';
// import 'launching_page.dart'; // <-- Import LaunchingPage
// import 'package:flutter/material.dart';
//
// class ForgotPasswordPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Forgot Password")),
//       body: Center(child: Text("Forgot Password Page")),
//     );
//   }
// }
//
//
// class LoginPage extends StatefulWidget {
//   @override
//   _LoginPageState createState() => _LoginPageState();
// }
//
// class _LoginPageState extends State<LoginPage> {
//   final _formKey = GlobalKey<FormState>();
//   final TextEditingController _studentIdController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   bool _obscurePassword = true;
//   bool _isLoading = false;
//
//   // Fake MongoDB User Data (this should come from a database)
//   final Map<String, String> users = {
//     '12345': 'password123',
//     '67890': 'securepass'
//   };
//
//   Future<void> _submitForm() async {
//     if (_formKey.currentState!.validate()) {
//       setState(() => _isLoading = true);
//
//       // Simulate network delay
//       await Future.delayed(Duration(seconds: 1));
//
//       String studentId = _studentIdController.text;
//       String password = _passwordController.text;
//
//       if (users.containsKey(studentId)) {
//         if (users[studentId] == password) {
//           // Login successful
//           Navigator.pushReplacement(
//             context,
//             MaterialPageRoute(builder: (context) => StudentDashboard()),
//           );
//         } else {
//           _showErrorDialog('Incorrect Password', 'The password you entered is incorrect.');
//         }
//       } else {
//         _showErrorDialog('Account Not Found', 'No account found with this Student ID.');
//       }
//
//       setState(() => _isLoading = false);
//     }
//   }
//
//   void _showErrorDialog(String title, String message) {
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: Text(title),
//         content: Text(message),
//         actions: [
//           TextButton(
//             onPressed: () => Navigator.pop(context),
//             child: Text('OK', style: TextStyle(color: Color(0xFF1677FF))),
//           ),
//         ],
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//       onWillPop: () async {
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(builder: (context) => WelcomePage()),
//         );
//         return false;
//       },
//       child: Scaffold(
//         resizeToAvoidBottomInset: true,
//         backgroundColor: Color(0xFFF6F9FF),
//         body: SafeArea(
//           child: SingleChildScrollView(
//             padding: EdgeInsets.symmetric(horizontal: 24),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 SizedBox(height: 40),
//                 Center(
//                   child: Column(
//                     children: [
//                       Container(
//                         width: 80,
//                         height: 80,
//                         decoration: BoxDecoration(
//                           color: Color(0xFF1677FF).withOpacity(0.1),
//                           borderRadius: BorderRadius.circular(20),
//                         ),
//                         child: Icon(Icons.school, size: 40, color: Color(0xFF1677FF)),
//                       ),
//                       SizedBox(height: 16),
//                       Text(
//                         'Welcome Back',
//                         style: TextStyle(
//                           fontSize: 24,
//                           fontWeight: FontWeight.w600,
//                           color: Color(0xFF333333),
//                         ),
//                       ),
//                       SizedBox(height: 8),
//                       Text(
//                         'Sign in to continue',
//                         style: TextStyle(fontSize: 14, color: Color(0xFF999999)),
//                       ),
//                     ],
//                   ),
//                 ),
//                 SizedBox(height: 40),
//                 Form(
//                   key: _formKey,
//                   child: Column(
//                     children: [
//                       TextFormField(
//                         controller: _studentIdController,
//                         keyboardType: TextInputType.number,
//                         decoration: InputDecoration(
//                           labelText: 'Student ID',
//                           prefixIcon: Icon(Icons.person_outline, size: 20),
//                           border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
//                           contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
//                         ),
//                         validator: (value) {
//                           if (value == null || value.isEmpty) {
//                             return 'Please enter your Student ID';
//                           }
//                           return null;
//                         },
//                       ),
//                       SizedBox(height: 16),
//                       TextFormField(
//                         controller: _passwordController,
//                         obscureText: _obscurePassword,
//                         decoration: InputDecoration(
//                           labelText: 'Password',
//                           prefixIcon: Icon(Icons.lock_outline, size: 20),
//                           suffixIcon: IconButton(
//                             icon: Icon(
//                               _obscurePassword
//                                   ? Icons.visibility_outlined
//                                   : Icons.visibility_off_outlined,
//                               size: 20,
//                             ),
//                             onPressed: () {
//                               setState(() => _obscurePassword = !_obscurePassword);
//                             },
//                           ),
//                           border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
//                           contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
//                         ),
//                         validator: (value) {
//                           if (value == null || value.isEmpty) {
//                             return 'Please enter your password';
//                           }
//                           if (value.length < 6) {
//                             return 'Password must be at least 6 characters';
//                           }
//                           return null;
//                         },
//                       ),
//                       SizedBox(height: 8),
//                       Align(
//                         alignment: Alignment.centerRight,
//                         child: TextButton(
//                           onPressed: () {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(builder: (context) => ForgotPasswordPage()),
//                             );
//                           },
//                           child: Text(
//                             'Forgot Password?',
//                             style: TextStyle(color: Color(0xFF1677FF), fontSize: 14),
//                           ),
//                         ),
//                       ),
//                       SizedBox(height: 24),
//                       SizedBox(
//                         width: double.infinity,
//                         child: ElevatedButton(
//                           onPressed: _isLoading ? null : _submitForm,
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: Color(0xFF1677FF),
//                             padding: EdgeInsets.symmetric(vertical: 16),
//                             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
//                             elevation: 0,
//                           ),
//                           child: _isLoading
//                               ? SizedBox(
//                             width: 20,
//                             height: 20,
//                             child: CircularProgressIndicator(
//                               strokeWidth: 2,
//                               color: Colors.white,
//                             ),
//                           )
//                               : Text(
//                             'Sign In',
//                             style: TextStyle(
//                               fontSize: 16,
//                               fontWeight: FontWeight.w600,
//                               color: Colors.white,
//                             ),
//                           ),
//                         ),
//                       ),
//                       SizedBox(height: 24),
//                       Row(
//                         children: [
//                           Expanded(child: Divider(color: Color(0xFFEEEEEE))),
//                           Padding(
//                             padding: EdgeInsets.symmetric(horizontal: 16),
//                             child: Text(
//                               'or',
//                               style: TextStyle(color: Color(0xFF999999), fontSize: 14),
//                             ),
//                           ),
//                           Expanded(child: Divider(color: Color(0xFFEEEEEE))),
//                         ],
//                       ),
//                       SizedBox(height: 24),
//                       Center(
//                         child: GestureDetector(
//                           onTap: () {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(builder: (context) => SignUpPage()),
//                             );
//                           },
//                           child: RichText(
//                             text: TextSpan(
//                               text: 'Don\'t have an account? ',
//                               style: TextStyle(color: Color(0xFF666666), fontSize: 14),
//                               children: [
//                                 TextSpan(
//                                   text: 'Sign Up',
//                                   style: TextStyle(
//                                       color: Color(0xFF1677FF), fontWeight: FontWeight.w600),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
