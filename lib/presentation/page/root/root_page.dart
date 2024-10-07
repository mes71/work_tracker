import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:work_tracker/domain/cubit/root/root_cubit.dart';
import 'package:work_tracker/presentation/routes/app_routes.dart';

class RootPage extends StatelessWidget {
  const RootPage({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RootCubit, int>(builder: (context, state) {
      return Scaffold(
          appBar: AppBar(
            title: const Text('Work Tracker'),
          ),
          body: child,
          bottomNavigationBar: BottomNavigationBar(
            onTap: (index) {
              context.read<RootCubit>().changePage(index);
              switch (index) {
                case 0:
                  context.go(AppPath.home);
                  break;
                case 1:
                  context.go(AppPath.report);
                  break;
                case 2:
                  context.go(AppPath.setting);
                  break;
              }
            },
            currentIndex: context.read<RootCubit>().state,
            enableFeedback: false,
            type: BottomNavigationBarType.shifting,
            selectedItemColor: Colors.green,
            unselectedItemColor: Colors.grey,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.house),
                activeIcon: Icon(CupertinoIcons.house_fill),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.square_list),
                activeIcon: Icon(CupertinoIcons.square_list_fill),
                label: 'Reports',
              ),
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.settings),
                label: 'Settings',
              ),
            ],
          ));
    });
  }
}
