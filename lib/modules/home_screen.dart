import 'package:chapa_admin/generated/assets.gen.dart';
import 'package:chapa_admin/locator.dart';
import 'package:chapa_admin/navigation_service.dart';
import 'package:chapa_admin/routing/route_names.dart';
import 'package:chapa_admin/utils/__utils.dart';
import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';
import 'package:chapa_admin/modules/authentication/services/auth_service.dart';
import 'categories/screens/categories.dart';
import 'dashboard/screens/dashboard.dart';
import 'users/screens/users.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.child});
  final Widget child;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController pageController = PageController();
  SideMenuController sideMenu = SideMenuController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void initState() {
    // Connect SideMenuController and PageController together
    sideMenu.addListener((index) {
      pageController.jumpToPage(index);
    });
    super.initState();
  }

  List items = [];

  static final List<Widget> pages = <Widget>[
    const CategoriesScreen(),
    const DashboardScreen(),
    const UsersScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    // final authService = Provider.of<AuthService>(context);

    return Consumer<AuthService>(builder: (context, authService, __) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            'Admin Dashboard',
            style: AppStyles.urbanist20Md.copyWith(
              color: Colors.black,
              fontWeight: FontWeight.w900,
            ),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () async {
                await authService.signOut();
              },
            ),
          ],
        ),
        body: Row(
          children: [
            if (_auth.currentUser != null)
              SideMenu(
                // Page controller to manage a PageView
                controller: sideMenu,
                // Will shows on top of all items, it can be a logo or a Title text
                title: Image.asset(
                  Assets.logo.path,
                  height: 76,
                ),
                // Will show on bottom of SideMenu when displayMode was SideMenuDisplayMode.open
                footer: const Text('Chapa Now Admin dashboard'),
                // Notify when display mode changed
                onDisplayModeChanged: (mode) {
                  // print(mode);
                },
                style: SideMenuStyle(
                  selectedColor: AppColors.primary,
                  selectedIconColor: Colors.white,
                  unselectedIconColor: AppColors.primary,
                  arrowOpen: AppColors.primary,
                  // showHamburger: true,
                  selectedTitleTextStyleExpandable:
                      AppStyles.urbanist16SmBd.copyWith(color: Colors.white),
                  selectedTitleTextStyle:
                      AppStyles.urbanist16SmBd.copyWith(color: Colors.white),
                  selectedHoverColor: AppColors.primary,
                ),
                items: [
                  SideMenuItem(
                    title: 'Dashboard',
                    onTap: (index, _) {
                      sideMenu.changePage(index);

                      locator<NavigationService>().navigateTo(dashboard);
                    },
                    icon: const Icon(Icons.home),
                  ),
                  SideMenuItem(
                    title: 'All Categories',
                    onTap: (index, _) {
                      sideMenu.changePage(index);

                      locator<NavigationService>().navigateTo(categories);
                    },
                    icon: const Icon(Icons.category_outlined),
                  ),
                  SideMenuItem(
                    title: 'Users',
                    onTap: (index, _) {
                      sideMenu.changePage(index);
                      locator<NavigationService>().navigateTo(usersRoute);
                    },
                    icon: const Icon(Icons.people_outline),
                    // badgeContent: const Text(
                    //   '3',
                    //   style: TextStyle(color: Colors.white),
                    // ),
                  ),
                  SideMenuItem(
                    title: 'Log out',
                    onTap: (x, sideMenu) async {
                      await _auth.signOut();
                      locator<NavigationService>().replace(login);
                    },
                    icon: const Icon(Icons.exit_to_app),
                  ),
                ],
              ),
            30.width,
            Expanded(
              child: widget.child,
              //  PageView(
              //   controller: pageController,
              //   children: pages,
              // ),
            ),
          ],
        ),
      );
    });
  }
}
