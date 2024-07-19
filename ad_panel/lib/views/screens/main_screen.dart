


import 'package:ad_panel/views/screens/side_bar_screen/categories_screen.dart';
import 'package:ad_panel/views/screens/side_bar_screen/dashboard_screen.dart';
import 'package:ad_panel/views/screens/side_bar_screen/uppload_banner_screen.dart';
import 'package:ad_panel/views/screens/side_bar_screen/vendor_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  Widget _selectedItem = DashboardScreen();

  screenSelector(item){
    switch (item.route){
      case DashboardScreen.routeName:
      setState(() {
        _selectedItem = DashboardScreen();
      });
      break;

      case VendorScreen.routeName:
      setState(() {
        _selectedItem = VendorScreen();
      });
      break;
      
      
      case UploadBannerScreen.routeName:
      setState(() {
        _selectedItem = UploadBannerScreen();
      });
      break;
               
      case CategoriesScreen.routeName:
      setState(() {
        _selectedItem = CategoriesScreen();
      });
      break;
    }
  }


  @override
  Widget build(BuildContext context) {
    return AdminScaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 225, 15, 0),
        title: Text('Management M4M',
        style: TextStyle(
        fontFamily: 'Roboto',
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
        ), 
        
      ),


      sideBar: SideBar(items: [
          AdminMenuItem(
            title: 'Dashboard',
            icon: Icons.dashboard, 
            route: DashboardScreen.routeName, 
          ),
          AdminMenuItem(
            title: 'Vendors',
            icon: CupertinoIcons.person_3, 
            route: VendorScreen.routeName, 
          ),  
          AdminMenuItem(
            title: 'Categories',
            icon: Icons.category, 
            route: CategoriesScreen.routeName, 
          ),
          AdminMenuItem(
            title: 'Upload Banner',
            icon: CupertinoIcons.pencil, 
            route: UploadBannerScreen.routeName, 
          ),
      ], 
      selectedRoute: '',
      onSelected: (item){
        screenSelector(item);
      },
      // header: Container(
      //     height: 50,
      //     width: double.infinity,
      //     color:  Color.fromARGB(255, 186, 16, 4),
      //     child: const Center(
      //       child: Text(
      //         'M4M',
      //         style: TextStyle(
      //           color: Colors.white,
      //         ),
      //       ),
      //     ),
      //   ),
      ),
      body: _selectedItem);
  }
}
