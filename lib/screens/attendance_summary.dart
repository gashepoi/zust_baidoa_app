// import 'package:flutter/material.dart';
// // Ku dar imports-ka bogagga aad u baahato
// import 'student_dashboard.dart'; // Tusaale ahaan, bogga gurigaaga
// import 'announcement_page.dart';
// import 'about_page.dart'; // Hubi in faylkan jiro
// import 'profile_menu_page.dart'; // Hubi in faylkan jiro
//
// class AttendanceSummary extends StatefulWidget {
//   @override
//   _AttendanceSummaryState createState() => _AttendanceSummaryState();
// }
//
// class _AttendanceSummaryState extends State<AttendanceSummary> {
//   // Index-ka hore ee la doortay (0 = Home)
//   int _selectedIndex = 0; // Sida AcademicScreen, 0 ayaan dhigaynaa
//
//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//
//     // Navigation Logic
//     if (index == 0) {
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (context) => StudentDashboard()),
//       );
//     } else if (index == 1) {
//       Navigator.push(
//         context,
//         MaterialPageRoute(builder: (context) => AnnouncementPage()),
//       );
//     } else if (index == 2) {
//       Navigator.push(
//         context,
//         MaterialPageRoute(builder: (context) => AboutPage()),
//       );
//     } else if (index == 3) {
//       Navigator.push(
//         context,
//         MaterialPageRoute(builder: (context) => ProfileMenuPage()),
//       );
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Attendance Summary"), // "summary" -> "Summary"
//         backgroundColor: Colors.blue,
//         elevation: 0,
//         // foregroundColor: Colors.black, // Ka saar ama caddaan ka dhig si icon-ka u muuqdo
//         foregroundColor: Colors.black, // Si qoraalka iyo icons-ka AppBar u caddaadaan
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back, color: Colors.black), // Hubi midabka icon-ka
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//       ),
//       body: SingleChildScrollView( // Ku dar SingleChildScrollView haddii content-ku bato
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // Center( // Looma baahna in la dhex dhigo haddii ballaca buuxa la isticmaalayo
//               //   child: Column(
//               //     children: [
//               //       SizedBox(height: 10),
//               //       Image.network(
//               //         'https://i0.wp.com/zust.edu.so/wp-content/uploads/2022/12/2222-01.png?fit=1375%2C366&ssl=1',
//               //         fit: BoxFit.contain, // Isticmaal 'contain' si logo-gu u muuqdo oo dhan
//               //         width: double.infinity,
//               //         height: 100, // Joogga hagaaji haddii loo baahdo
//               //          errorBuilder: (context, error, stackTrace) => Icon(Icons.error, size: 50),
//               //       ),
//               //       SizedBox(height: 40),
//               //     ],
//               //   ),
//               // ),
//               // Si toos ah u dhig logo-ga bilowga
//               Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 10.0),
//                 child: Image.network(
//                   'https://i0.wp.com/zust.edu.so/wp-content/uploads/2022/12/2222-01.png?fit=1375%2C366&ssl=1',
//                   fit: BoxFit.contain,
//                   width: double.infinity,
//                   height: 80, // Wax yar ka dhig dhererka
//                   errorBuilder: (context, error, stackTrace) => Center(child: Text("Logo cannot be loaded")),
//                 ),
//               ),
//               SizedBox(height: 20),
//
//               DropdownButtonFormField<String>( // Ku dar nooca <String>
//                 decoration: InputDecoration(
//                   labelText: "Select Course",
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(8), // Geeso jilicsan
//                   ),
//                   filled: true, // Ku dar fill si aad midab ugu darto
//                   fillColor: Colors.grey[100], // Midab khafiif ah
//                 ),
//                 items: [
//                   DropdownMenuItem(child: Text("Programming I"), value: "Prog1"),
//                   DropdownMenuItem(child: Text("Database Systems"), value: "DB"),
//                   DropdownMenuItem(child: Text("Networking"), value: "Net"),
//                   DropdownMenuItem(child: Text("Calculus I"), value: "Calc1"),
//                   DropdownMenuItem(child: Text("English Skills"), value: "Eng"),
//                 ],
//                 onChanged: (value) {
//                   // Halkan ku dar logic-ka marka koorso la doorto
//                   print("Selected course: $value");
//                 },
//                 value: null, // Qiimaha bilowga ah (optional)
//                 hint: Text("Dooro Maaddo"), // Qoraal tusmo ah
//               ),
//               SizedBox(height: 30), // Bannaan ku dar
//               Center(
//                 child: Text(
//                   "Heerka Maqnaashaha iyo Joogitaanka", // Turjum qoraalka (optional)
//                   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold), // Cabirka qoraalka yaree
//                   textAlign: TextAlign.center,
//                 ),
//               ),
//               SizedBox(height: 20), // Yaree bannaanka
//               // Isticmaal Card si aad u qurxiso SummaryTile
//               Card(
//                   elevation: 2,
//                   margin: EdgeInsets.symmetric(vertical: 5),
//                   child: SummaryTile(title: "Tirada Xisooyinka", value: "55", icon: Icons.calendar_today, color: Colors.purple)),
//               Card(
//                   elevation: 2,
//                   margin: EdgeInsets.symmetric(vertical: 5),
//                   child: SummaryTile(title: "Xisooyinka la Joogay", value: "53", icon: Icons.check_circle, color: Colors.green)),
//               Card(
//                   elevation: 2,
//                   margin: EdgeInsets.symmetric(vertical: 5),
//                   child: SummaryTile(title: "Xisooyinka la Maqnaa", value: "2", icon: Icons.cancel, color: Colors.red)),
//               Card(
//                   elevation: 2,
//                   margin: EdgeInsets.symmetric(vertical: 5),
//                   child: SummaryTile(title: "Boqolleyda Joogitaanka (%)", value: "96.36", icon: Icons.percent, color: Colors.blue)),
//             ],
//           ),
//         ),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: _selectedIndex,
//         selectedItemColor: Colors.blueAccent,
//         unselectedItemColor: Colors.blue,
//         onTap: _onItemTapped,
//         type: BottomNavigationBarType.fixed,
//         items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.announcement),
//             label: 'Announcements',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.info),
//             label: 'About',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.person),
//             label: 'Profile',
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// // SummaryTile sidiisa ayuu ahaanayaa laakiin waxaad ku dhex isticmaali kartaa Card sida kor ku cad
// class SummaryTile extends StatelessWidget {
//   final String title;
//   final String value;
//   final IconData icon;
//   final Color color;
//
//   SummaryTile({required this.title, required this.value, required this.icon, required this.color});
//
//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       leading: Icon(icon, color: color, size: 30), // Weynee icon-ka
//       title: Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)), // Weynee qoraalka
//       trailing: Text(
//         value,
//         style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: color), // Weynee oo midabe qiimaha
//       ),
//       contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8), // Habee padding-ka
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'student_dashboard.dart';
import 'announcement_page.dart';
import 'about_page.dart';
import 'profile_menu_page.dart';

