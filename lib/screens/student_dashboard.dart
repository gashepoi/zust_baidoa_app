import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// Hubi in dhammaan faylashan ay jiraan project-gaaga
import 'result_view_screen.dart';
import 'announcement_page.dart';
import 'attendance_summary.dart';
import 'academic_screen.dart';
import 'profile_menu_page.dart';
import 'settings_page.dart';
import 'event_page.dart'; // Loo baahan yahay index 1
import 'about_page.dart'; // Loo baahan yahay index 2

class StudentDashboard extends StatefulWidget {
  @override
  _StudentDashboardState createState() => _StudentDashboardState();
}

class _StudentDashboardState extends State<StudentDashboard> {
  final int _selectedIndex = 0; // Had iyo jeer waa 0 boggan

  void _onItemTapped(int index) {
    if (index == _selectedIndex) return; // Haddii isla index la taabto, waxba ha samayn

    if (index == 1) { // Index 1 -> EventPage
      Navigator.push(context, MaterialPageRoute(builder: (context) => EventPage()));
    } else if (index == 2) { // Index 2 -> AboutPage
      Navigator.push(context, MaterialPageRoute(builder: (context) => AboutPage()));
    } else if (index == 3) { // Index 3 -> ProfileMenuPage
      Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileMenuPage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Zamzam University"),
        backgroundColor: Colors.blue,
      ),
      drawer: Drawer( // Drawer sidii hore (adigoo xusuusanaya faallada Logout)
        child: ListView(
          padding: EdgeInsets.zero,
          children:  [
            UserAccountsDrawerHeader(accountName: Text("Student Name"), accountEmail: Text("student@zamzam.edu"), currentAccountPicture: CircleAvatar(backgroundColor: Colors.white, child: Icon(Icons.person, size: 50, color: Colors.blueAccent)), decoration: BoxDecoration(color: Colors.blue)),
            ListTile(leading: Icon(Icons.dashboard, color: Colors.blueAccent), title: Text("Dashboard"), onTap: () => Navigator.pop(context)), // Looma baahna navigation dheeri ah
            ListTile(leading: Icon(Icons.person, color: Colors.blueAccent), title: Text("Profile"), onTap: () { Navigator.pop(context); Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileMenuPage())); }),
            ListTile(leading: Icon(Icons.settings, color: Colors.blueAccent), title: Text("Settings"), onTap: () { Navigator.pop(context); Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsPage())); }),
            Divider(),
            ListTile(leading: Icon(Icons.logout, color: Colors.red), title: Text("Logout"), onTap: () { Navigator.pop(context); SystemNavigator.pop(); /* Laguuma Taliyo */ }),
          ],
        ),
      ),
      body: SingleChildScrollView( // Body sidii hore
        child: Column(
          children: [
            Padding(padding: const EdgeInsets.symmetric(vertical: 15.0), child: Image.network('https://i0.wp.com/zust.edu.so/wp-content/uploads/2022/12/2222-01.png?fit=1375%2C366&ssl=1', fit: BoxFit.contain, width: double.infinity, height: 110, errorBuilder: (context, error, stackTrace) => Container(height: 110, child: Center(child: Icon(Icons.broken_image, color: Colors.grey, size: 50))))),
            Text("Student Dashboard", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.blue[800])),
            SizedBox(height: 5),
            Text("Connects Learning To Real Life", style: TextStyle(fontSize: 15, color: Colors.grey[600])),
            SizedBox(height: 20),
            GridView.count(
              crossAxisCount: 2, shrinkWrap: true, physics: NeverScrollableScrollPhysics(), padding: EdgeInsets.all(16), crossAxisSpacing: 16, mainAxisSpacing: 16,
              children: [
                _buildDashboardTile(Icons.receipt_long, "Result View", () => Navigator.push(context, MaterialPageRoute(builder: (context) => ResultViewScreen()))),
                _buildDashboardTile(Icons.campaign, "Announcement", () => Navigator.push(context, MaterialPageRoute(builder: (context) => AnnouncementPage()))),
                _buildDashboardTile(Icons.check_circle_outline, "Attendance", () => Navigator.push(context, MaterialPageRoute(builder: (context) => AttendanceSummary()))),
                _buildDashboardTile(Icons.school_outlined, "Academic", () => Navigator.push(context, MaterialPageRoute(builder: (context) => AcademicScreen()))),
              ],
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
      // BottomNavigationBar oo loo beddelay HABKA CAADIGA AH
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.blue[600], // Midab yar oo khafiif ah
        backgroundColor: Colors.white,
        currentIndex: _selectedIndex, // Waa 0 boggan
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed, // Muhiim ah si dhammaan labels u muuqdaan
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home', // Hadda label waa la isticmaalayaa
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.announcement), // La waafajiyay navigation-ka (EventPage)
            label: 'Announcement', // La waafajiyay navigation-ka
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info), // Icon la hagaajiyay
            label: 'About',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person), // Icon la hagaajiyay
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  // Function-kan _buildIconWithText LOOMA BAAHNA HADDAN
  // Widget _buildIconWithText(IconData icon, String text) { ... }

  // Helper widget ee Kaararka Dashboard-ka (sidii hore)
  Widget _buildDashboardTile(IconData icon, String title, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 4,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 45, color: Colors.blue[700]),
            SizedBox(height: 12),
            Text(title, textAlign: TextAlign.center, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
          ],
        ),
      ),
    );
  }
}



// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'result_view_screen.dart';
// import 'announcement_page.dart';
// import 'attendance_summary.dart';
// import 'academic_screen.dart';
// import 'profile_menu_page.dart';
// import 'settings_page.dart';
// import 'event_page.dart';
// import 'about_page.dart';
// import 'login_page.dart';
//
// class StudentDashboard extends StatefulWidget {
//   @override
//   _StudentDashboardState createState() => _StudentDashboardState();
// }
//
// class _StudentDashboardState extends State<StudentDashboard> {
//   int _selectedIndex = 0;
//
//   void _onItemTapped(int index) {
//     if (index == _selectedIndex) return;
//     setState(() => _selectedIndex = index);
//     switch (index) {
//       case 1:
//         _navigateTo(EventPage());
//         break;
//       case 2:
//         _navigateTo(AboutPage());
//         break;
//       case 3:
//         _navigateTo(ProfileMenuPage());
//         break;
//     }
//   }
//
//   void _navigateTo(Widget page) {
//     Navigator.push(
//       context,
//       MaterialPageRoute(builder: (context) => page),
//     );
//   }
//
//   Future<bool> _onWillPop() async {
//     Navigator.pushReplacement(
//       context,
//       MaterialPageRoute(builder: (context) => LoginPage()),
//     );
//     return false;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//       onWillPop: _onWillPop,
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text(
//             "Zamzam University",
//             style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//           ),
//           backgroundColor: Colors.blue[700],
//           elevation: 0,
//           iconTheme: IconThemeData(color: Colors.white),
//         ),
//         drawer: _buildDrawer(),
//         body: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               _buildHeader(),
//               _buildQuickStats(),
//               _buildQuickAccess(),
//               _buildRecentAnnouncements(),
//               SizedBox(height: 20),
//             ],
//           ),
//         ),
//         bottomNavigationBar: _buildBottomNavBar(),
//       ),
//     );
//   }
//
//   Widget _buildHeader() {
//     return Container(
//       padding: EdgeInsets.symmetric(vertical: 24, horizontal: 16),
//       decoration: BoxDecoration(
//         color: Colors.blue[700],
//         borderRadius: BorderRadius.only(
//           bottomLeft: Radius.circular(20),
//           bottomRight: Radius.circular(20),
//         ),
//       ),
//       child: Column(
//         children: [
//           ClipRRect(
//             borderRadius: BorderRadius.circular(14),
//             child: Container(
//               color: Colors.white, // Background color here
//               child: Image.network(
//                 'https://i0.wp.com/zust.edu.so/wp-content/uploads/2022/12/2222-01.png',
//                 fit: BoxFit.contain,
//                 width: double.infinity,
//                 height: 100,
//                 errorBuilder: (context, error, stackTrace) => Container(
//                   height: 80,
//                   color: Colors.white,
//                   child: Center(
//                     child: Icon(Icons.school, color: Colors.black, size: 40),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           SizedBox(height: 16),
//           Text(
//             "Student Dashboard",
//             style: TextStyle(
//               fontSize: 20,
//               fontWeight: FontWeight.bold,
//               color: Colors.white,
//             ),
//           ),
//           SizedBox(height: 4),
//           Text(
//             "Connects Learning To Real Life",
//             style: TextStyle(fontSize: 14, color: Colors.white.withOpacity(0.9)),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildQuickStats() {
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           _buildStatCard("Courses", "5", Icons.book, Colors.orange),
//           _buildStatCard("Attendance", "92%", Icons.check_circle, Colors.green),
//           _buildStatCard("CGPA", "3.8", Icons.star, Colors.purple),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildStatCard(String title, String value, IconData icon, Color color) {
//     return Container(
//       width: 100,
//       padding: EdgeInsets.all(12),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(12),
//         boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 2))],
//       ),
//       child: Column(
//         children: [
//           Container(
//             padding: EdgeInsets.all(8),
//             decoration: BoxDecoration(color: color.withOpacity(0.2), shape: BoxShape.circle),
//             child: Icon(icon, color: color, size: 20),
//           ),
//           SizedBox(height: 8),
//           Text(value, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//           Text(title, style: TextStyle(fontSize: 12, color: Colors.grey[600])),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildQuickAccess() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Padding(
//           padding: EdgeInsets.symmetric(horizontal: 16),
//           child: Text(
//             "Quick Access",
//             style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black87),
//           ),
//         ),
//         SizedBox(height: 8),
//         GridView.count(
//           crossAxisCount: 2,
//           shrinkWrap: true,
//           physics: NeverScrollableScrollPhysics(),
//           padding: EdgeInsets.all(16),
//           crossAxisSpacing: 16,
//           mainAxisSpacing: 16,
//           children: [
//             _buildDashboardTile(Icons.assignment, "Result View", Colors.blue,
//                     () => _navigateTo(ResultViewScreen())),
//             _buildDashboardTile(Icons.announcement, "Announcement", Colors.orange,
//                     () => _navigateTo(AnnouncementPage())),
//             _buildDashboardTile(Icons.check_circle, "Attendance", Colors.green,
//                     () => _navigateTo(AttendanceSummary())),
//             _buildDashboardTile(Icons.school, "Academic", Colors.purple,
//                     () => _navigateTo(AcademicScreen())),
//           ],
//         ),
//       ],
//     );
//   }
//
//   Widget _buildDashboardTile(IconData icon, String title, Color color, VoidCallback onTap) {
//     return Card(
//       elevation: 2,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//       child: InkWell(
//         borderRadius: BorderRadius.circular(12),
//         onTap: onTap,
//         child: Padding(
//           padding: EdgeInsets.all(16),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Container(
//                 padding: EdgeInsets.all(12),
//                 decoration: BoxDecoration(color: color.withOpacity(0.2), borderRadius: BorderRadius.circular(12)),
//                 child: Icon(icon, size: 30, color: color),
//               ),
//               SizedBox(height: 12),
//               Text(title, textAlign: TextAlign.center, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildRecentAnnouncements() {
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: 16),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text("Recent Announcements",
//                   style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black87)),
//               TextButton(
//                 onPressed: () => _navigateTo(AnnouncementPage()),
//                 child: Text("View All"),
//               ),
//             ],
//           ),
//           SizedBox(height: 8),
//           _buildAnnouncementItem("Exam Schedule", "Final exam schedule has been published", "2h ago"),
//           _buildAnnouncementItem("Holiday Notice", "University will remain closed on Friday", "1d ago"),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildAnnouncementItem(String title, String subtitle, String time) {
//     return Card(
//       margin: EdgeInsets.only(bottom: 12),
//       elevation: 1,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
//       child: ListTile(
//         contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//         leading: Container(
//           padding: EdgeInsets.all(8),
//           decoration: BoxDecoration(color: Colors.blue[50], shape: BoxShape.circle),
//           child: Icon(Icons.campaign, color: Colors.blue[700], size: 20),
//         ),
//         title: Text(title, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
//         subtitle: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             SizedBox(height: 4),
//             Text(subtitle, style: TextStyle(fontSize: 12)),
//             SizedBox(height: 4),
//             Text(time, style: TextStyle(fontSize: 10, color: Colors.grey)),
//           ],
//         ),
//         onTap: () => _navigateTo(AnnouncementPage()),
//       ),
//     );
//   }
//
//   Widget _buildDrawer() {
//     return Drawer(
//       child: ListView(
//         padding: EdgeInsets.zero,
//         children: [
//           UserAccountsDrawerHeader(
//             accountName: Text("Student Name", style: TextStyle(fontWeight: FontWeight.bold)),
//             accountEmail: Text("student@zamzam.edu"),
//             currentAccountPicture: CircleAvatar(
//               backgroundColor: Colors.white,
//               child: Icon(Icons.person, size: 40, color: Colors.blue[700]),
//             ),
//             decoration: BoxDecoration(color: Colors.blue[700]),
//           ),
//           _buildDrawerItem(Icons.dashboard, "Dashboard", onTap: () => Navigator.pop(context)),
//           _buildDrawerItem(Icons.person, "Profile", onTap: () => _navigateTo(ProfileMenuPage())),
//           _buildDrawerItem(Icons.settings, "Settings", onTap: () => _navigateTo(SettingsPage())),
//           Divider(),
//           _buildDrawerItem(Icons.logout, "Logout", color: Colors.red, onTap: () {
//             Navigator.pushReplacement(
//               context,
//               MaterialPageRoute(builder: (context) => LoginPage()),
//             );
//           }),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildDrawerItem(IconData icon, String title, {Color? color, VoidCallback? onTap}) {
//     return ListTile(
//       leading: Icon(icon, color: color ?? Colors.blue[700]),
//       title: Text(title, style: TextStyle(color: color ?? Colors.black87)),
//       onTap: onTap,
//     );
//   }
//
//   Widget _buildBottomNavBar() {
//     return BottomNavigationBar(
//       items: const [
//         BottomNavigationBarItem(icon: Icon(Icons.home_outlined), activeIcon: Icon(Icons.home), label: 'Home'),
//         BottomNavigationBarItem(icon: Icon(Icons.event_note_outlined), activeIcon: Icon(Icons.event_note), label: 'Events'),
//         BottomNavigationBarItem(icon: Icon(Icons.info_outline), activeIcon: Icon(Icons.info), label: 'About'),
//         BottomNavigationBarItem(icon: Icon(Icons.person_outline), activeIcon: Icon(Icons.person), label: 'Profile'),
//       ],
//       currentIndex: _selectedIndex,
//       selectedItemColor: Colors.blue[700],
//       unselectedItemColor: Colors.grey[600],
//       selectedFontSize: 12,
//       unselectedFontSize: 12,
//       type: BottomNavigationBarType.fixed,
//       onTap: _onItemTapped,
//     );
//   }
// }

