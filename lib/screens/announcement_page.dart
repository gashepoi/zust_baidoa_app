import 'package:flutter/material.dart';
// Ku dar imports-ka bogagga aad u baahato
import 'student_dashboard.dart'; // Tusaale ahaan, bogga gurigaaga
import 'announcement_page.dart'; // Isaga laftiisa (looma baahna in la riixo haddii uu yahay bogga hadda)
import 'about_page.dart'; // Hubi in faylkan jiro
import 'profile_menu_page.dart'; // Hubi in faylkan jiro

class AnnouncementPage extends StatefulWidget {
  @override
  _AnnouncementPageState createState() => _AnnouncementPageState();
}

class _AnnouncementPageState extends State<AnnouncementPage> {
  // Index-ka hore ee la doortay (1 = Announcement)
  int _selectedIndex = 1; // Halkan dhig 1 sababtoo ah waa bogga Announcement

  final List<Map<String, String>> announcements = [
    {"title": "Furitaanka Sanadka", "date": "Feb 10, 2025", "description": "Sanad dugsiyeedka cusub wuxuu bilaabanayaa Febraayo 10-keeda."},
    {"title": "Imtixaanka Semester-ka", "date": "March 15, 2025", "description": "Imtixaanka semester-ka wuxuu dhici doonaa bisha Maarso 15-keeda."},
    {"title": "Fasaxa Dheer", "date": "June 01, 2025", "description": "Fasaxa xagaaga wuxuu bilaabanayaa Juun 1-deeda."},
  ];

  void _onItemTapped(int index) {
    // Haddii index-ka la doortay uu yahay kan hadda (1), waxba ha samayn
    if (index == _selectedIndex) return;

    setState(() {
      _selectedIndex = index;
    });

    // Navigation Logic
    if (index == 0) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => StudentDashboard()),
      );
    } else if (index == 1) {
      // Waxba ha samayn maadaama aad horey ugu jirtay boggan
      // Laakiin haddii aad rabto in aad dib u cusboonaysiiso, waad samayn kartaa:
      // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => AnnouncementPage()));
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
        title: Text("Announcement"),
        backgroundColor: Colors.blue,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black), // Si cad u dhig midabka
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              padding: EdgeInsets.all(10),
              child: ClipRRect( // Isticmaal ClipRRect si aad geesaha u jilciso
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  'https://i0.wp.com/zust.edu.so/wp-content/uploads/2022/12/2222-01.png?fit=1375%2C366&ssl=1',
                  // height: 120, // Dhererka iskiis ayuu ula qabsan karaa fit: BoxFit.cover
                  fit: BoxFit.cover, // Si uu u buuxiyo booska la siiyay
                  width: double.infinity, // Si uu ballaca u qaato
                  errorBuilder: (context, error, stackTrace) => Icon(Icons.error, size: 50), // Muuji haddii qalad dhaco
                ),
              ),
            ),
          ),
          SizedBox(height: 15),
          Expanded(
            child: ListView.builder(
              itemCount: announcements.length,
              itemBuilder: (context, index) {
                final announcement = announcements[index];
                // Hubi in sawirka icon-ka uu shaqaynayo
                String iconUrl = 'https://cdn-icons-png.flaticon.com/512/2278/2278992.png';
                return Card(
                  margin: EdgeInsets.symmetric(horizontal: 15, vertical: 8), // Wax ka beddel margin-ka
                  elevation: 3, // Hoos yar sii
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)), // Geeso jilicsan
                  child: ListTile(
                    contentPadding: EdgeInsets.all(15), // Kordhi padding-ka gudaha
                    title: Text(announcement["title"]!, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)), // Weynee qoraalka
                    subtitle: Padding( // Ku dar padding yar qoraalka hoose
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Taariikh: ${announcement["date"]}"),
                          SizedBox(height: 5),
                          Text(announcement["description"]!),
                        ],
                      ),
                    ),
                    leading: Image.network(
                      iconUrl,
                      height: 40, // Weynee icon-ka
                      width: 40,
                      errorBuilder: (context, error, stackTrace) => Icon(Icons.campaign, size: 40, color: Colors.blue), // Icon kale haddii URL fashilmo
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 10), // Bannaan yar ka hor BottomNavBar
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.blue,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
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


// import 'package:flutter/material.dart';
// import 'student_dashboard.dart';
// import 'about_page.dart';
// import 'profile_menu_page.dart';
//
// class AnnouncementPage extends StatefulWidget {
//   @override
//   _AnnouncementPageState createState() => _AnnouncementPageState();
// }
//
// class _AnnouncementPageState extends State<AnnouncementPage> {
//   int _selectedIndex = 1;
//
//   final List<Map<String, dynamic>> announcements = [
//     {
//       "title": "Academic Year Opening",
//       "date": "Feb 10, 2025",
//       "description": "The new academic year will begin on February 10th...",
//       "category": "Academic",
//       "isImportant": true
//     },
//     {
//       "title": "Semester Exams Schedule",
//       "date": "March 15, 2025",
//       "description": "Semester exams will be held from March 15th...",
//       "category": "Examination",
//       "isImportant": false
//     },
//     {
//       "title": "Summer Break",
//       "date": "June 01, 2025",
//       "description": "Summer break will start from June 1st...",
//       "category": "Holiday",
//       "isImportant": false
//     },
//     {
//       "title": "Library Renovation",
//       "date": "April 05, 2025",
//       "description": "The central library will be closed for renovation...",
//       "category": "Facility",
//       "isImportant": true
//     },
//   ];
//
//   void _onItemTapped(int index) {
//     if (index == _selectedIndex) return;
//
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
//       case 2:
//         Navigator.push(context, MaterialPageRoute(builder: (context) => AboutPage()));
//         break;
//       case 3:
//         Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileMenuPage()));
//         break;
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false, // ✅ Prevent hiding BottomNavigationBar
//       appBar: AppBar(
//         title: Text("Announcements",
//             style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Color(0xFF333333))),
//         centerTitle: true,
//         backgroundColor: Colors.white,
//         elevation: 0.5,
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back, color: Color(0xFF1677FF)),
//           onPressed: () => Navigator.pop(context),
//         ),
//       ),
//       body: Column(
//         children: [
//           // Banner
//           Container(
//             margin: EdgeInsets.all(16),
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(12),
//               color: Colors.white,
//               boxShadow: [
//                 BoxShadow(color: Color(0xFFEEEEEE), blurRadius: 8, spreadRadius: 2),
//               ],
//             ),
//             child: ClipRRect(
//               borderRadius: BorderRadius.circular(12),
//               child: Image.network(
//                 'https://i0.wp.com/zust.edu.so/wp-content/uploads/2022/12/2222-01.png?fit=1375%2C366&ssl=1',
//                 fit: BoxFit.cover,
//                 height: 100,
//               ),
//             ),
//           ),
//
//           // Filter Chips
//           Container(
//             height: 50,
//             child: ListView(
//               scrollDirection: Axis.horizontal,
//               padding: EdgeInsets.symmetric(horizontal: 16),
//               children: [
//                 _buildFilterChip("All"),
//                 _buildFilterChip("Academic"),
//                 _buildFilterChip("Examination"),
//                 _buildFilterChip("Holiday"),
//                 _buildFilterChip("Facility"),
//               ],
//             ),
//           ),
//
//           // Announcement list
//           Expanded(
//             child: ListView.separated(
//               padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//               itemCount: announcements.length,
//               separatorBuilder: (_, __) => SizedBox(height: 12),
//               itemBuilder: (_, index) => _buildAnnouncementCard(announcements[index]),
//             ),
//           ),
//         ],
//       ),
//       bottomNavigationBar: _buildBottomNavBar(), // ✅ Always visible
//     );
//   }
//
//   Widget _buildFilterChip(String label) {
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: 4),
//       child: FilterChip(
//         label: Text(label),
//         selected: label == "All",
//         onSelected: (bool selected) {
//           // Optional: Implement filtering logic
//         },
//         selectedColor: Color(0xFF1677FF),
//         backgroundColor: Color(0xFFEEEEEE),
//         labelStyle: TextStyle(color: label == "All" ? Colors.white : Color(0xFF666666)),
//         shape: StadiumBorder(),
//         side: BorderSide.none,
//       ),
//     );
//   }
//
//   Widget _buildAnnouncementCard(Map<String, dynamic> announcement) {
//     return Card(
//       elevation: 0,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(12),
//         side: BorderSide(color: Color(0xFFEEEEEE), width: 1),
//       ),
//       child: InkWell(
//         borderRadius: BorderRadius.circular(12),
//         onTap: () => _showAnnouncementDetails(announcement),
//         child: Padding(
//           padding: EdgeInsets.all(16),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Row(
//                 children: [
//                   Container(
//                     padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
//                     decoration: BoxDecoration(
//                       color: Color(0xFF1677FF).withOpacity(0.1),
//                       borderRadius: BorderRadius.circular(4),
//                     ),
//                     child: Text(
//                       announcement["category"],
//                       style: TextStyle(fontSize: 12, color: Color(0xFF1677FF), fontWeight: FontWeight.w500),
//                     ),
//                   ),
//                   if (announcement["isImportant"])
//                     Padding(
//                       padding: EdgeInsets.only(left: 8),
//                       child: Icon(Icons.error, size: 16, color: Colors.red),
//                     ),
//                   Spacer(),
//                   Text(
//                     announcement["date"],
//                     style: TextStyle(fontSize: 12, color: Color(0xFF999999)),
//                   ),
//                 ],
//               ),
//               SizedBox(height: 12),
//               Text(
//                 announcement["title"],
//                 style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Color(0xFF333333)),
//               ),
//               SizedBox(height: 8),
//               Text(
//                 announcement["description"],
//                 maxLines: 2,
//                 overflow: TextOverflow.ellipsis,
//                 style: TextStyle(fontSize: 14, color: Color(0xFF666666)),
//               ),
//               SizedBox(height: 12),
//               Align(
//                 alignment: Alignment.centerRight,
//                 child: Text("Read more", style: TextStyle(fontSize: 12, color: Color(0xFF1677FF))),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   void _showAnnouncementDetails(Map<String, dynamic> announcement) {
//     showModalBottomSheet(
//       context: context,
//       isScrollControlled: true,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(16))),
//       builder: (context) {
//         return SafeArea( // ✅ Prevent modal from covering bottom buttons
//           child: Padding(
//             padding: EdgeInsets.all(24),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Center(
//                   child: Container(
//                     width: 40,
//                     height: 4,
//                     decoration: BoxDecoration(color: Color(0xFFEEEEEE), borderRadius: BorderRadius.circular(2)),
//                   ),
//                 ),
//                 SizedBox(height: 16),
//                 Row(
//                   children: [
//                     Container(
//                       padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
//                       decoration: BoxDecoration(
//                         color: Color(0xFF1677FF).withOpacity(0.1),
//                         borderRadius: BorderRadius.circular(4),
//                       ),
//                       child: Text(
//                         announcement["category"],
//                         style: TextStyle(fontSize: 12, color: Color(0xFF1677FF), fontWeight: FontWeight.w500),
//                       ),
//                     ),
//                     if (announcement["isImportant"])
//                       Padding(
//                         padding: EdgeInsets.only(left: 8),
//                         child: Icon(Icons.error, size: 16, color: Colors.red),
//                       ),
//                     Spacer(),
//                     Text(
//                       announcement["date"],
//                       style: TextStyle(fontSize: 12, color: Color(0xFF999999)),
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 16),
//                 Text(
//                   announcement["title"],
//                   style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Color(0xFF333333)),
//                 ),
//                 SizedBox(height: 16),
//                 Text(
//                   announcement["description"],
//                   style: TextStyle(fontSize: 14, color: Color(0xFF666666), height: 1.5),
//                 ),
//                 SizedBox(height: 24),
//                 SizedBox(
//                   width: double.infinity,
//                   child: ElevatedButton(
//                     onPressed: () => Navigator.pop(context),
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Color(0xFF1677FF),
//                       padding: EdgeInsets.symmetric(vertical: 16),
//                       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
//                     ),
//                     child: Text('Close',
//                         style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white)),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
//
//   Widget _buildBottomNavBar() {
//     return Container(
//       decoration: BoxDecoration(
//         boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 10, spreadRadius: 2)],
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
//             BottomNavigationBarItem(icon: Icon(Icons.home_outlined), activeIcon: Icon(Icons.home), label: 'Home'),
//             BottomNavigationBarItem(icon: Icon(Icons.announcement_outlined), activeIcon: Icon(Icons.announcement), label: 'Announcements'),
//             BottomNavigationBarItem(icon: Icon(Icons.info_outline), activeIcon: Icon(Icons.info), label: 'About'),
//             BottomNavigationBarItem(icon: Icon(Icons.person_outline), activeIcon: Icon(Icons.person), label: 'Profile'),
//           ],
//         ),
//       ),
//     );
//   }
// }
