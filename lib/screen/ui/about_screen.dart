// import 'package:ezcommerce/shared/theme.dart';
// import 'package:ezcommerce/widget/custom_widget/custom_button.dart';
// import 'package:ezcommerce/widget/custom_widget/custom_profile_tile.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class AboutScreen extends StatelessWidget {
//   const AboutScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     Widget header() {
//       return Row(
//         children: [
//           Container(
//             width: 70,
//             height: 70,
//             decoration: BoxDecoration(
//               color: blackColor,
//               borderRadius: BorderRadius.circular(90),
//               image: const DecorationImage(
//                 image: AssetImage(
//                   'assets/avatar.jpg',
//                 ),
//               ),
//             ),
//           ),
//           const SizedBox(width: 15),
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 'Sultan Setiawan',
//                 style: blackTextstyle.copyWith(
//                   fontWeight: bold,
//                 ),
//               ),
//               const SizedBox(height: 4),
//               Text(
//                 '@Sultan',
//                 style: blackTextstyle.copyWith(
//                   fontSize: 12,
//                   fontWeight: light,
//                 ),
//               ),
//             ],
//           ),
//         ],
//       );
//     }

//     Widget content() {
//       return Column(
//         children: const [
//           CustomProfileTile(
//             title: 'Gender',
//             iconUrl: 'assets/Gender.png',
//             information: 'Male',
//           ),
//           CustomProfileTile(
//             title: 'Birthday',
//             iconUrl: 'assets/Date.png',
//             information: '08-09-2002',
//           ),
//           CustomProfileTile(
//             title: 'Email',
//             iconUrl: 'assets/Message.png',
//             information: 'Email',
//           ),
//           CustomProfileTile(
//             title: 'Phone Number',
//             iconUrl: 'assets/Phone.png',
//             information: 'Male',
//           ),
//           CustomProfileTile(
//             title: 'Change Password',
//             iconUrl: 'assets/Password.png',
//             information: '..........',
//           ),
//         ],
//       );
//     }

//     Widget logoutButton() {
//       return CustomButton(
//         text: 'Logout',
//         onPressed: () {
//           Get.offAllNamed('/signin');
//         },
//         color: redColor,
//       );
//     }

//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'Profile',
//           style: blackTextstyle.copyWith(
//             fontWeight: bold,
//           ),
//         ),
//         bottom: PreferredSize(
//             child: Container(
//               height: 1,
//               color: borderColor,
//             ),
//             preferredSize: const Size.fromHeight(1)),
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         leading: IconButton(
//           onPressed: () {},
//           icon: Icon(
//             Icons.chevron_left,
//             color: greyColor,
//             size: 30,
//           ),
//         ),
//       ),
//       body: Padding(
//         padding: EdgeInsets.symmetric(
//           horizontal: defaultMargin,
//           vertical: 24,
//         ),
//         child: Column(
//           children: [
//             header(),
//             const SizedBox(height: 30),
//             content(),
//             const Spacer(),
//             logoutButton(),
//           ],
//         ),
//       ),
//     );
//   }
// }
