// import 'package:cafe/pages/notificationDetailPage.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:flutter_gen/gen_l10n/app_localization.dart';

// class Notificationpage extends StatelessWidget {
//   const Notificationpage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final Size screenSize = MediaQuery.of(context).size;
//     final double appBarIconSize = screenSize.width * 0.075;
//     final double appBarTitleSize = screenSize.width * 0.06;
//     final List<Map<String, String>> notifications = [
//       {
//         'name': 'MK',
//         'description':
//             'Your order has been placed. Please be patient; the shop is preparing your order.'
//       },
//       {
//         'name': 'Olivia',
//         'description':
//             'Your order is being processed. We will notify you when it is ready.'
//       },
//       {
//         'name': 'Joe',
//         'description':
//             'Your order is ready for pickup. Please collect it at your convenience.'
//       },
//     ];
//     final List<String> profile = [
//       'images/profile/ronaldo.png',
//       'images/profile/michael.png',
//       'images/profile/jennie.png'
//     ];

//     return Container(
//       child: Padding(
//         padding:EdgeInsets.only(top:20),
//         child: Scaffold(
//           appBar: AppBar(
//             backgroundColor: Colors.grey,
//             elevation: 0,
//             leading: IconButton(
//               onPressed: () => Navigator.of(context).pop(),
//               icon: Icon(
//                 Icons.arrow_back_ios,
//                 color: Colors.white,
//               ),
//               iconSize: appBarIconSize,
//             ),
//             centerTitle: true,
//             title: Text(
//               AppLocalizations.of(context)!.notifications,
//               style: GoogleFonts.assistant(
//                 color: Colors.white,
//                 fontSize: appBarTitleSize,
//                 fontWeight: FontWeight.w700,
//               ),
//             ),
//             actions: [
//               Icon(
//                 Icons.notifications,
//                 color: Colors.white,
//                 size: appBarIconSize,
//               ),
//               SizedBox(width: 16), // Add padding to the right
//             ],
//           ),
//           body: ListView.builder(
//             itemCount: notifications.length,
//             itemBuilder: (context, index) {
//               return Padding(
//                 padding: const EdgeInsets.only(
//                     bottom: 8.0, left: 10, right: 10, top: 10),
//                 child: Container(
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(12),
//                     color: Colors.grey.shade300,
//                   ),
//                   child: ListTile(
//                     title: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Row(
//                           children: [
//                             CircleAvatar(
//                               backgroundColor: Colors.grey.shade300,
//                               radius: 16,
//                               backgroundImage: AssetImage(profile[index]),
//                             ),
//                             SizedBox(width: 12),
//                             Text(
//                               notifications[index]['name']!,
//                               style: TextStyle(
//                                   fontSize: 16, fontWeight: FontWeight.bold),
//                             ),
//                           ],
//                         ),
//                         SizedBox(height: 4),
//                         Text(
//                           notifications[index]['description']!,
//                           style: TextStyle(fontSize: 14, color: Colors.black54),
//                         ),
//                       ],
//                     ),
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => NotiDetailPage(
//                             orderName: notifications[index]['name']!,
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//               );
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }
// pages/notifications_page.dart

import 'package:cafe/model/notificationModel.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

class NotificationsPage extends StatelessWidget {
  final List<NotificationModel> notifications = [
    NotificationModel(
      title: 'Order Ready',
      message: 'Your coffee is ready for pickup!',
      timestamp: DateTime.now().subtract(Duration(minutes: 5)),
    ),
    NotificationModel(
      title: 'New Offer',
      message: '20% off on all beverages this weekend.',
      timestamp: DateTime.now().subtract(Duration(hours: 1)),
    ),
    // Add more sample notifications if needed
  ];

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double appBarIconSize = screenSize.width * 0.075;
    final double appBarTitleSize = screenSize.width * 0.06;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 74, 140, 215),
          elevation: 0,
          leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
            iconSize: appBarIconSize,
          ),
          title: Center(
            child: Padding(
              padding: const EdgeInsets.only(right: 45.0),
              child: Text(
                AppLocalizations.of(context)!.notifications,
                style: GoogleFonts.assistant(
                  color: Colors.white,
                  fontSize: appBarTitleSize,
                  fontWeight: FontWeight.w700,
                ),
                // textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
        body: ListView.builder(
          itemCount: notifications.length,
          itemBuilder: (context, index) {
            final notification = notifications[index];
            return Card(
              margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: ListTile(
                title: Text(
                  notification.title,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 5),
                    Text(notification.message),
                    SizedBox(height: 5),
                    Text(
                      DateFormat('yMMMd, HH:mm').format(notification.timestamp),
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ],
                ),
                leading: Icon(
                  Icons.notifications,
                  color: Colors.brown,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
