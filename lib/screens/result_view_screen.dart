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
  final String _currentSemester = "Semester One";
  String? _selectedExamType; // Waxa uu noqon karaa 'CW1', 'CW2', 'Midterm', ama 'Final'
  final ScrollController _scrollController = ScrollController();
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    if (index == 0) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => StudentDashboard()));
    } else if (index == 1) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => EventPage()));
    } else if (index == 2) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => AboutPage()));
    } else if (index == 3) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileMenuPage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100], // Midab khafiif ah oo gadaal ah
      appBar: AppBar(
        title: Text("Natiijada Imtixaanka"),
        backgroundColor: Colors.blue.shade700,
        foregroundColor: Colors.white,
        leading: IconButton(icon: Icon(Icons.arrow_back, color: Colors.white), onPressed: () => Navigator.of(context).pop()),
        elevation: 2.0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              // QAYBTA LOGO-GA OO KU JIRTA CARD
              Card(
                elevation: 2.0,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Image.network('https://i0.wp.com/zust.edu.so/wp-content/uploads/2022/12/2222-01.png?fit=1375%2C366&ssl=1', height: 80, fit: BoxFit.contain, errorBuilder: (context, error, stackTrace) => Center(child: Text("Logo Error"))),
                ),
              ),
              SizedBox(height: 20),

              // QAYBTA DOORASHADA IMTIXAANKA OO KU JIRTA CARD
              Card(
                elevation: 2.0,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        "Dooro Nooca Imtixaanka",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blue[800]),
                      ),
                      SizedBox(height: 20),
                      // QAABKA 2X2 GRID EE BUTTONS-KA
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          // TIIRKA 1-AAD (CW1 & Midterm)
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                _buildExamButton("CW1"),
                                SizedBox(height: 12),
                                _buildExamButton("Midterm"),
                              ],
                            ),
                          ),
                          SizedBox(width: 16),
                          // TIIRKA 2-AAD (CW2 & Final)
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                _buildExamButton("CW2"),
                                SizedBox(height: 12),
                                _buildExamButton("Final"),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),

              // QAYBTA NATIIJADA OO LEH ANIMATION
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 400),
                transitionBuilder: (Widget child, Animation<double> animation) {
                  return FadeTransition(opacity: animation, child: child);
                },
                child: _selectedExamType == null
                    ? SizedBox.shrink(key: ValueKey('empty')) // Waxba ha soo bandhigin marka hore
                    : _buildResultCard(key: ValueKey(_selectedExamType)), // Soo bandhig card-ka natiijada
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blue.shade700,
        unselectedItemColor: Colors.grey[600],
        backgroundColor: Colors.white,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.announcement), label: 'Announcement'),
          BottomNavigationBarItem(icon: Icon(Icons.info_outline), label: 'About'),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'Profile'),
        ],
      ),
    );
  }

  // WIDGET-KA BUTTON-KA OO LA HAGAAJIYAY
  Widget _buildExamButton(String title) {
    bool isActive = _selectedExamType == title;
    return ElevatedButton(
      onPressed: () { setState(() { _selectedExamType = title; }); },
      child: Text(title, style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
      style: ElevatedButton.styleFrom(
        backgroundColor: isActive ? Colors.blue.shade700 : Colors.white,
        foregroundColor: isActive ? Colors.white : Colors.blue.shade700,
        padding: EdgeInsets.symmetric(vertical: 14),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(color: Colors.blue.shade200, width: 1.5),
        ),
        elevation: isActive ? 5 : 1,
      ),
    );
  }

  // WIDGET-KA SOO BANDHIGAYA CARD-KA NATIIJADA
  Widget _buildResultCard({required ValueKey<String?> key}) {
    return Card(
      elevation: 2.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Text(
              "Natiijada: $_currentSemester - $_selectedExamType",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87),
            ),
            SizedBox(height: 10),
            Divider(),
            Container(
              constraints: BoxConstraints(maxHeight: 350), // Si uusan aad u dheeraan
              child: Scrollbar(
                controller: _scrollController,
                thumbVisibility: true,
                child: SingleChildScrollView(
                  controller: _scrollController,
                  child: _buildTable(_getExamData(_selectedExamType!)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // SHAXDA OO LA QURXIYAY (Zebra-striping)
  Widget _buildTable(List<List<String>> data) {
    if (data.isEmpty) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 40.0),
        child: Text("Natiijo lama helin imtixaankan weli.", textAlign: TextAlign.center, style: TextStyle(color: Colors.grey[600], fontStyle: FontStyle.italic, fontSize: 16)),
      );
    }
    return DataTable(
      headingRowColor: MaterialStateColor.resolveWith((states) => Colors.blue.shade50),
      headingTextStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue.shade900, fontSize: 15),
      columnSpacing: 35.0,
      dataRowHeight: 48.0,
      columns: const <DataColumn>[
        DataColumn(label: Text('Maadada')),
        DataColumn(label: Text('Darajada')),
        DataColumn(label: Text('GPA')),
      ],
      // Ku daridda midab kala duwan safafka
      rows: data.asMap().entries.map<DataRow>((entry) {
        final int index = entry.key;
        final List<String> rowData = entry.value;
        final Color rowColor = index.isOdd ? Colors.blue.shade50.withOpacity(0.4) : Colors.white;

        return DataRow(
          color: MaterialStateProperty.all(rowColor),
          cells: rowData.map<DataCell>((cell) => DataCell(Text(cell))).toList(),
        );
      }).toList(),
    );
  }

  // FUNCTIONS-KA XOGTA (WAXBA LAGA MA BEDDELIN)
  List<List<String>> _getExamData(String examType) {
    switch (examType) {
      case 'CW1': return _getCW1Data(_currentSemester);
      case 'CW2': return _getCW2Data(_currentSemester);
      case 'Midterm': return _getMidtermData(_currentSemester);
      case 'Final': return _getFinalData(_currentSemester);
      default: return [];
    }
  }

  List<List<String>> _getCW1Data(String semester) { /* ... Xogta sidii hore ... */ return [["Algebra (CW1)", "A", "4.0"], ["Physics (CW1)", "B", "3.2"], ["Programming (CW1)", "A-", "3.9"]]; }
  List<List<String>> _getCW2Data(String semester) { /* ... Xogta sidii hore ... */ return [["Philosophy (CW2)", "A", "4.0"], ["History (CW2)", "C+", "2.5"], ["Programming (CW2)", "B", "3.3"]]; }
  List<List<String>> _getMidtermData(String semester) { /* ... Xogta sidii hore ... */ return [["Algebra", "B+", "3.7"],["Philosophy", "A", "4.0"],["Physics", "B", "3.2"],["History", "B-", "2.8"],["Programming", "A-", "3.9"],];}
  List<List<String>> _getFinalData(String semester) { /* ... Xogta sidii hore ... */ return [["Calculus", "B", "3.2"],["Ethics", "A-", "3.9"],["Physics", "A", "4.0"],["World History", "B+", "3.7"],["Data Structures", "B", "3.3"],];}
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