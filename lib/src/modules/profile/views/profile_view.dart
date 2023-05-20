import 'package:bir_urma_clone/src/constants/text_style/app_text_style.dart';
import 'package:bir_urma_clone/src/modules/profile/views/profildi_ondoo_page.dart';
import 'package:bir_urma_clone/src/modules/profile/views/sunush_pikirler_page.dart';
import 'package:flutter/material.dart';
import '../../../components/profile_info_widget.dart';
import '../../../components/list_tile_widget.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                onPressed: () {},
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
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const ProfildiOndoo();
                  },
                ),
              );
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
              showDialog(
                context: context,
                builder: (context) {
                  return SizedBox(
                    width: 20,
                    child: AlertDialog(
                      alignment: Alignment.bottomRight,
                      backgroundColor: const Color(0xFFE7F1FF),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      title: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.filter_none,
                                size: 20,
                              ),
                              SizedBox(width: 30),
                              Expanded(
                                child: Text(
                                  'Ссылканы кочуруу',
                                  style: AppTextStyle.f20w400,
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5),
                            child: Divider(thickness: 1),
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.reply_outlined,
                                size: 30,
                              ),
                              SizedBox(width: 20),
                              Expanded(
                                child: Text(
                                  'Башка тиркемеде болушуу',
                                  textAlign: TextAlign.start,
                                  style: AppTextStyle.f20w400,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },
              );
            },
            iconData: Icons.share_outlined,
            title: 'Болушуу',
          ),
          const SizedBox(height: 20),
          ListTileWidget(
            onTap: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => const SunushPikirlerPage(),
                ),
                (route) => false,
              );
              // context.router.push(
              //   const SunushPikirlerPageRoute(),
              // );
            },
            iconData: Icons.live_help_outlined,
            title: 'Сунуш-пикирлер',
          ),
        ],
      ),
    );
  }
}
