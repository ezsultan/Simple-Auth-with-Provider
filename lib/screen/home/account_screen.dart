import 'package:ezcommerce/provider/auth_provider.dart';
import 'package:ezcommerce/service/auth_services.dart';
import 'package:ezcommerce/shared/theme.dart';
import 'package:ezcommerce/widget/custom_widget/custom_button.dart';
import 'package:ezcommerce/widget/custom_widget/custome_about_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    handleLogout() async {
      bool? logout = await AuthService().removeToken();
      if (logout ?? true) {
        Get.toNamed('signin');
        print(authProvider.token?.token);
      }
    }

    // Widget content() {
    //   return Column(
    //     children: [
    //       CustomAboutTile(
    //         iconUrl: 'assets/User.png',
    //         title: 'Profile',
    //         onTap: () {
    //           Get.toNamed('/profile');
    //         },
    //       ),
    //       CustomAboutTile(
    //         iconUrl: 'assets/bag.png',
    //         title: 'Order',
    //         onTap: () {},
    //       ),
    //       CustomAboutTile(
    //         iconUrl: 'assets/Location.png',
    //         title: 'Address',
    //         onTap: () {},
    //       ),
    //       CustomAboutTile(
    //         iconUrl: 'assets/card.png',
    //         title: 'Payment',
    //         onTap: () {},
    //       ),
    //     ],
    //   );
    // }

    // Widget logoutButton() {
    //   return CustomButton(
    //     text: 'Logout',
    //     onPressed: handleLogout,
    //     color: redColor,
    //   );
    // }
    Widget content() {
      return Column(
        children: [
          CustomAboutTile(
            iconUrl: 'assets/User.png',
            title: 'Profile',
            onTap: () {
              Get.toNamed('/profile');
            },
          ),
          CustomAboutTile(
            iconUrl: 'assets/bag.png',
            title: 'Order',
            onTap: () {},
          ),
          CustomAboutTile(
            iconUrl: 'assets/Location.png',
            title: 'Address',
            onTap: () {},
          ),
          CustomAboutTile(
            iconUrl: 'assets/card.png',
            title: 'Payment',
            onTap: () {},
          ),
        ],
      );
    }

    Widget logoutButton() {
      return Padding(
        padding: EdgeInsets.only(
          left: defaultMargin,
          bottom: defaultMargin,
          right: defaultMargin,
        ),
        child: CustomButton(
          text: 'Logout',
          color: redColor,
          onPressed: handleLogout,
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Account',
          style: blackTextstyle.copyWith(
            fontWeight: bold,
          ),
        ),
        bottom: PreferredSize(
          child: Container(
            height: 1,
            color: borderColor,
          ),
          preferredSize: const Size.fromHeight(1),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: [
          content(),
          const Spacer(),
          logoutButton(),
        ],
      ),
    );
  }
}
