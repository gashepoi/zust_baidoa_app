import 'package:flutter/material.dart';
// Ku dar imports-ka bogagga aad u baahato
import 'student_dashboard.dart'; // Tusaale ahaan, bogga gurigaaga
import 'announcement_page.dart';
import 'about_page.dart'; // Hubi in faylkan jiro
import 'profile_menu_page.dart'; // Hubi in faylkan jiro

class AcademicScreen extends StatefulWidget {
  @override
  _AcademicScreenState createState() => _AcademicScreenState();
}

class _AcademicScreenState extends State<AcademicScreen> {
  // Index-ka hore ee la doortay (0 = Home, 1 = Announcement, etc.)
  // Maadaama boggan aanu si toos ah ugu jirin bar-ka, waxaan dhigaynaa 0 (Home)
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Cusboonaysii index-ka la doortay
    });

    // Navigation Logic
    if (index == 0) {
      // Ku noqo Dashboard-ka (ama bogga gurigaaga)
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => StudentDashboard()),
      );
    } else if (index == 1) {
      // Tag bogga Announcement
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => AnnouncementPage()),
      );
    } else if (index == 2) {
      // Tag bogga About
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => AboutPage()), // Hubi in AboutPage jiro
      );
    } else if (index == 3) {
      // Tag bogga Profile
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ProfileMenuPage()), // Hubi in ProfileMenuPage jiro
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Academic"),
        backgroundColor: Colors.blue,
        elevation: 0,
        foregroundColor: Colors.black, // Tani waxay beddeli kartaa midabka icon-ka iyo qoraalka AppBar
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black), // Si cad u dhig midabka icon-ka dambe
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10),
            Image.network(
              'https://i0.wp.com/zust.edu.so/wp-content/uploads/2022/12/2222-01.png?fit=1375%2C366&ssl=1',
            ),
            SizedBox(height: 10),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 15),
              color: Colors.blueAccent[200],
              child: Center(
                child: Text(
                  "Academic Year 2024",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  CalendarRow(months: ["January", "February", "March", "April"]),
                  CalendarRow(months: ["May", "June", "July", "August"]),
                  CalendarRow(months: ["September", "October", "November", "December"]),
                ],
              ),
            ),
            SizedBox(height: 20), // Wax yar oo bannaan ah hoosta
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blueAccent, // Midabka shayga la doortay
        unselectedItemColor: Colors.blue, // Midabka shayada aan la dooran
        onTap: _onItemTapped, // Function-ka la yeerayo marka la taabto
        type: BottomNavigationBarType.fixed, // Si dhammaan loo muujiyo qoraalada
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.announcement),
            label: 'Announcements',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'About',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

// CalendarRow iyo CalendarBox sidiisa ayey ahaanayaan (lama taaban)
class CalendarRow extends StatelessWidget {
  final List<String> months;
  CalendarRow({required this.months});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: months.map((month) => CalendarBox(month: month)).toList(),
    );
  }
}

class CalendarBox extends StatelessWidget {
  final String month;
  CalendarBox({required this.month});
  @override
  Widget build(BuildContext context) {
    // Iska hubi URL-ka sawirka meel dhigaha
    String imageUrl = 'https://via.placeholder.com/60/CCCCCC/FFFFFF?text=Cal'; // Isticmaal sawir meel dhige ah oo shaqeynaya

    return Expanded(
      child: Container(
        margin: EdgeInsets.all(4),
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.blue),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(
          children: [
            Text(
              month,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              textAlign: TextAlign.center, // Hubi in qoraalku dhexda ku jiro
            ),
            SizedBox(height: 5),
            // Isticmaal sawirka meel dhigaha ah ee la cusboonaysiiyay
            Image.network(imageUrl, height: 60, errorBuilder: (context, error, stackTrace) {
              // Haddii sawirku fashilmo, muuji calaamad
              return Icon(Icons.calendar_today, size: 60, color: Colors.grey);
            }),
          ],
        ),
      ),
    );
  }
}




