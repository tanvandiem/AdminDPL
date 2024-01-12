import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled2/adminseller/admin_category.dart';
import 'package:untitled2/adminseller/dashadmin.dart';
import 'package:untitled2/adminseller/deliver_admin.dart';
import 'package:untitled2/adminseller/sellerm.dart';
import 'package:untitled2/categoryuser/category_user.dart';


import 'package:untitled2/dashboard.dart';
import 'package:untitled2/orderseller.dart';
import 'package:untitled2/product/product_app.dart';
import 'package:untitled2/sellermanager.dart';
import 'package:untitled2/voucher/voucher_app.dart';
import 'package:untitled2/voucher_user.dart';


class MainViewAdmin extends StatefulWidget {
  const MainViewAdmin({super.key});

  @override
  State<MainViewAdmin> createState() => _MainViewState();
}

class _MainViewState extends State<MainViewAdmin> {
  List<Widget> pages = [
    
    DashAdmin(),
    
    SellerM(),
   //VoucherApp()
    CategoryListScreen(),
    DeliverListScreen()
   
  ];
  int indexPage = 0;

  @override
  Widget build(BuildContext context) {
    return
        // ChangeNotifierProvider(
        //   create: (context) => CartViewModel(),
        //   child:
        Scaffold(
      //drawer: ConsumerDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: true,
        showUnselectedLabels: true,
        onTap: (value) {
          setState(() {
            indexPage = value;
          });
        },
        unselectedItemColor: Colors.black26,
        useLegacyColorScheme: false,
        backgroundColor: Color.fromARGB(255, 98, 170, 212),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard_outlined),
            label: "Dashboard",
          ),
          BottomNavigationBarItem(
            icon:  Icon(Icons.manage_accounts_outlined),
            
            label: "Seller",
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.ticket),
            label: "Voucher",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.category_outlined,
            ),
            label: "Category",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.local_shipping_outlined,
            ),
            label: "Profile",
          ),
        ],
        currentIndex: indexPage,
        iconSize: 25,
        selectedFontSize: 8,
        selectedItemColor: Colors.blue.shade400,
      ),
      body: IndexedStack(
        index: indexPage,
        children: pages,
      ),
      // ),
    );
  }
}
