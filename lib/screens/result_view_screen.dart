import 'package:flutter/material.dart';
// Ku dar imports-ka bogagga loo baahan yahay ee navigation-ka
import 'student_dashboard.dart';
import 'event_page.dart'; // Index 1
import 'about_page.dart'; // Index 2
import 'profile_menu_page.dart'; // Index 3
// imports kale haddii loo baahdo

class ResultViewScreen extends StatefulWidget {
  @override
  _ResultViewScreenState createState() => _ResultViewScreenState();
}

class _ResultViewScreenState extends State<ResultViewScreen> {
  String? selectedSemester = "Semester One";
  bool showMidtermTable = false;
  bool showFinalTable = false;
  final ScrollController _scrollController = ScrollController();

  // Index-ka la doortay ee boggan (default waa 0 - Home)
  // Waxaad u beddeli kartaa index kale haddii boggani u dhigmo mid ka mid ah tabs (optional)
  int _selectedIndex = 0;

  // Navigation function oo la mid ah kan Dashboard-ka
  void _onItemTapped(int index) {
    if (index == 0) { // Home
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => StudentDashboard()));
    } else if (index == 1) { // Events
      Navigator.push(context, MaterialPageRoute(builder: (context) => EventPage()));
    } else if (index == 2) { // About
      Navigator.push(context, MaterialPageRoute(builder: (context) => AboutPage()));
    } else if (index == 3) { // Profile
      Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileMenuPage()));
    }
    // Looma baahna setState halkan
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Result View"),
        backgroundColor: Colors.blue,
        leading: IconButton(icon: Icon(Icons.arrow_back, color: Colors.black), onPressed: () => Navigator.of(context).pop()),
      ),
      body: SingleChildScrollView( // Body sidii hore
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Column(
            children: [
              Padding(padding: const EdgeInsets.symmetric(horizontal: 16.0), child: Image.network('https://i0.wp.com/zust.edu.so/wp-content/uploads/2022/12/2222-01.png?fit=1375%2C366&ssl=1', height: 100, fit: BoxFit.contain, errorBuilder: (context, error, stackTrace) => Center(child: Text("Logo Error")))),
              SizedBox(height: 20),
              Text("Dooro Semester-ka", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blue[700])),
              SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32.0),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 12.0),
                  decoration: BoxDecoration(border: Border.all(color: Colors.blue.shade300, width: 1), borderRadius: BorderRadius.circular(8), color: Colors.grey[50]),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: selectedSemester, isExpanded: true, icon: Icon(Icons.arrow_drop_down, color: Colors.blue), iconSize: 30, elevation: 8, style: TextStyle(color: Colors.black87, fontSize: 16),
                      onChanged: (String? newValue) { setState(() { selectedSemester = newValue!; showMidtermTable = false; showFinalTable = false; }); },
                      items: <String>["Semester One", "Semester Two", "Semester Three", "Semester Four", "Semester Five", "Semester Six", "Semester Seven", "Semester Eight"].map<DropdownMenuItem<String>>((String value) => DropdownMenuItem<String>(value: value, child: Center(child: Text(value)))).toList(),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 25),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [ _buildExamButton("Midterm Exam"), SizedBox(width: 20), _buildExamButton("Final Exam"), ]),
              SizedBox(height: 25),
              if (showMidtermTable || showFinalTable)
                Container(
                  constraints: BoxConstraints(maxHeight: 400), margin: const EdgeInsets.symmetric(horizontal: 16.0), decoration: BoxDecoration(border: Border.all(color: Colors.grey.shade300), borderRadius: BorderRadius.circular(8)),
                  child: Scrollbar(
                    controller: _scrollController, thumbVisibility: true, thickness: 6, radius: Radius.circular(10),
                    child: SingleChildScrollView(
                      controller: _scrollController,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            if (showMidtermTable) ...[ Padding(padding: const EdgeInsets.symmetric(vertical: 8.0), child: Text("$selectedSemester - Midterm", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blue[800]))), _buildTable(_getMidtermData(selectedSemester)), SizedBox(height: 15)],
                            if (showFinalTable) ...[ Padding(padding: const EdgeInsets.symmetric(vertical: 8.0), child: Text("$selectedSemester - Final", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.deepPurple[600]))), _buildTable(_getFinalData(selectedSemester)), SizedBox(height: 10)],
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
      // BottomNavigationBar oo loo beddelay HABKA CAADIGA AH
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.blue[600],
        backgroundColor: Colors.white,
        currentIndex: _selectedIndex, // Isticmaal state-ka boggan
        onTap: _onItemTapped, // Isticmaal function-ka boggan
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home', // Isticmaal label
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.announcement), // La mid ah Dashboard
            label: 'announcement', // La mid ah Dashboard
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info_outline),
            label: 'About',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  // _buildExamButton sidii hore
  Widget _buildExamButton(String title) {
    bool isActive = (title == "Midterm Exam" && showMidtermTable) || (title == "Final Exam" && showFinalTable);
    Color buttonColor = isActive ? Colors.blue : Colors.lightBlue.shade100; Color textColor = isActive ? Colors.white : Colors.blue.shade800;
    return ElevatedButton(onPressed: () { setState(() { if (title == "Midterm Exam") { showMidtermTable = true; showFinalTable = false; } else { showFinalTable = true; showMidtermTable = false; } }); }, child: Text(title), style: ElevatedButton.styleFrom(backgroundColor: buttonColor, foregroundColor: textColor, padding: EdgeInsets.symmetric(horizontal: 25, vertical: 12), textStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.w600), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)), elevation: isActive ? 4 : 2));
  }

  // _buildTable sidii hore
  Widget _buildTable(List<List<String>> data) {
    if (data.isEmpty) { return Padding(padding: const EdgeInsets.symmetric(vertical: 20.0), child: Text("Natiijo lama helin semester-kan weli.", textAlign: TextAlign.center, style: TextStyle(color: Colors.grey[600], fontStyle: FontStyle.italic, fontSize: 15))); }
    return DataTable(headingRowColor: MaterialStateColor.resolveWith((states) => Colors.blue.shade50), headingTextStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue.shade900, fontSize: 15), columnSpacing: 35.0, dataRowHeight: 45.0, columns: const <DataColumn>[DataColumn(label: Text('Maadada')), DataColumn(label: Text('Darajada')), DataColumn(label: Text('GPA'))], rows: data.map<DataRow>((row) => DataRow(cells: row.map<DataCell>((cell) => DataCell(Text(cell))).toList())).toList());
  }

  // _getMidtermData sidii hore
  List<List<String>> _getMidtermData(String? semester) { switch (semester) { case "Semester One": return [["Algebra", "B+", "3.7"],["Philosophy", "A", "4.0"],["Physics", "B", "3.2"],["History", "B-", "2.8"],["Programming", "A-", "3.9"],]; case "Semester Two": return [["Statistics", "A", "4.0"],["Database Systems", "B+", "3.6"],["Artificial Intelligence", "A-", "3.8"],["Geography", "B", "3.3"],["Finance", "B-", "3.0"],]; default: return []; } }

  // _getFinalData sidii hore
  List<List<String>> _getFinalData(String? semester) { switch (semester) { case "Semester One": return [["Calculus", "B", "3.2"],["Ethics", "A-", "3.9"],["Physics", "A", "4.0"],["World History", "B+", "3.7"],["Data Structures", "B", "3.3"],]; case "Semester Two": return [["Machine Learning", "A+", "4.0"],["Cyber Security", "B", "3.2"],["Economics", "A", "4.0"],["Environmental Science", "B+", "3.5"],["Marketing", "B-", "3.0"],]; default: return []; } }

