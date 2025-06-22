import 'package:flutter/material.dart';
import 'login_page.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  void _togglePasswordVisibility() {
    setState(() {
      _obscurePassword = !_obscurePassword;
    });
  }

  void _toggleConfirmPasswordVisibility() {
    setState(() {
      _obscureConfirmPassword = !_obscureConfirmPassword;
    });
  }

  void _signUp() {
    if (_formKey.currentState!.validate()) {
      // Handle signup logic here
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Signing Up...')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Colors.blue.shade100],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 0),
                Image.network(
                  'https://i0.wp.com/zust.edu.so/wp-content/uploads/2022/12/2222-01.png?fit=1375%2C366&ssl=1',
                  height: 130,
                ),
                SizedBox(height: 25),
                Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  elevation: 5,
                  shadowColor: Colors.black26,
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Create Account',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue.shade900,
                            ),
                          ),
                          SizedBox(height: 20),
                          _buildTextField(_nameController, 'Full Name', Icons.person),
                          SizedBox(height: 10),
                          _buildTextField(_emailController, 'Email', Icons.email),
                          SizedBox(height: 10),
                          _buildPasswordField(_passwordController, 'Password', _obscurePassword, _togglePasswordVisibility),
                          SizedBox(height: 10),
                          _buildPasswordField(_confirmPasswordController, 'Confirm Password', _obscureConfirmPassword, _toggleConfirmPasswordVisibility),
                          SizedBox(height: 20),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: _signUp,
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.symmetric(vertical: 14),
                                backgroundColor: Colors.blue.shade400,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: Text(
                                'Sign Up',
                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          TextButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (context) => LoginPage()),
                              );
                            },
                            child: Text(
                              'Already have an account? Login',
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.blue.shade500),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label, IconData icon) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your $label';
        }
        return null;
      },
    );
  }

  Widget _buildPasswordField(TextEditingController controller, String label, bool obscureText, VoidCallback toggleVisibility) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(Icons.lock),
        suffixIcon: IconButton(
          icon: Icon(obscureText ? Icons.visibility_off : Icons.visibility),
          onPressed: toggleVisibility,
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your $label';
        }
        if (label == 'Confirm Password' && value != _passwordController.text) {
          return 'Passwords do not match';
        }
        return null;
      },
    );
  }
}



