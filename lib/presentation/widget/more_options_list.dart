import 'package:facebook/domain/entities/user_entity.dart';
import 'package:facebook/presentation/widget/profile_avatar.dart';
import 'package:facebook/presentation/widget/style/palette.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class MoreOptionsList extends StatelessWidget {
  final List<List> _moreOptionsList = const [
    [MdiIcons.shieldAccount, Colors.deepPurple, 'COVID-19 Info Center'],
    [MdiIcons.accountMultiple, Colors.cyan, 'Friends'],
    [MdiIcons.facebookMessenger, Palette.facebookBlue, 'Messenger'],
    [MdiIcons.flag, Colors.orange, 'Pages'],
    [MdiIcons.storefront, Palette.facebookBlue, 'Marketplace'],
    [Icons.ondemand_video, Palette.facebookBlue, 'Watch'],
    [MdiIcons.calendarStar, Colors.red, 'Events'],
  ];

  final UserEntity currentUser;

  const MoreOptionsList({Key? key, required this.currentUser})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: 280.0),
      child: ListView.builder(
        itemCount: 1 + _moreOptionsList.length,
        itemBuilder: (context, index) {
          if (index == 0) {
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: InkWell(
                onTap: () => print("User Card"),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ProfileAvatar(imageUrl: currentUser.imageUrl),
                    SizedBox(
                      width: 6.0,
                    ),
                    Flexible(
                        child: Text(
                      "${currentUser.name}",
                      style: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.w500),
                      overflow: TextOverflow.ellipsis,
                    )),
                  ],
                ),
              ),
            );
          }
          final List option = _moreOptionsList[index - 1];
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: _option(icon: option[0], color: option[1], label: option[2]),
          );
        },
      ),
    );
  }
}

class _option extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String label;

  const _option({
    Key? key,
    required this.icon,
    required this.color,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => print(label),
      child: Row(
        children: [
          Icon(icon, size: 38.0, color: color),
          const SizedBox(width: 6.0),
          Flexible(
            child: Text(
              label,
              style: const TextStyle(fontSize: 16.0),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
