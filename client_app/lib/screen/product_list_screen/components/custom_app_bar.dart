import 'package:e_commerce_app/utility/extensions.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import '../../../models/user.dart';
import '../../../utility/app_color.dart';
import '../../../utility/constants.dart';
import '../../../widget/app_bar_action_button.dart';
import '../../../widget/custom_search_bar.dart';
import '../../profile_screen/profile_screen.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(100);

  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ProfileScreen()),
                );
              },
              child: const CircleAvatar(
                radius: 24, // Adjust size as needed
                backgroundColor: AppColor.darkOrange, // Use your orange color
                backgroundImage: AssetImage(
                  'assets/images/profile_pic.png',
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: CustomSearchBar(
                controller: TextEditingController(),
                onChanged: (val) {
                  context.dataProvider.filterProducts(val);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