class AttendanceSummary extends StatefulWidget {
  @override
  _AttendanceSummaryState createState() => _AttendanceSummaryState();
}

class _AttendanceSummaryState extends State<AttendanceSummary> {
  int _selectedIndex = 0;
  String? _selectedCourse;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    if (index == 0) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => StudentDashboard()),
      );
    } else if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => AnnouncementPage()),
      );
    } else if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => AboutPage()),
      );
    } else if (index == 3) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ProfileMenuPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Attendance Summary",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 1,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black87),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Logo with better spacing
              Padding(
                padding: const EdgeInsets.only(bottom: 24.0),
                child: Center(
                  child: Image.network(
                    'https://i0.wp.com/zust.edu.so/wp-content/uploads/2022/12/2222-01.png?fit=1375%2C366&ssl=1',
                    height: 60,
                    errorBuilder: (context, error, stackTrace) =>
                        Icon(Icons.school, size: 50, color: Colors.blue),
                  ),
                ),
              ),

              // Course selection with improved styling
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 6,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    labelText: "Select Course",
                    labelStyle: TextStyle(color: Colors.black54),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 14,
                    ),
                  ),
                  items: [
                    DropdownMenuItem(
                        child: Text("Programming I",
                            style: TextStyle(fontSize: 15)),
                        value: "Prog1"),
                    DropdownMenuItem(
                        child: Text("Database Systems",
                            style: TextStyle(fontSize: 15)),
                        value: "DB"),
                    DropdownMenuItem(
                        child: Text("Networking",
                            style: TextStyle(fontSize: 15)),
                        value: "Net"),
                    DropdownMenuItem(
                        child: Text("Calculus I",
                            style: TextStyle(fontSize: 15)),
                        value: "Calc1"),
                    DropdownMenuItem(
                        child: Text("English Skills",
                            style: TextStyle(fontSize: 15)),
                        value: "Eng"),
                  ],
                  onChanged: (value) {
                    setState(() {
                      _selectedCourse = value;
                    });
                  },
                  value: _selectedCourse,
                  hint: Text("Select a course",
                      style: TextStyle(color: Colors.black54)),
                  icon: Icon(Icons.keyboard_arrow_down),
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black87,
                  ),
                  dropdownColor: Colors.white,
                ),
              ),

              SizedBox(height: 32),

              // Title with better typography
              Center(
                child: Text(
                  "Attendance and Presence Level",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
              ),

              SizedBox(height: 24),

              // Stats cards with improved design
              _buildStatCard(
                icon: Icons.calendar_today,
                color: Color(0xFF6A1B9A),
                title: "Total Sessions",
                value: "55",
              ),

              SizedBox(height: 12),

              _buildStatCard(
                icon: Icons.check_circle,
                color: Color(0xFF2E7D32),
                title: "Attended Sessions",
                value: "53",
              ),

              SizedBox(height: 12),

              _buildStatCard(
                icon: Icons.cancel,
                color: Color(0xFFC62828),
                title: "Absent Sessions",
                value: "2",
              ),

              SizedBox(height: 12),

              _buildStatCard(
                icon: Icons.percent,
                color: Color(0xFF1565C0),
                title: "Attendance Percentage",
                value: "96.36%",
              ),

              SizedBox(height: 24),

              // Visualization section
              if (_selectedCourse != null) ...[
                Text(
                  "Attendance Trend",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 16),
                Container(
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 6,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      "Attendance chart visualization",
                      style: TextStyle(color: Colors.black54),
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildStatCard({
    required IconData icon,
    required Color color,
    required String title,
    required String value,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 6,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: ListTile(
        leading: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: color, size: 24),
        ),
        title: Text(title,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        ),
        trailing: Text(value,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: color,
          ),
        ),
        contentPadding: EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Color(0xFF1976D2),
        unselectedItemColor: Colors.black54,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        elevation: 0,
        selectedLabelStyle: TextStyle(fontSize: 12),
        unselectedLabelStyle: TextStyle(fontSize: 12),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.announcement_outlined),
            activeIcon: Icon(Icons.announcement),
            label: 'Announcements',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info_outline),
            activeIcon: Icon(Icons.info),
            label: 'About',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}