// import 'package:flutter/material.dart';
// import 'student_dashboard.dart';
// import 'announcement_page.dart';
// import 'about_page.dart';
// import 'profile_menu_page.dart';
//
// class AcademicScreen extends StatefulWidget {
//   @override
//   _AcademicScreenState createState() => _AcademicScreenState();
// }
//
// class _AcademicScreenState extends State<AcademicScreen> {
//   int _selectedIndex = 0;
//
//   void _onItemTapped(int index) {
//     setState(() => _selectedIndex = index);
//
//     switch (index) {
//       case 0:
//         Navigator.pushReplacement(
//           context,
//           PageRouteBuilder(
//             pageBuilder: (_, __, ___) => StudentDashboard(),
//             transitionsBuilder: (_, a, __, c) => FadeTransition(opacity: a, child: c),
//           ),
//         );
//         break;
//       case 1:
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => AnnouncementPage()),
//         );
//         break;
//       case 2:
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => AboutPage()),
//         );
//         break;
//       case 3:
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => ProfileMenuPage()),
//         );
//         break;
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//         title: Text(
//         "Academic Calendar",
//         style: TextStyle(
//         fontSize: 18,
//         fontWeight: FontWeight.w600,
//         color: Color(0xFF333333),
//     )),
//     centerTitle: true,
//     backgroundColor: Colors.white,
//     elevation: 0.5,
//     leading: IconButton(
//     icon: Icon(Icons.arrow_back, color: Color(0xFF1677FF)),
//     onPressed: () => Navigator.pop(context),
//     ),
//     ),
//     body: SingleChildScrollView(
//     child: Column(
//     children: [
//     // University Banner
//     Container(
//     margin: EdgeInsets.all(16),
//     decoration: BoxDecoration(
//     borderRadius: BorderRadius.circular(12),
//     color: Colors.white,
//     boxShadow: [
//     BoxShadow(
//     color: Color(0xFFEEEEEE),
//     blurRadius: 8,
//     spreadRadius: 2,
//     ),
//     ],
//     ),
//     child: ClipRRect(
//     borderRadius: BorderRadius.circular(12),
//     child: Image.network(
//     'https://i0.wp.com/zust.edu.so/wp-content/uploads/2022/12/2222-01.png?fit=1375%2C366&ssl=1',
//     fit: BoxFit.cover,
//     ),
//     ),
//     ),
//
//     // Academic Year Header
//     Container(
//     width: double.infinity,
//     margin: EdgeInsets.symmetric(horizontal: 16),
//     padding: EdgeInsets.symmetric(vertical: 12),
//     decoration: BoxDecoration(
//     color: Color(0xFF1677FF),
//     borderRadius: BorderRadius.circular(8),
//     ),
//     child: Center(
//     child: Text(
//     "Academic Year 2024",
//     style: TextStyle(
//     fontSize: 16,
//     fontWeight: FontWeight.w600,
//     color: Colors.white),
//     ),
//     ),
//     ),
//
//     SizedBox(height: 24),
//
//     // Calendar Grid
//     Padding(
//     padding: EdgeInsets.symmetric(horizontal: 12),
//     child: Column(
//     children: [
//     CalendarRow(months: ["January", "February", "March", "April"]),
//     SizedBox(height: 12),
//     CalendarRow(months: ["May", "June", "July", "August"]),
//     SizedBox(height: 12),
//     CalendarRow(months: ["September", "October", "November", "December"]),
//     ],
//     ),
//     ),
//
//     SizedBox(height: 24),
//
//     // Current Semester Info
//     Container(
//     margin: EdgeInsets.symmetric(horizontal: 16),
//     padding: EdgeInsets.all(16),
//     decoration: BoxDecoration(
//     color: Colors.white,
//     borderRadius: BorderRadius.circular(12),
//     boxShadow: [
//     BoxShadow(
//     color: Color(0xFFEEEEEE),
//     blurRadius: 8,
//     spreadRadius: 2,
//     ),
//     ],
//     ),
//     child: Column(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: [
//     Text(
//     "Current Semester",
//     style: TextStyle(
//     fontSize: 16,
//     fontWeight: FontWeight.w600,
//     color: Color(0xFF333333)),
//     ),
//     SizedBox(height: 12),
//     _buildInfoRow("Start Date", "September 5, 2024"),
//     _buildInfoRow("End Date", "December 20, 2024"),
//     _buildInfoRow("Exams Period", "December 23 - 30, 2024"),
//     _buildInfoRow("Break Starts", "January 6, 2025"),
//     ],
//     ),
//     ),
//
//     SizedBox(height: 24),
//     ],
//     ),
//     ),
//     bottomNavigationBar: _buildBottomNavBar(),
//     );
//   }
//
//   Widget _buildInfoRow(String label, String value) {
//     return Padding(
//       padding: EdgeInsets.symmetric(vertical: 8),
//       child: Row(
//         children: [
//           Expanded(
//             flex: 2,
//             child: Text(
//               label,
//               style: TextStyle(
//                   fontSize: 14,
//                   color: Color(0xFF666666)),
//             ),
//           ),
//           Expanded(
//             flex: 3,
//             child: Text(
//               value,
//               style: TextStyle(
//                   fontSize: 14,
//                   fontWeight: FontWeight.w500,
//                   color: Color(0xFF333333)),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildBottomNavBar() {
//     return Container(
//       decoration: BoxDecoration(
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.1),
//             blurRadius: 10,
//             spreadRadius: 2,
//           ),
//         ],
//       ),
//       child: ClipRRect(
//         borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
//         child: BottomNavigationBar(
//           currentIndex: _selectedIndex,
//           selectedItemColor: Color(0xFF1677FF),
//           unselectedItemColor: Color(0xFF999999),
//           onTap: _onItemTapped,
//           type: BottomNavigationBarType.fixed,
//           backgroundColor: Colors.white,
//           elevation: 0,
//           selectedLabelStyle: TextStyle(fontSize: 12),
//           unselectedLabelStyle: TextStyle(fontSize: 12),
//           items: [
//             BottomNavigationBarItem(
//               icon: Icon(Icons.home_outlined),
//               activeIcon: Icon(Icons.home),
//               label: 'Home',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.announcement_outlined),
//               activeIcon: Icon(Icons.announcement),
//               label: 'Announcements',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.info_outline),
//               activeIcon: Icon(Icons.info),
//               label: 'About',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.person_outline),
//               activeIcon: Icon(Icons.person),
//               label: 'Profile',
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class CalendarRow extends StatelessWidget {
//   final List<String> months;
//
//   CalendarRow({required this.months});
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: months.map((month) => Expanded(child: CalendarBox(month: month))).toList(),
//     );
//   }
// }
//
// class CalendarBox extends StatelessWidget {
//   final String month;
//
//   CalendarBox({required this.month});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.all(4),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(8),
//         boxShadow: [
//           BoxShadow(
//             color: Color(0xFFEEEEEE),
//             blurRadius: 4,
//             spreadRadius: 1,
//           ),
//         ],
//       ),
//       child: InkWell(
//         borderRadius: BorderRadius.circular(8),
//         onTap: () {
//           // Handle month selection
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(
//               content: Text('Selected $month'),
//               behavior: SnackBarBehavior.floating,
//               shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(8)),
//             ),
//           );
//         },
//         child: Padding(
//           padding: EdgeInsets.all(12),
//           child: Column(
//               children: [
//               Text(
//               month.substring(0, 3), // Show abbreviated month
//           style: TextStyle(
//               fontSize: 14,
//               fontWeight: FontWeight.w600,
//               color: Color(0xFF333333)),
//         ),
//         SizedBox(height: 8),
//         Container(
//           width: 40,
//           height: 40,
//           decoration: BoxDecoration(
//             color: Color(0xFF1677FF).withOpacity(0.1),
//             shape: BoxShape.circle,
//           ),
//           child: Icon(
//               Icons.calendar_today,
//               size: 20,
//               color: Color(0xFF1677FF)),
//         ),
//       ],
//     ),
//     ),
//     ),
//     );
//   }
// }