// import 'package:flutter/material.dart';
// import 'login_page.dart';
//
// class SignUpPage extends StatefulWidget {
//   @override
//   _SignUpPageState createState() => _SignUpPageState();
// }
//
// class _SignUpPageState extends State<SignUpPage> {
//   final _formKey = GlobalKey<FormState>();
//   final TextEditingController _nameController = TextEditingController();
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _studentIdController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   final TextEditingController _confirmPasswordController = TextEditingController();
//
//   bool _obscurePassword = true;
//   bool _obscureConfirmPassword = true;
//   bool _isLoading = false;
//   bool _termsAccepted = false;
//
//   void _togglePasswordVisibility() {
//     setState(() => _obscurePassword = !_obscurePassword);
//   }
//
//   void _toggleConfirmPasswordVisibility() {
//     setState(() => _obscureConfirmPassword = !_obscureConfirmPassword);
//   }
//
//   Future<void> _signUp() async {
//     if (_formKey.currentState!.validate() && _termsAccepted) {
//       setState(() => _isLoading = true);
//
//       // Simulate network request
//       await Future.delayed(Duration(seconds: 2));
//
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('Account created successfully!'),
//           behavior: SnackBarBehavior.floating,
//           shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(8)),
//           duration: Duration(seconds: 2),
//         ),
//       );
//
//       // Navigate to login after success
//       Future.delayed(Duration(seconds: 2), () {
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(builder: (context) => LoginPage()),
//         );
//       });
//     } else if (!_termsAccepted) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('Please accept the terms and conditions'),
//           backgroundColor: Colors.red,
//         ),
//       );
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: true,
//       backgroundColor: Color(0xFFF6F9FF),
//       body: SafeArea(
//         child: SingleChildScrollView(
//           padding: EdgeInsets.symmetric(horizontal: 24),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               SizedBox(height: 24),
//
//               // Back Button
//               IconButton(
//                 icon: Icon(Icons.arrow_back, size: 24),
//                 onPressed: () => Navigator.pop(context),
//                 padding: EdgeInsets.zero,
//                 constraints: BoxConstraints(),
//               ),
//
//               SizedBox(height: 24),
//
//               // Header
//               Center(
//                 child: Column(
//                   children: [
//                     Container(
//                       width: 80,
//                       height: 80,
//                       decoration: BoxDecoration(
//                         color: Color(0xFF1677FF).withOpacity(0.1),
//                         borderRadius: BorderRadius.circular(20),
//                       ),
//                       child: Icon(
//                           Icons.person_add_alt_1,
//                           size: 40,
//                           color: Color(0xFF1677FF)),
//                     ),
//                     SizedBox(height: 16),
//                     Text(
//                       'Create Account',
//                       style: TextStyle(
//                           fontSize: 24,
//                           fontWeight: FontWeight.w600,
//                           color: Color(0xFF333333)),
//                     ),
//                     SizedBox(height: 8),
//                     Text(
//                       'Fill in your details to get started',
//                       style: TextStyle(
//                           fontSize: 14,
//                           color: Color(0xFF999999)),
//                     ),
//                   ],
//                 ),
//               ),
//
//               SizedBox(height: 32),
//
//               // Form
//               Form(
//                 key: _formKey,
//                 child: Column(
//                   children: [
//                     // Full Name
//                     TextFormField(
//                       controller: _nameController,
//                       decoration: InputDecoration(
//                         labelText: 'Full Name',
//                         prefixIcon: Icon(Icons.person_outline, size: 20),
//                         border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(8)),
//                         contentPadding: EdgeInsets.symmetric(
//                             horizontal: 16, vertical: 14),
//                       ),
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Please enter your full name';
//                         }
//                         if (value.split(' ').length < 2) {
//                           return 'Please enter your full name';
//                         }
//                         return null;
//                       },
//                     ),
//
//                     SizedBox(height: 16),
//
//                     // Email
//                     TextFormField(
//                       controller: _emailController,
//                       keyboardType: TextInputType.emailAddress,
//                       decoration: InputDecoration(
//                         labelText: 'Email',
//                         prefixIcon: Icon(Icons.email_outlined, size: 20),
//                         border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(8)),
//                         contentPadding: EdgeInsets.symmetric(
//                             horizontal: 16, vertical: 14),
//                       ),
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Please enter your email';
//                         }
//                         if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
//                           return 'Please enter a valid email';
//                         }
//                         return null;
//                       },
//                     ),
//
//                     SizedBox(height: 16),
//
//                     // Student ID
//                     TextFormField(
//                       controller: _studentIdController,
//                       keyboardType: TextInputType.number,
//                       decoration: InputDecoration(
//                         labelText: 'Student ID',
//                         prefixIcon: Icon(Icons.school_outlined, size: 20),
//                         border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(8)),
//                         contentPadding: EdgeInsets.symmetric(
//                             horizontal: 16, vertical: 14),
//                       ),
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Please enter your student ID';
//                         }
//                         if (value.length < 5) {
//                           return 'Student ID must be at least 5 digits';
//                         }
//                         return null;
//                       },
//                     ),
//
//                     SizedBox(height: 16),
//
//                     // Password
//                     TextFormField(
//                       controller: _passwordController,
//                       obscureText: _obscurePassword,
//                       decoration: InputDecoration(
//                         labelText: 'Password',
//                         prefixIcon: Icon(Icons.lock_outline, size: 20),
//                         suffixIcon: IconButton(
//                           icon: Icon(
//                             _obscurePassword
//                                 ? Icons.visibility_outlined
//                                 : Icons.visibility_off_outlined,
//                             size: 20,
//                           ),
//                           onPressed: _togglePasswordVisibility,
//                         ),
//                         border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(8)),
//                         contentPadding: EdgeInsets.symmetric(
//                             horizontal: 16, vertical: 14),
//                       ),
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Please enter a password';
//                         }
//                         if (value.length < 8) {
//                           return 'Password must be at least 8 characters';
//                         }
//                         if (!RegExp(r'^(?=.*[A-Za-z])(?=.*\d)').hasMatch(value)) {
//                           return 'Password must contain letters and numbers';
//                         }
//                         return null;
//                       },
//                     ),
//
//                     SizedBox(height: 16),
//
//                     // Confirm Password
//                     TextFormField(
//                       controller: _confirmPasswordController,
//                       obscureText: _obscureConfirmPassword,
//                       decoration: InputDecoration(
//                         labelText: 'Confirm Password',
//                         prefixIcon: Icon(Icons.lock_outline, size: 20),
//                         suffixIcon: IconButton(
//                           icon: Icon(
//                             _obscureConfirmPassword
//                                 ? Icons.visibility_outlined
//                                 : Icons.visibility_off_outlined,
//                             size: 20,
//                           ),
//                           onPressed: _toggleConfirmPasswordVisibility,
//                         ),
//                         border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(8)),
//                         contentPadding: EdgeInsets.symmetric(
//                             horizontal: 16, vertical: 14),
//                       ),
//                       validator: (value) {
//                         if (value != _passwordController.text) {
//                           return 'Passwords do not match';
//                         }
//                         return null;
//                       },
//                     ),
//
//                     SizedBox(height: 16),
//
//                     // Terms Checkbox
//                     Row(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         SizedBox(
//                           width: 24,
//                           height: 24,
//                           child: Checkbox(
//                             value: _termsAccepted,
//                             onChanged: (value) {
//                               setState(() => _termsAccepted = value ?? false);
//                             },
//                             activeColor: Color(0xFF1677FF),
//                             shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(4)),
//                           ),
//                         ),
//                         SizedBox(width: 12),
//                         Expanded(
//                           child: GestureDetector(
//                             onTap: () {
//                               // Show terms dialog
//                               showDialog(
//                                 context: context,
//                                 builder: (context) => AlertDialog(
//                                   title: Text('Terms and Conditions'),
//                                   content: SingleChildScrollView(
//                                     child: Text(
//                                       '1. Waa inaad tahay arday si rasmi ah uga tirsan jaamacadda.\n'
//                                           '2. Waa inaad haysataa aqoonsi (ID) jaamacadeed oo ansax ah.\n'
//                                           '3. Waa inaad ogolaansho rasmi ah ka haysataa xafiiska maamulka (admin) si aad u isticmaasho App-ka.\n'
//                                           '4. Waa inaad u isticmaashaa App-ka si anshax leh oo uusan ku jirin wax xad-gudub ah ama khaldan.\n'
//                                           '5. Xogtaada shaqsiga ah waa inaad si taxaddar leh u ilaalisaa, looma oggola in la wadaago ama la been abuuro.',
//
//                                       style: TextStyle(fontSize: 14),
//                                     ),
//
//                                   ),
//                                   actions: [
//                                     TextButton(
//                                       onPressed: () => Navigator.pop(context),
//                                       child: Text('Close'),
//                                     ),
//                                   ],
//                                   shape: RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.circular(12)),
//                                 ),
//                               );
//                             },
//                             child: Text.rich(
//                               TextSpan(
//                                 text: 'I agree to the ',
//                                 style: TextStyle(
//                                     fontSize: 14,
//                                     color: Color(0xFF666666)),
//                                 children: [
//                                   TextSpan(
//                                     text: 'Terms and Conditions',
//                                     style: TextStyle(
//                                         color: Color(0xFF1677FF),
//                                         fontWeight: FontWeight.w600),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//
//                     SizedBox(height: 24),
//
//                     // Sign Up Button
//                     SizedBox(
//                       width: double.infinity,
//                       child: ElevatedButton(
//                         onPressed: _isLoading ? null : _signUp,
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Color(0xFF1677FF),
//                           padding: EdgeInsets.symmetric(vertical: 16),
//                           shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(8)),
//                           elevation: 0,
//                         ),
//                         child: _isLoading
//                             ? SizedBox(
//                           width: 20,
//                           height: 20,
//                           child: CircularProgressIndicator(
//                               strokeWidth: 2,
//                               color: Colors.white),
//                         )
//                             : Text(
//                           'Create Account',
//                           style: TextStyle(
//                               fontSize: 16,
//                               fontWeight: FontWeight.w600,
//                               color: Colors.white),
//                         ),
//                       ),
//                     ),
//
//                     SizedBox(height: 24),
//
//                     // Login Prompt
//                     Center(
//                       child: GestureDetector(
//                         onTap: () {
//                           Navigator.pushReplacement(
//                             context,
//                             MaterialPageRoute(builder: (context) => LoginPage()),
//                           );
//                         },
//                         child: RichText(
//                           text: TextSpan(
//                             text: 'Already have an account? ',
//                             style: TextStyle(
//                                 color: Color(0xFF666666),
//                                 fontSize: 14),
//                             children: [
//                               TextSpan(
//                                 text: 'Log In',
//                                 style: TextStyle(
//                                     color: Color(0xFF1677FF),
//                                     fontWeight: FontWeight.w600),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(height: 24),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }