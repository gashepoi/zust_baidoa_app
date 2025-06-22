// import 'package:flutter/material.dart';
// import 'login_page.dart';
//
// class WelcomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             // University Logo
//             Padding(
//               padding: const EdgeInsets.only(top: 0),
//               child: Image.network(
//                 'https://i0.wp.com/zust.edu.so/wp-content/uploads/2022/12/2222-01.png?fit=1375%2C366&ssl=1',
//                 height: 110,
//               ),
//             ),
//
//             SizedBox(height: 50),
//
//             // Illustration Image
//             Image.network(
//               'https://miro.medium.com/v2/resize:fit:662/1*6FbgyQ99RP7XgiXBxXc4Sg.png',
//               height: 230,
//             ),
//
//             SizedBox(height: 40),
//
//             // Progress Indicator
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 40),
//               child: LinearProgressIndicator(
//                 value: 0.6,
//                 backgroundColor: Colors.grey[300],
//                 color: Colors.blue,
//                 minHeight: 7,
//               ),
//             ),
//
//             SizedBox(height: 50),
//
//             // Text
//             Text(
//               'Start Learning Today',
//               style: TextStyle(
//                 fontSize: 30,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.black,
//               ),
//             ),
//
//             SizedBox(height: 15),
//
//             // Apply Now Button
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => LoginPage()),
//                 );
//               },
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.blue,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(30),
//                 ),
//                 padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
//               ),
//               child: Text(
//                 'Apply Now',
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 20,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// void main() {
//   runApp(MaterialApp(
//     debugShowCheckedModeBanner: false,
//     home: WelcomePage(),
//   ));
// }


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'login_page.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacityAnimation;
  late Animation<double> _scaleAnimation;
  late Animation<double> _progressAnimation;
  late Animation<Offset> _textSlideAnimation;

  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);

    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 2000),
    );

    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.0, 0.6, curve: Curves.easeInOut),
      ),
    );

    _scaleAnimation = Tween<double>(begin: 0.7, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.2, 0.8, curve: Curves.elasticOut),
      ),
    );

    _progressAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.5, 1.0, curve: Curves.easeInOut),
      ),
    );

    _textSlideAnimation = Tween<Offset>(
      begin: Offset(0, 0.5),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.4, 0.8, curve: Curves.easeOutBack),
      ),
    );

    _controller.forward();
  }

  void _navigateToLogin() {
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => LoginPage(),
        transitionsBuilder: (_, a, __, c) => FadeTransition(
          opacity: a,
          child: c,
        ),
        transitionDuration: Duration(milliseconds: 600),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1677FF),
      body: SafeArea(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Stack(
              children: [
                // Background elements
                Positioned(
                  top: -50,
                  right: -50,
                  child: Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                Positioned(
                  bottom: -100,
                  left: -50,
                  child: Container(
                    width: 300,
                    height: 300,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.05),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),

                // Main content
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // University Logo with animation
                        Opacity(
                          opacity: _opacityAnimation.value,
                          child: Transform.scale(
                            scale: _scaleAnimation.value,
                            child: Container(
                              width: 350,
                              height: 110,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(24),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    blurRadius: 20,
                                    spreadRadius: 2,
                                  ),
                                ],
                              ),
                              padding: EdgeInsets.all(0),
                              child: Image.network(
                                'https://i0.wp.com/zust.edu.so/wp-content/uploads/2022/12/2222-01.png',
                                fit: BoxFit.contain,
                                errorBuilder: (_, __, ___) => Icon(
                                  Icons.school,
                                  size: 0,
                                  color: Color(0xFF1677FF),
                                ),
                              ),
                            ),
                          ),
                        ),

                        SizedBox(height: 40),

                        // Welcome text with slide animation
                        SlideTransition(
                          position: _textSlideAnimation,
                          child: Opacity(
                            opacity: _opacityAnimation.value,
                            child: Column(
                              children: [
                                Text(
                                  'Welcome to',
                                  style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white.withOpacity(0.9),
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  'Zamzam University\n'
                                      'Baidoa-Campus',
                                  textAlign: TextAlign.center, // <- Kani ayaa center dhigaya
                                  style: TextStyle(
                                    fontSize: 38,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),

                              ],
                            ),
                          ),
                        ),

                        SizedBox(height: 50),

                        // Progress Indicator
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 50),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(6),
                            child: LinearProgressIndicator(
                              value: _progressAnimation.value,
                              backgroundColor: Colors.white.withOpacity(0.3),
                              color: Colors.white,
                              minHeight: 8,
                            ),
                          ),
                        ),

                        SizedBox(height: 60),

                        // Get Started Button
                        if (_progressAnimation.value > 0.5)
                          FadeTransition(
                            opacity: Tween<double>(begin: 0, end: 1).animate(
                              CurvedAnimation(
                                parent: _controller,
                                curve: Interval(0.6, 1.0, curve: Curves.easeIn),
                              ),
                            ),
                            child: ScaleTransition(
                              scale: Tween<double>(begin: 0.8, end: 1.0).animate(
                                CurvedAnimation(
                                  parent: _controller,
                                  curve: Interval(0.6, 1.0, curve: Curves.easeOutBack),
                                ),
                              ),
                              child: ElevatedButton(
                                onPressed: _navigateToLogin,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  foregroundColor: Color(0xFF1677FF),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 40,
                                    vertical: 16,
                                  ),
                                  elevation: 5,
                                  shadowColor: Colors.black.withOpacity(0.8),
                                ),
                                child: Text(
                                  'Get Started',
                                  style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
