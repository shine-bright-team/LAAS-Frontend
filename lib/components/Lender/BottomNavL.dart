// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NavItem {
  Widget icon;
  String label;
  String path;
  bool isGo = false;
  NavItem(
      {required this.icon,
      required this.label,
      required this.path,
      this.isGo = false});
}

class BottomNavL extends StatelessWidget {
  final String? path;
  const BottomNavL({super.key, required this.path});

  @override
  Widget build(BuildContext context) {
    final paths = [
      NavItem(
          icon: const Icon(Icons.cottage_outlined),
          label: 'Home',
          path: "/l",
          isGo: true),
      NavItem(
          icon: const Icon(Icons.account_circle_outlined),
          label: 'Profile',
          path: "/l/profile",
          isGo: true),
    ];
    int whichIndex() {
      for (int i = 0; i < paths.length; i++) {
        if (path == paths[i].path) {
          return i;
        }
      }
      return 0;
    }

    void onChangeRoute(int index) {
      if (paths[index].isGo) {
        context.go(paths[index].path);
      } else {
        context.push(paths[index].path, extra: true);
      }
    }

    return SafeArea(
      child: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          for (NavItem i in paths)
            BottomNavigationBarItem(icon: i.icon, label: i.label)
        ],
        currentIndex: whichIndex(),
        unselectedItemColor: Colors.grey,
        selectedItemColor: Theme.of(context).colorScheme.primary,
        showUnselectedLabels: true,
        onTap: onChangeRoute,
      ),
    );
  }
}
