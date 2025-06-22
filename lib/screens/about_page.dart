import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "About Us",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 18,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFF1677FF), // Alipay primary blue
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Section
              Center(
                child: Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    color: Color(0xFF1677FF).withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.school,
                    size: 40,
                    color: Color(0xFF1677FF),
                  ),
                ),
              ),
              SizedBox(height: 24),
              Center(
                child: Text(
                  "Our Foundation",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF333333),
                  ),
                ),
              ),
              SizedBox(height: 8),
              Center(
                child: Text(
                  "Established in 2010",
                  style: TextStyle(fontSize: 14, color: Color(0xFF999999)),
                ),
              ),
              SizedBox(height: 32),

              // Mission Card
              _buildSectionCard(
                icon: Icons.flag,
                title: "Mission",
                content:
                    "To provide world-class education and empower students with knowledge and skills.",
              ),

              SizedBox(height: 20),

              // Vision Card
              _buildSectionCard(
                icon: Icons.visibility,
                title: "Vision",
                content:
                    "To be a leading institution in education and research, shaping the future of students globally.",
              ),

              SizedBox(height: 30),

              // Contact Info
              Text(
                "Contact Us",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF333333)),
              ),
              SizedBox(height: 16),
              _buildContactItem(Icons.email, "contact@edu.org"),
              _buildContactItem(Icons.phone, "+1 (234) 567-8900"),
              _buildContactItem(
                  Icons.location_on, "123 Education Blvd, Campus City"),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionCard(
      {required IconData icon,
      required String title,
      required String content}) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Color(0xFFEEEEEE), width: 1),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Color(0xFF1677FF).withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, size: 20, color: Color(0xFF1677FF)),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF333333)),
                  ),
                  SizedBox(height: 8),
                  Text(
                    content,
                    style: TextStyle(
                        fontSize: 15, height: 1.4, color: Color(0xFF666666)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContactItem(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 20, color: Color(0xFF999999)),
          SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: TextStyle(fontSize: 15, color: Color(0xFF666666)),
            ),
          ),
        ],
      ),
    );
  }
}


//
// import 'package:flutter/material.dart';
//
// class AboutPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           "About Us",
//           style: TextStyle(
//             fontWeight: FontWeight.w600,
//             fontSize: 18,
//             color: Colors.white,
//           ),
//         ),
//         centerTitle: true,
//         backgroundColor: Color(0xFF1677FF), // Alipay primary blue
//         elevation: 0,
//         iconTheme: IconThemeData(color: Colors.white),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // Header Section
//               Center(
//                 child: Container(
//                   width: 80,
//                   height: 80,
//                   decoration: BoxDecoration(
//                     color: Color(0xFF1677FF).withOpacity(0.1),
//                     shape: BoxShape.circle,
//                   ),
//                   child: Icon(
//                     Icons.school,
//                     size: 40,
//                     color: Color(0xFF1677FF),
//                   ),
//                 ),
//               ),
//               SizedBox(height: 24),
//               Center(
//                 child: Text(
//                   "Our Foundation",
//                   style: TextStyle(
//                     fontSize: 20,
//                     fontWeight: FontWeight.w600,
//                     color: Color(0xFF333333),
//                   ),
//                 ),
//               ),
//               SizedBox(height: 8),
//               Center(
//                 child: Text(
//                   "Established in 2010",
//                   style: TextStyle(
//                       fontSize: 14,
//                       color: Color(0xFF999999)),
//                 ),
//               ),
//               SizedBox(height: 32),
//
//               // Mission Card
//               _buildSectionCard(
//                 icon: Icons.flag,
//                 title: "Mission",
//                 content: "To provide world-class education and empower students with knowledge and skills.",
//               ),
//
//               SizedBox(height: 20),
//
//               // Vision Card
//               _buildSectionCard(
//                 icon: Icons.visibility,
//                 title: "Vision",
//                 content: "To be a leading institution in education and research, shaping the future of students globally.",
//               ),
//
//               SizedBox(height: 30),
//
//               // Contact Info
//               Text(
//                 "Contact Us",
//                 style: TextStyle(
//                     fontSize: 18,
//                     fontWeight: FontWeight.w600,
//                     color: Color(0xFF333333)),
//               ),
//               SizedBox(height: 16),
//               _buildContactItem(Icons.email, "contact@edu.org"),
//               _buildContactItem(Icons.phone, "+1 (234) 567-8900"),
//               _buildContactItem(Icons.location_on, "123 Education Blvd, Campus City"),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildSectionCard({required IconData icon, required String title, required String content}) {
//     return Card(
//       elevation: 0,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(12),
//         side: BorderSide(color: Color(0xFFEEEEEE), width: 1),
//       ),
//       child: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Container(
//               padding: EdgeInsets.all(8),
//               decoration: BoxDecoration(
//                 color: Color(0xFF1677FF).withOpacity(0.1),
//                 shape: BoxShape.circle,
//               ),
//               child: Icon(icon, size: 20, color: Color(0xFF1677FF)),
//             ),
//             SizedBox(width: 16),
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     title,
//                     style: TextStyle(
//                         fontSize: 18,
//                         fontWeight: FontWeight.w600,
//                         color: Color(0xFF333333)),
//                   ),
//                   SizedBox(height: 8),
//                   Text(
//                     content,
//                     style: TextStyle(
//                         fontSize: 15,
//                         height: 1.4,
//                         color: Color(0xFF666666)),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildContactItem(IconData icon, String text) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 12),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Icon(icon, size: 20, color: Color(0xFF999999)),
//           SizedBox(width: 12),
//           Expanded(
//             child: Text(
//               text,
//               style: TextStyle(fontSize: 15, color: Color(0xFF666666)),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