// Function-kan _buildIconWithText looma baahna halkan
}



// import 'package:flutter/material.dart';
// import 'student_dashboard.dart';
// import 'event_page.dart';
// import 'about_page.dart';
// import 'profile_menu_page.dart';
//
// class ResultViewScreen extends StatefulWidget {
//   @override
//   _ResultViewScreenState createState() => _ResultViewScreenState();
// }
//
// class _ResultViewScreenState extends State<ResultViewScreen> {
//   String? selectedSemester = "Semester One";
//   bool showMidtermTable = false;
//   bool showFinalTable = false;
//   final ScrollController _scrollController = ScrollController();
//   int _selectedIndex = 0;
//
//   void _onItemTapped(int index) {
//     if (index == 0) {
//       Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(builder: (context) => StudentDashboard())
//       );
//     } else if (index == 1) {
//       Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => EventPage())
//       );
//     } else if (index == 2) {
//       Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => AboutPage())
//       );
//     } else if (index == 3) {
//       Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => ProfileMenuPage())
//       );
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Academic Results",
//           style: TextStyle(
//             fontSize: 18,
//             fontWeight: FontWeight.w600,
//             color: Colors.black87,
//           ),
//         ),
//         backgroundColor: Colors.white,
//         elevation: 1,
//         centerTitle: true,
//         iconTheme: IconThemeData(color: Colors.black87),
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back),
//           onPressed: () => Navigator.of(context).pop(),
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             // Header with logo
//             Padding(
//               padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24),
//               child: Image.network(
//                 'https://i0.wp.com/zust.edu.so/wp-content/uploads/2022/12/2222-01.png?fit=1375%2C366&ssl=1',
//                 height: 80,
//                 fit: BoxFit.contain,
//                 errorBuilder: (context, error, stackTrace) => Icon(
//                   Icons.school,
//                   size: 60,
//                   color: Colors.blueAccent,
//                 ),
//               ),
//             ),
//
//             // Semester selection
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 24),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     "Select Semester",
//                     style: TextStyle(
//                       fontSize: 16,
//                       fontWeight: FontWeight.w600,
//                       color: Colors.black87,
//                     ),
//                   ),
//                   SizedBox(height: 8),
//                   Container(
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(12),
//                       border: Border.all(
//                         color: Colors.grey.shade300,
//                         width: 1,
//                       ),
//                       color: Colors.white,
//                     ),
//                     padding: EdgeInsets.symmetric(horizontal: 16),
//                     child: DropdownButtonHideUnderline(
//                       child: DropdownButton<String>(
//                         value: selectedSemester,
//                         isExpanded: true,
//                         icon: Icon(Icons.keyboard_arrow_down),
//                         iconSize: 24,
//                         style: TextStyle(
//                           fontSize: 15,
//                           color: Colors.black87,
//                         ),
//                         onChanged: (String? newValue) {
//                           setState(() {
//                             selectedSemester = newValue!;
//                             showMidtermTable = false;
//                             showFinalTable = false;
//                           });
//                         },
//                         items: <String>[
//                           "Semester One", "Semester Two", "Semester Three",
//                           "Semester Four", "Semester Five", "Semester Six",
//                           "Semester Seven", "Semester Eight"
//                         ].map<DropdownMenuItem<String>>((String value) {
//                           return DropdownMenuItem<String>(
//                             value: value,
//                             child: Text(value),
//                           );
//                         }).toList(),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(height: 24),
//
//             // Exam type toggle
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 24),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   _buildExamToggle("Midterm Exam", showMidtermTable),
//                   SizedBox(width: 16),
//                   _buildExamToggle("Final Exam", showFinalTable),
//                 ],
//               ),
//             ),
//             SizedBox(height: 24),
//
//             // Results table
//             if (showMidtermTable || showFinalTable)
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 16),
//                 child: Card(
//                   elevation: 0,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(12),
//                     side: BorderSide(
//                       color: Colors.grey.shade200,
//                       width: 1,
//                     ),
//                   ),
//                   child: Padding(
//                     padding: const EdgeInsets.all(16.0),
//                     child: Column(
//                       children: [
//                         Text(
//                           showMidtermTable
//                               ? "$selectedSemester - Midterm Results"
//                               : "$selectedSemester - Final Results",
//                           style: TextStyle(
//                             fontSize: 18,
//                             fontWeight: FontWeight.w600,
//                             color: showMidtermTable
//                                 ? Colors.blue.shade800
//                                 : Colors.deepPurple.shade600,
//                           ),
//                         ),
//                         SizedBox(height: 16),
//                         _buildResultsTable(
//                             showMidtermTable
//                                 ? _getMidtermData(selectedSemester)
//                                 : _getFinalData(selectedSemester)
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             SizedBox(height: 20),
//           ],
//         ),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: _selectedIndex,
//         selectedItemColor: Color(0xFF1976D2),
//         unselectedItemColor: Colors.black54,
//         onTap: _onItemTapped,
//         type: BottomNavigationBarType.fixed,
//         backgroundColor: Colors.white,
//         elevation: 8,
//         selectedLabelStyle: TextStyle(fontSize: 12),
//         unselectedLabelStyle: TextStyle(fontSize: 12),
//         items: [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home_outlined),
//             activeIcon: Icon(Icons.home),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.announcement_outlined),
//             activeIcon: Icon(Icons.announcement),
//             label: 'Announcements',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.info_outline),
//             activeIcon: Icon(Icons.info),
//             label: 'About',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.person_outline),
//             activeIcon: Icon(Icons.person),
//             label: 'Profile',
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildExamToggle(String title, bool isActive) {
//     return Expanded(
//       child: InkWell(
//         onTap: () {
//           setState(() {
//             if (title == "Midterm Exam") {
//               showMidtermTable = true;
//               showFinalTable = false;
//             } else {
//               showFinalTable = true;
//               showMidtermTable = false;
//             }
//           });
//         },
//         borderRadius: BorderRadius.circular(8),
//         child: Container(
//           padding: EdgeInsets.symmetric(vertical: 12),
//           decoration: BoxDecoration(
//             color: isActive
//                 ? (title == "Midterm Exam"
//                 ? Colors.blue.shade50
//                 : Colors.deepPurple.shade50)
//                 : Colors.grey.shade50,
//             borderRadius: BorderRadius.circular(8),
//             border: Border.all(
//               color: isActive
//                   ? (title == "Midterm Exam"
//                   ? Colors.blue.shade200
//                   : Colors.deepPurple.shade200)
//                   : Colors.grey.shade300,
//               width: 1,
//             ),
//           ),
//           child: Center(
//             child: Text(
//               title,
//               style: TextStyle(
//                 fontSize: 15,
//                 fontWeight: isActive ? FontWeight.w600 : FontWeight.w500,
//                 color: isActive
//                     ? (title == "Midterm Exam"
//                     ? Colors.blue.shade800
//                     : Colors.deepPurple.shade800)
//                     : Colors.black54,
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildResultsTable(List<List<String>> data) {
//     if (data.isEmpty) {
//       return Padding(
//         padding: const EdgeInsets.symmetric(vertical: 20.0),
//         child: Text(
//           "No results available for this semester yet.",
//           textAlign: TextAlign.center,
//           style: TextStyle(
//             color: Colors.grey.shade600,
//             fontStyle: FontStyle.italic,
//             fontSize: 15,
//           ),
//         ),
//       );
//     }
//
//     return Container(
//       constraints: BoxConstraints(maxHeight: 400),
//       child: Scrollbar(
//         controller: _scrollController,
//         child: SingleChildScrollView(
//           controller: _scrollController,
//           scrollDirection: Axis.horizontal,
//           child: DataTable(
//             headingRowColor: MaterialStateColor.resolveWith(
//                   (states) => Colors.grey.shade50,
//             ),
//             headingTextStyle: TextStyle(
//               fontWeight: FontWeight.w600,
//               color: Colors.black87,
//               fontSize: 14,
//             ),
//             dataTextStyle: TextStyle(
//               fontSize: 14,
//               color: Colors.black87,
//             ),
//             columnSpacing: 24,
//             horizontalMargin: 16,
//             dataRowHeight: 48,
//             columns: const [
//               DataColumn(label: Text('Course')),
//               DataColumn(label: Text('Grade'), numeric: true),
//               DataColumn(label: Text('GPA'), numeric: true),
//             ],
//             rows: data.map((row) {
//               return DataRow(
//                 cells: [
//                   DataCell(Text(row[0])),
//                   DataCell(Text(row[1])),
//                   DataCell(Text(row[2])),
//                 ],
//               );
//             }).toList(),
//           ),
//         ),
//       ),
//     );
//   }
//
//   List<List<String>> _getMidtermData(String? semester) {
//     switch (semester) {
//       case "Semester One":
//         return [
//           ["Algebra", "B+", "3.7"],
//           ["Philosophy", "A", "4.0"],
//           ["Physics", "B", "3.2"],
//           ["History", "B-", "2.8"],
//           ["Programming", "A-", "3.9"],
//         ];
//       case "Semester Two":
//         return [
//           ["Statistics", "A", "4.0"],
//           ["Database Systems", "B+", "3.6"],
//           ["Artificial Intelligence", "A-", "3.8"],
//           ["Geography", "B", "3.3"],
//           ["Finance", "B-", "3.0"],
//         ];
//       default:
//         return [];
//     }
//   }
//
//   List<List<String>> _getFinalData(String? semester) {
//     switch (semester) {
//       case "Semester One":
//         return [
//           ["Calculus", "B", "3.2"],
//           ["Ethics", "A-", "3.9"],
//           ["Physics", "A", "4.0"],
//           ["World History", "B+", "3.7"],
//           ["Data Structures", "B", "3.3"],
//         ];
//       case "Semester Two":
//         return [
//           ["Machine Learning", "A+", "4.0"],
//           ["Cyber Security", "B", "3.2"],
//           ["Economics", "A", "4.0"],
//           ["Environmental Science", "B+", "3.5"],
//           ["Marketing", "B-", "3.0"],
//         ];
//       default:
//         return [];
//     }
//   }
// }