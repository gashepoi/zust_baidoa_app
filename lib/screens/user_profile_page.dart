import 'package:flutter/material.dart';

class UserProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("User Profile"), backgroundColor: Colors.blueAccent),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.white,
              child: Icon(Icons.person, size: 80, color: Colors.blue),
            ),
            SizedBox(height: 10),
            Text(
              "Student Name",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 30),
            TextField(
              decoration: InputDecoration(
                labelText: "Update Email",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                labelText: "Update Phone",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                print("Profile Updated!");
              },
              child: Text("Save Changes"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue, // Midabka background
                foregroundColor: Colors.white, // Midabka text
              ),
            ),
          ],
        ),
      ),
    );
  }
}





// import 'package:flutter/material.dart';
//
// class UserProfilePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           "User Profile",
//           style: TextStyle(
//             fontSize: 18,
//             fontWeight: FontWeight.bold,
//             color: Colors.black87,
//           ),
//         ),
//         backgroundColor: Colors.white,
//         elevation: 0.5,
//         iconTheme: IconThemeData(color: Colors.black87),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             // Profile Header Section
//             Container(
//               padding: EdgeInsets.symmetric(vertical: 24),
//               decoration: BoxDecoration(
//                 color: Colors.blue[50],
//                 borderRadius: BorderRadius.only(
//                   bottomLeft: Radius.circular(20),
//                   bottomRight: Radius.circular(20),
//                 ),
//               ),
//               child: Column(
//                 children: [
//                   Stack(
//                     alignment: Alignment.bottomRight,
//                     children: [
//                       CircleAvatar(
//                         radius: 50,
//                         backgroundColor: Colors.blue[100],
//                         child: Icon(
//                           Icons.person,
//                           size: 60,
//                           color: Colors.blue[700],
//                         ),
//                       ),
//                       Container(
//                         padding: EdgeInsets.all(6),
//                         decoration: BoxDecoration(
//                           color: Colors.blue[700],
//                           shape: BoxShape.circle,
//                         ),
//                         child: Icon(
//                           Icons.edit,
//                           size: 18,
//                           color: Colors.white,
//                         ),
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: 16),
//                   Text(
//                     "Student Name",
//                     style: TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.black87,
//                     ),
//                   ),
//                   SizedBox(height: 4),
//                   Text(
//                     "Computer Science Department",
//                     style: TextStyle(
//                       fontSize: 14,
//                       color: Colors.grey[600],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//
//             // Profile Details Section
//             Padding(
//               padding: EdgeInsets.all(16),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     "Personal Information",
//                     style: TextStyle(
//                       fontSize: 16,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.black87,
//                     ),
//                   ),
//                   SizedBox(height: 16),
//                   _buildInfoItem(Icons.email, "Email", "student@zamzam.edu"),
//                   SizedBox(height: 12),
//                   _buildInfoItem(Icons.phone, "Phone", "+252 61 123 4567"),
//                   SizedBox(height: 12),
//                   _buildInfoItem(Icons.school, "Student ID", "CS-2023-001"),
//                   SizedBox(height: 12),
//                   _buildInfoItem(Icons.calendar_today, "Enrollment Date", "Sep 2023"),
//
//                   SizedBox(height: 24),
//
//                   // Editable Fields Section
//                   Text(
//                     "Update Information",
//                     style: TextStyle(
//                       fontSize: 16,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.black87,
//                     ),
//                   ),
//                   SizedBox(height: 16),
//                   TextField(
//                     decoration: InputDecoration(
//                       labelText: "New Email",
//                       labelStyle: TextStyle(color: Colors.grey[600]),
//                       prefixIcon: Icon(Icons.email, color: Colors.grey[600]),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(8),
//                         borderSide: BorderSide(color: Colors.grey[300]!),
//                       ),
//                       focusedBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(8),
//                         borderSide: BorderSide(color: Colors.blue),
//                       ),
//                       contentPadding: EdgeInsets.symmetric(
//                           horizontal: 16, vertical: 14),
//                     ),
//                   ),
//                   SizedBox(height: 16),
//                   TextField(
//                     decoration: InputDecoration(
//                       labelText: "New Phone Number",
//                       labelStyle: TextStyle(color: Colors.grey[600]),
//                       prefixIcon: Icon(Icons.phone, color: Colors.grey[600]),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(8),
//                         borderSide: BorderSide(color: Colors.grey[300]!),
//                       ),
//                       focusedBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(8),
//                         borderSide: BorderSide(color: Colors.blue),
//                       ),
//                       contentPadding: EdgeInsets.symmetric(
//                           horizontal: 16, vertical: 14),
//                     ),
//                   ),
//                   SizedBox(height: 24),
//                   SizedBox(
//                     width: double.infinity,
//                     child: ElevatedButton(
//                       onPressed: () {
//                         // Save changes action
//                         ScaffoldMessenger.of(context).showSnackBar(
//                           SnackBar(
//                             content: Text("Profile updated successfully"),
//                             backgroundColor: Colors.green,
//                           ),
//                         );
//                       },
//                       child: Text(
//                         "Save Changes",
//                         style: TextStyle(fontWeight: FontWeight.bold),
//                       ),
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.blue[700],
//                         foregroundColor: Colors.white,
//                         padding: EdgeInsets.symmetric(vertical: 16),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(8),
//                         ),
//                         elevation: 0,
//                       ),
//                     ),
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
//   Widget _buildInfoItem(IconData icon, String label, String value) {
//     return Container(
//       padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
//       decoration: BoxDecoration(
//         color: Colors.grey[50],
//         borderRadius: BorderRadius.circular(8),
//         border: Border.all(color: Colors.grey[200]!),
//       ),
//       child: Row(
//         children: [
//           Icon(icon, size: 20, color: Colors.grey[600]),
//           SizedBox(width: 12),
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 label,
//                 style: TextStyle(
//                   fontSize: 12,
//                   color: Colors.grey[600],
//                 ),
//               ),
//               SizedBox(height: 2),
//               Text(
//                 value,
//                 style: TextStyle(
//                   fontSize: 14,
//                   fontWeight: FontWeight.w500,
//                   color: Colors.black87,
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }