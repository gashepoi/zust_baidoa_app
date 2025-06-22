import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Settings"), backgroundColor: Colors.blueAccent),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
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
            Text(
              "student@zamzam.edu",
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            SizedBox(height: 30),
            Text(
              "Change Password",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Current Password",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: "New Password",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Confirm New Password",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                print("Password Updated!");
              },
              child: Text("Save Changes"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
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
// class SettingsPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           "Settings",
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
//         padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             // Profile Section
//             Container(
//               padding: EdgeInsets.all(16),
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(12),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.black12,
//                     blurRadius: 6,
//                     offset: Offset(0, 2),
//                   ),
//                 ],
//               ),
//               child: Column(
//                 children: [
//                   CircleAvatar(
//                     radius: 40,
//                     backgroundColor: Colors.blue[50],
//                     child: Icon(Icons.person, size: 50, color: Colors.blue[700]),
//                   ),
//                   SizedBox(height: 12),
//                   Text(
//                     "Student Name",
//                     style: TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.black87,
//                     ),
//                   ),
//                   SizedBox(height: 4),
//                   Text(
//                     "student@zamzam.edu",
//                     style: TextStyle(
//                       fontSize: 14,
//                       color: Colors.grey[600],
//                     ),
//                   ),
//                   SizedBox(height: 8),
//                   TextButton(
//                     onPressed: () {
//                       // Edit profile action
//                     },
//                     child: Text(
//                       "Edit Profile",
//                       style: TextStyle(color: Colors.blue[700]),
//                     ),
//                     style: TextButton.styleFrom(
//                       padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(20),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//
//             SizedBox(height: 24),
//
//             // Password Change Section
//             Container(
//               padding: EdgeInsets.all(16),
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(12),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.black12,
//                     blurRadius: 6,
//                     offset: Offset(0, 2),
//                   ),
//                 ],
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     "Security Settings",
//                     style: TextStyle(
//                       fontSize: 16,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.black87,
//                     ),
//                   ),
//                   SizedBox(height: 16),
//                   Text(
//                     "Change Password",
//                     style: TextStyle(
//                       fontSize: 14,
//                       color: Colors.grey[600],
//                     ),
//                   ),
//                   SizedBox(height: 16),
//                   TextField(
//                     obscureText: true,
//                     decoration: InputDecoration(
//                       labelText: "Current Password",
//                       labelStyle: TextStyle(color: Colors.grey[600]),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(8),
//                         borderSide: BorderSide(color: Colors.grey[300]!),
//                       ),
//                       focusedBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(8),
//                         borderSide: BorderSide(color: Colors.blue),
//                       ),
//                       contentPadding: EdgeInsets.symmetric(
//                           horizontal: 16, vertical: 12),
//                     ),
//                   ),
//                   SizedBox(height: 16),
//                   TextField(
//                     obscureText: true,
//                     decoration: InputDecoration(
//                       labelText: "New Password",
//                       labelStyle: TextStyle(color: Colors.grey[600]),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(8),
//                         borderSide: BorderSide(color: Colors.grey[300]!),
//                       ),
//                       focusedBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(8),
//                         borderSide: BorderSide(color: Colors.blue),
//                       ),
//                       contentPadding: EdgeInsets.symmetric(
//                           horizontal: 16, vertical: 12),
//                     ),
//                   ),
//                   SizedBox(height: 16),
//                   TextField(
//                     obscureText: true,
//                     decoration: InputDecoration(
//                       labelText: "Confirm New Password",
//                       labelStyle: TextStyle(color: Colors.grey[600]),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(8),
//                         borderSide: BorderSide(color: Colors.grey[300]!),
//                       ),
//                       focusedBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(8),
//                         borderSide: BorderSide(color: Colors.blue),
//                       ),
//                       contentPadding: EdgeInsets.symmetric(
//                           horizontal: 16, vertical: 12),
//                     ),
//                   ),
//                   SizedBox(height: 24),
//                   SizedBox(
//                     width: double.infinity,
//                     child: ElevatedButton(
//                       onPressed: () {
//                         // Save changes action
//                       },
//                       child: Text("Save Changes"),
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.blue[700],
//                         foregroundColor: Colors.white,
//                         padding: EdgeInsets.symmetric(vertical: 14),
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
//
//             SizedBox(height: 24),
//
//             // Additional Settings Section
//             Container(
//               padding: EdgeInsets.all(16),
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(12),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.black12,
//                     blurRadius: 6,
//                     offset: Offset(0, 2),
//                   ),
//                 ],
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     "More Settings",
//                     style: TextStyle(
//                       fontSize: 16,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.black87,
//                     ),
//                   ),
//                   SizedBox(height: 16),
//                   _buildSettingItem(
//                     icon: Icons.notifications,
//                     title: "Notification Settings",
//                     onTap: () {},
//                   ),
//                   Divider(height: 24, thickness: 0.5),
//                   _buildSettingItem(
//                     icon: Icons.language,
//                     title: "Language",
//                     onTap: () {},
//                   ),
//                   Divider(height: 24, thickness: 0.5),
//                   _buildSettingItem(
//                     icon: Icons.help_outline,
//                     title: "Help & Support",
//                     onTap: () {},
//                   ),
//                   Divider(height: 24, thickness: 0.5),
//                   _buildSettingItem(
//                     icon: Icons.logout,
//                     title: "Logout",
//                     titleColor: Colors.red,
//                     onTap: () {},
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
//   Widget _buildSettingItem({
//     required IconData icon,
//     required String title,
//     Color? titleColor,
//     required VoidCallback onTap,
//   }) {
//     return InkWell(
//       onTap: onTap,
//       borderRadius: BorderRadius.circular(8),
//       child: Padding(
//         padding: const EdgeInsets.symmetric(vertical: 8.0),
//         child: Row(
//           children: [
//             Icon(icon, color: titleColor ?? Colors.grey[700], size: 24),
//             SizedBox(width: 16),
//             Expanded(
//               child: Text(
//                 title,
//                 style: TextStyle(
//                   fontSize: 14,
//                   color: titleColor ?? Colors.black87,
//                 ),
//               ),
//             ),
//             Icon(Icons.chevron_right, color: Colors.grey[500]),
//           ],
//         ),
//       ),
//     );
//   }
// }