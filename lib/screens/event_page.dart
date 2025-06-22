import 'package:flutter/material.dart';

class EventPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Announcement"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Upcoming Announcement",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            EventCard(
              title: "Furitaanka Sanadka",
              date: "Feb 10, 2025",
              description: "Sanad dugsiyeedka cusub wuxuu bilaabanayaa Febraayo 10-keeda.",
            ),
            SizedBox(height: 20),
            EventCard(
              title: "Imtixaanka Semester-ka",
              date: "March 15, 2025",
              description: "Imtixaanka semester-ka wuxuu dhici doonaa bisha Maarso 15-keeda.",
            ),
            SizedBox(height: 20),
            EventCard(
              title: "Fasaxa Dheer",
              date: "June 01, 2025",
              description: "Fasaxa xagaaga wuxuu bilaabanayaa Juun 1-deeda.",
            ),
          ],
        ),
      ),
    );
  }
}

class EventCard extends StatelessWidget {
  final String title;
  final String date;
  final String description;

  EventCard({required this.title, required this.date, required this.description});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blueAccent),
            ),
            SizedBox(height: 5),
            Text(
              "Date: $date",
              style: TextStyle(fontSize: 14, color: Colors.black54),
            ),
            SizedBox(height: 5),
            Text(
              description,
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
//
// class EventPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Announcements",
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
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // Header with search option
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     "Upcoming Events",
//                     style: TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.w600,
//                       color: Colors.black87,
//                     ),
//                   ),
//                   IconButton(
//                     icon: Icon(Icons.search, color: Colors.blueAccent),
//                     onPressed: () {
//                       // Add search functionality
//                     },
//                   ),
//                 ],
//               ),
//               SizedBox(height: 8),
//               Text(
//                 "Stay updated with important university events",
//                 style: TextStyle(
//                   fontSize: 14,
//                   color: Colors.black54,
//                 ),
//               ),
//               SizedBox(height: 24),
//
//               // Filter chips
//               SingleChildScrollView(
//                 scrollDirection: Axis.horizontal,
//                 child: Row(
//                   children: [
//                     _buildFilterChip("All", true),
//                     SizedBox(width: 8),
//                     _buildFilterChip("Academic", false),
//                     SizedBox(width: 8),
//                     _buildFilterChip("Holidays", false),
//                     SizedBox(width: 8),
//                     _buildFilterChip("Exams", false),
//                     SizedBox(width: 8),
//                     _buildFilterChip("Others", false),
//                   ],
//                 ),
//               ),
//               SizedBox(height: 24),
//
//               // Events list
//               EventCard(
//                 title: "Academic Year Opening",
//                 date: "Feb 10, 2025",
//                 time: "08:00 AM",
//                 description: "The new academic year will begin on February 10th. All students must complete registration by February 5th.",
//                 category: "Academic",
//                 icon: Icons.school,
//                 color: Color(0xFF5E35B1),
//               ),
//               SizedBox(height: 16),
//               EventCard(
//                 title: "Midterm Examinations",
//                 date: "March 15, 2025",
//                 time: "09:00 AM",
//                 description: "Midterm exams for all courses will be held from March 15th to March 20th. Check your schedule for details.",
//                 category: "Exams",
//                 icon: Icons.assignment,
//                 color: Color(0xFFD81B60),
//               ),
//               SizedBox(height: 16),
//               EventCard(
//                 title: "Summer Break",
//                 date: "June 01, 2025",
//                 time: "All Day",
//                 description: "Summer vacation begins June 1st. Campus facilities will remain open with reduced hours during the break.",
//                 category: "Holidays",
//                 icon: Icons.beach_access,
//                 color: Color(0xFF039BE5),
//               ),
//               SizedBox(height: 16),
//               EventCard(
//                 title: "Career Fair",
//                 date: "April 05, 2025",
//                 time: "10:00 AM - 4:00 PM",
//                 description: "Annual university career fair with over 50 companies participating. Bring your CV and dress professionally.",
//                 category: "Others",
//                 icon: Icons.work,
//                 color: Color(0xFF43A047),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildFilterChip(String label, bool selected) {
//     return FilterChip(
//       label: Text(label),
//       selected: selected,
//       onSelected: (bool value) {
//         // Handle filter selection
//       },
//       backgroundColor: Colors.white,
//       selectedColor: Colors.blueAccent.withOpacity(0.2),
//       labelStyle: TextStyle(
//         color: selected ? Colors.blueAccent : Colors.black54,
//         fontWeight: selected ? FontWeight.w600 : FontWeight.normal,
//       ),
//       shape: StadiumBorder(
//         side: BorderSide(
//           color: selected ? Colors.blueAccent : Colors.grey.shade300,
//           width: 1,
//         ),
//       ),
//       padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
//     );
//   }
// }
//
// class EventCard extends StatelessWidget {
//   final String title;
//   final String date;
//   final String time;
//   final String description;
//   final String category;
//   final IconData icon;
//   final Color color;
//
//   EventCard({
//     required this.title,
//     required this.date,
//     required this.time,
//     required this.description,
//     required this.category,
//     required this.icon,
//     required this.color,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       elevation: 0,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(12),
//         side: BorderSide(
//           color: Colors.grey.shade200,
//           width: 1,
//         ),
//       ),
//       child: InkWell(
//         borderRadius: BorderRadius.circular(12),
//         onTap: () {
//           // Handle card tap
//         },
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Container(
//                     padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
//                     decoration: BoxDecoration(
//                       color: color.withOpacity(0.1),
//                       borderRadius: BorderRadius.circular(4),
//                     ),
//                     child: Text(
//                       category,
//                       style: TextStyle(
//                         fontSize: 12,
//                         fontWeight: FontWeight.w500,
//                         color: color,
//                       ),
//                     ),
//                   ),
//                   Icon(icon, color: color, size: 20),
//                 ],
//               ),
//               SizedBox(height: 12),
//               Text(
//                 title,
//                 style: TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.w600,
//                   color: Colors.black87,
//                 ),
//               ),
//               SizedBox(height: 8),
//               Row(
//                 children: [
//                   Icon(Icons.calendar_today, size: 16, color: Colors.black54),
//                   SizedBox(width: 4),
//                   Text(
//                     date,
//                     style: TextStyle(
//                       fontSize: 14,
//                       color: Colors.black54,
//                     ),
//                   ),
//                   SizedBox(width: 16),
//                   Icon(Icons.access_time, size: 16, color: Colors.black54),
//                   SizedBox(width: 4),
//                   Text(
//                     time,
//                     style: TextStyle(
//                       fontSize: 14,
//                       color: Colors.black54,
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(height: 12),
//               Divider(height: 1, color: Colors.grey.shade200),
//               SizedBox(height: 12),
//               Text(
//                 description,
//                 style: TextStyle(
//                   fontSize: 15,
//                   color: Colors.black87,
//                   height: 1.4,
//                 ),
//               ),
//               SizedBox(height: 8),
//               Align(
//                 alignment: Alignment.centerRight,
//                 child: TextButton(
//                   onPressed: () {
//                     // Handle "View Details" action
//                   },
//                   style: TextButton.styleFrom(
//                     padding: EdgeInsets.zero,
//                     minimumSize: Size(50, 30),
//                     tapTargetSize: MaterialTapTargetSize.shrinkWrap,
//                   ),
//                   child: Text(
//                     "VIEW DETAILS",
//                     style: TextStyle(
//                       fontSize: 13,
//                       fontWeight: FontWeight.w600,
//                       color: Colors.blueAccent,
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }