import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'user_profile_page.dart';
import 'settings_page.dart';

class ProfileMenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Profile Menu"), backgroundColor: Colors.blueAccent),
      body: Column(
        children: [
          Container(
            color: Colors.blueAccent,
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.person, size: 40, color: Colors.blue),
                ),
                SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Student Name",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    Text(
                      "student@zamzam.edu",
                      style: TextStyle(fontSize: 14, color: Colors.white70),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                ListTile(
                  leading: Icon(Icons.person, color: Colors.blue),
                  title: Text("View Profile"),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => UserProfilePage()),
                    );
                  },
                ),
                ListTile(
                  leading: Icon(Icons.settings, color: Colors.blue),
                  title: Text("Settings"),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SettingsPage()),
                    );
                  },
                ),
                ListTile(
                  leading: Icon(Icons.logout, color: Colors.blue),
                  title: Text("Logout"),
                  onTap: () {
                    Navigator.pop(context);
                    SystemNavigator.pop();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'user_profile_page.dart';
// import 'settings_page.dart';
//
// class ProfileMenuPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("My Account",
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
//       body: Column(
//         children: [
//           // Profile Header with improved design
//           Container(
//             padding: EdgeInsets.all(24),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               border: Border(
//                 bottom: BorderSide(
//                   color: Colors.grey.shade200,
//                   width: 1,
//                 ),
//               ),
//             ),
//             child: Row(
//               children: [
//                 Container(
//                   width: 72,
//                   height: 72,
//                   decoration: BoxDecoration(
//                     shape: BoxShape.circle,
//                     border: Border.all(
//                       color: Colors.blueAccent.withOpacity(0.2),
//                       width: 2,
//                     ),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.black.withOpacity(0.05),
//                         blurRadius: 8,
//                         spreadRadius: 1,
//                       ),
//                     ],
//                   ),
//                   child: CircleAvatar(
//                     radius: 32,
//                     backgroundColor: Colors.blueAccent.withOpacity(0.1),
//                     child: Icon(
//                       Icons.person,
//                       size: 36,
//                       color: Colors.blueAccent,
//                     ),
//                   ),
//                 ),
//                 SizedBox(width: 16),
//                 Expanded(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         "Student Name",
//                         style: TextStyle(
//                           fontSize: 18,
//                           fontWeight: FontWeight.w600,
//                           color: Colors.black87,
//                         ),
//                       ),
//                       SizedBox(height: 4),
//                       Text(
//                         "student@zamzam.edu",
//                         style: TextStyle(
//                           fontSize: 14,
//                           color: Colors.black54,
//                         ),
//                       ),
//                       SizedBox(height: 8),
//                       InkWell(
//                         onTap: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(builder: (context) => UserProfilePage()),
//                           );
//                         },
//                         child: Text(
//                           "View Profile",
//                           style: TextStyle(
//                             fontSize: 14,
//                             color: Colors.blueAccent,
//                             fontWeight: FontWeight.w500,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//
//           // Menu Items with improved design
//           Expanded(
//             child: ListView(
//               padding: EdgeInsets.only(top: 8),
//               children: [
//                 _buildMenuItem(
//                   context,
//                   icon: Icons.person_outline,
//                   activeIcon: Icons.person,
//                   title: "Profile",
//                   subtitle: "View and edit your profile",
//                   destination: UserProfilePage(),
//                 ),
//                 _buildMenuItem(
//                   context,
//                   icon: Icons.settings_outlined,
//                   activeIcon: Icons.settings,
//                   title: "Settings",
//                   subtitle: "App preferences and notifications",
//                   destination: SettingsPage(),
//                 ),
//                 _buildMenuItem(
//                   context,
//                   icon: Icons.help_outline,
//                   activeIcon: Icons.help,
//                   title: "Help Center",
//                   subtitle: "FAQs and support",
//                   destination: SettingsPage(), // Replace with actual help page
//                 ),
//                 _buildMenuItem(
//                   context,
//                   icon: Icons.info_outline,
//                   activeIcon: Icons.info,
//                   title: "About",
//                   subtitle: "App version and developer info",
//                   destination: SettingsPage(), // Replace with actual about page
//                 ),
//                 Divider(height: 1, thickness: 1, color: Colors.grey.shade200),
//                 _buildMenuItem(
//                   context,
//                   icon: Icons.exit_to_app_outlined,
//                   activeIcon: Icons.exit_to_app,
//                   title: "Logout",
//                   subtitle: "Sign out of your account",
//                   isLogout: true,
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildMenuItem(
//       BuildContext context, {
//         required IconData icon,
//         required IconData activeIcon,
//         required String title,
//         required String subtitle,
//         Widget? destination,
//         bool isLogout = false,
//       }) {
//     return ListTile(
//       contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
//       leading: Container(
//         width: 40,
//         height: 40,
//         decoration: BoxDecoration(
//           shape: BoxShape.circle,
//           color: isLogout
//               ? Colors.redAccent.withOpacity(0.1)
//               : Colors.blueAccent.withOpacity(0.1),
//         ),
//         child: Icon(
//           icon,
//           size: 20,
//           color: isLogout ? Colors.redAccent : Colors.blueAccent,
//         ),
//       ),
//       title: Text(
//         title,
//         style: TextStyle(
//           fontSize: 16,
//           fontWeight: FontWeight.w500,
//           color: isLogout ? Colors.redAccent : Colors.black87,
//         ),
//       ),
//       subtitle: Text(
//         subtitle,
//         style: TextStyle(
//           fontSize: 13,
//           color: isLogout ? Colors.redAccent.withOpacity(0.7) : Colors.black54,
//         ),
//       ),
//       trailing: Icon(
//         Icons.chevron_right,
//         color: isLogout ? Colors.redAccent : Colors.black54,
//       ),
//       onTap: () {
//         if (isLogout) {
//           _showLogoutConfirmation(context);
//         } else if (destination != null) {
//           Navigator.push(
//             context,
//             MaterialPageRoute(builder: (context) => destination),
//           );
//         }
//       },
//     );
//   }
//
//   void _showLogoutConfirmation(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text("Logout",
//             style: TextStyle(
//               fontWeight: FontWeight.w600,
//             ),
//           ),
//           content: Text("Are you sure you want to logout?"),
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(12),
//           ),
//           actions: [
//             TextButton(
//               child: Text("Cancel",
//                 style: TextStyle(color: Colors.black54),
//               ),
//               onPressed: () => Navigator.of(context).pop(),
//             ),
//             TextButton(
//               child: Text("Logout",
//                 style: TextStyle(color: Colors.redAccent),
//               ),
//               onPressed: () {
//                 Navigator.of(context).pop();
//                 SystemNavigator.pop();
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }
// }