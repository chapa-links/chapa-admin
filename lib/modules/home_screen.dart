import 'package:chapa_admin/generated/assets.gen.dart';
import 'package:chapa_admin/utils/__utils.dart';
import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';
import 'package:chapa_admin/modules/authentication/services/auth_service.dart';
import 'categories/screens/categories.dart';
import 'categories/screens/sub_categories.dart';
import 'dashboard/screens/dashboard.dart';
import 'users/screens/users.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController pageController = PageController();
  SideMenuController sideMenu = SideMenuController();

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
    const DashboardScreen(),
    const CategoriesScreen(),
    const SubCategoriesScreen(),
    const UsersScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Admin Dashboard',
          style: AppStyles.urbanist24Smbd.copyWith(color: Colors.black),
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
                },
                icon: const Icon(Icons.home),
              ),
              SideMenuExpansionItem(
                title: "Item Categories",
                icon: const Icon(Icons.kitchen),
                children: [
                  SideMenuItem(
                    title: 'All Categories',
                    onTap: (index, _) {
                      sideMenu.changePage(index);
                    },
                    icon: const Icon(Icons.category_outlined),
                  ),
                  SideMenuItem(
                    title: 'Subcategories',
                    onTap: (index, _) {
                      sideMenu.changePage(index);
                    },
                    icon: const Icon(Icons.supervisor_account),
                  )
                ],
              ),
              SideMenuItem(
                title: 'Users',
                onTap: (index, _) {
                  sideMenu.changePage(index);
                },
                icon: const Icon(Icons.people_outline),
                // badgeContent: const Text(
                //   '3',
                //   style: TextStyle(color: Colors.white),
                // ),
              ),
              SideMenuItem(
                title: 'Exit',
                onTap: (x, sideMenu) {},
                icon: const Icon(Icons.exit_to_app),
              ),
            ],
          ),
          // NavigationRail(
          //   selectedIndex: _selectedIndex,
          //   onDestinationSelected: _onItemTapped,
          //   extended: true,
          //   selectedLabelTextStyle:
          //       TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          //   unselectedLabelTextStyle: TextStyle(
          //       fontSize: 16,
          //       fontWeight: FontWeight.w500,
          //       color: Color(0xFF908F9C)),
          //   selectedIconTheme: IconThemeData(color: Colors.black),
          //   unselectedIconTheme: IconThemeData(color: Color(0xFF908F9C)),
          //   // labelType: NavigationRailLabelType.selected,
          //   useIndicator: false,
          //   destinations: const [
          //     NavigationRailDestination(
          //       icon: Icon(Icons.grid_view_rounded),
          //       selectedIcon: Icon(Icons.grid_view_rounded),
          //       label: Text('Dashboard'),
          //       padding: EdgeInsets.symmetric(vertical: 8),
          //     ),
          //     NavigationRailDestination(
          //       icon: Icon(Icons.people),
          //       selectedIcon: Icon(Icons.people),
          //       label: Text('Users'),
          //       padding: EdgeInsets.symmetric(vertical: 8),
          //     ),
          //     NavigationRailDestination(
          //       icon: Icon(Icons.category),
          //       selectedIcon: Icon(Icons.category),
          //       label: Text('Categories'),
          //       padding: EdgeInsets.symmetric(vertical: 8),
          //     ),
          //   ],
          // ),
          30.width,
          Expanded(
            child: PageView(
              controller: pageController,
              children: pages,
            ),
          ),
        ],
      ),
    );
  }
}
