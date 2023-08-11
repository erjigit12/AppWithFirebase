import 'package:bir_urma_clone/src/controllers/login_controller.dart';
import 'package:bir_urma_clone/src/utils/routes/route_name.dart';
import 'package:flutter/material.dart';
import '../../../components/profile_info_widget.dart';
import '../../../components/list_tile_widget.dart';
import '../../../controllers/profile_controller.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                onPressed: () {
                  LoginController().signOut(context);
                },
                icon: const Icon(
                  Icons.logout,
                  size: 30,
                  color: Colors.red,
                ),
              ),
              const SizedBox(width: 10),
            ],
          ),
          const SizedBox(height: 15),
          const Column(
            children: [
              ProfilInfoWidget(),
            ],
          ),
          const SizedBox(height: 60),
          ListTileWidget(
            onTap: () {
              Navigator.pushNamed(
                  context, RouteName.changeProfileAndPasswordScreen);
            },
            iconData: Icons.settings_outlined,
            title: 'Профилди ондоо',
          ),
          const SizedBox(height: 20),
          ListTileWidget(
            onTap: () {},
            iconData: Icons.save_outlined,
            title: 'Проекке салым',
          ),
          const SizedBox(height: 20),
          ListTileWidget(
            onTap: () {},
            iconData: Icons.notifications_on_outlined,
            title: 'Билдируу',
          ),
          const SizedBox(height: 20),
          ListTileWidget(
            onTap: () {},
            iconData: Icons.list_alt_outlined,
            title: 'Биздин демоорчулор',
          ),
          const SizedBox(height: 20),
          ListTileWidget(
            onTap: () {},
            iconData: Icons.star_border,
            title: 'Баалоо',
          ),
          const SizedBox(height: 20),
          ListTileWidget(
            onTap: () {
              ProfileController().showShareLinkDiolog(context);
            },
            iconData: Icons.share_outlined,
            title: 'Болушуу',
          ),
          const SizedBox(height: 20),
          ListTileWidget(
            onTap: () {
              Navigator.pushNamed(context, RouteName.sunushPikirScreen);
            },
            iconData: Icons.live_help_outlined,
            title: 'Сунуш-пикирлер',
          ),
        ],
      ),
    );
  }
}
