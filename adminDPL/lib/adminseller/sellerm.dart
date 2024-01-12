import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled2/address_infor.dart';
import 'package:untitled2/adminseller/confim_detail.dart';
import 'package:untitled2/adminseller/sellerscreen..dart';
import 'package:untitled2/models/city.dart';
import 'package:untitled2/models/district.dart';

import 'package:untitled2/models/verification_form.dart';

class SellerM extends StatefulWidget {
  @override
  _SellerMState createState() => _SellerMState();
}

class _SellerMState extends State<SellerM> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  List<VerificationForm> confirmingVerificationForms = [];
  List<VerificationForm> confirmedVerificationForms = [];
  List<VerificationForm> unconfirmedVerificationForms = [
    VerificationForm(
      licenseNo: "hhttp.jbg",
      taxPaper: "https://picsum.photos/250?image=9",
      shopName: "DK1",
      email: "example@gmail.com",
      phoneNumber: "0123456789",
      contactAddress: AddressInfor(
          city: City(id: 8, name: "Tuyen Quang"),
          country: "Viet nam",
          isDefaultAddress: false,
          latitude: 123.12,
          longitude: 123,
          name: "My address",
          district: District(id: 123, name: "Hoang Mai")),
    ),
    VerificationForm(
      licenseNo: "hhttp.jbg",
      taxPaper: "https://picsum.photos/250?image=9",
      shopName: "DK2",
      email: "example1@gmail.com",
      phoneNumber: "0123456789",
      contactAddress: AddressInfor(
          city: City(id: 8, name: "Tuyen Quang"),
          country: "Viet nam",
          isDefaultAddress: false,
          latitude: 123.12,
          longitude: 123,
          name: "My address",
          district: District(id: 123, name: "Hoang Mai")),
    ),
  ];
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  void confirmVerificationForm(VerificationForm a) {
    setState(() {
      unconfirmedVerificationForms.remove(a);
      confirmingVerificationForms.add(a);
    });
  }

  void cancelVerificationForm(VerificationForm a) {
    setState(() {
      unconfirmedVerificationForms.remove(a);
      confirmedVerificationForms.add(a);
    });
  }

  void _navigateToVerificationDetail(VerificationForm a) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => VerificationDetailScreen(
          verification: a,
          onConfirm: confirmVerificationForm,
          unConfirm: cancelVerificationForm,
        ),
      ),
    );
  }
  void _ToVerificationDetail(VerificationForm a) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailScreen(
          verification: a,
          onConfirm: confirmVerificationForm,
          unConfirm: cancelVerificationForm,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        heroTag: "bt1",
        onPressed: () {
          //  Navigator.push(
          //                 context,
          //                 MaterialPageRoute(
          //                   builder: (context) => const AddSeller(),
          //                 ),
          //  );
        },
      ),
      appBar: AppBar(
        title: Text('Seller Manager'),
        centerTitle: true,
       
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(
              text: 'Unconfimred',
            ),
            Tab(text: 'Cancelled'),
            Tab(text: 'Confimred'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          ListView.builder(
            itemCount: unconfirmedVerificationForms.length,
            itemBuilder: (context, index) {
              final VerificationForm = unconfirmedVerificationForms[index];
              return Padding(
                padding: EdgeInsets.fromLTRB(10.w, 10.h, 10.w, 10.h),
                child: SingleChildScrollView(
                  child: GestureDetector(
                    onTap: () =>
                        _navigateToVerificationDetail(VerificationForm),
                    child: Container(
                      //height: 120.h,
                      width: 340.w,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.r),
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.grey,
                              blurRadius: 10,
                              spreadRadius: 0,
                              offset: Offset(0, 0)),
                        ],
                      ),
                      child: Material(
                        //color: Colors.blue,
                        borderRadius: BorderRadius.circular(8),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(
                              width: 10.w,
                            ),
                            Container(
                              height: 80.h,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Text(
                                    '${VerificationForm.shopName}',
                                    style: TextStyle(fontSize: 16.sp),
                                  ),
                                  Text(
                                    '${VerificationForm.email}',
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  Text(
                                    '${VerificationForm.phoneNumber}',
                                    style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            Spacer(),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  // decoration: BoxDecoration(
                                  //   shape: BoxShape.circle,
                                  //   color: Colors.grey.shade200,
                                  // ),
                                  child: IconButton(
                                    color: Colors.red,
                                    icon: Icon(Icons.cancel),
                                    onPressed: () => cancelVerificationForm(
                                        VerificationForm),
                                  ),
                                ),
                                //SizedBox(width: 10.w,),
                                Container(
                                  // decoration: BoxDecoration(
                                  //   shape: BoxShape.circle,
                                  //   color: Colors.grey.shade200,
                                  // ),
                                  child: IconButton(
                                    color: Colors.green,
                                    icon: Icon(Icons.check_circle),
                                    onPressed: () => confirmVerificationForm(
                                        VerificationForm),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
          ListView.builder(
            itemCount: confirmedVerificationForms.length,
            itemBuilder: (context, index) {
              final VerificationForm = confirmedVerificationForms[index];
              return Padding(
                padding: EdgeInsets.fromLTRB(10.w, 10.h, 10.w, 10.h),
                child: SingleChildScrollView(
                  child: GestureDetector(
                    onTap: () =>
                        _ToVerificationDetail(VerificationForm),
                    child: Container(
                      //height: 120.h,
                      width: 340.w,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.r),
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.grey,
                              blurRadius: 10,
                              spreadRadius: 0,
                              offset: Offset(0, 0)),
                        ],
                      ),
                      child: Material(
                        //color: Colors.blue,
                        borderRadius: BorderRadius.circular(8.r),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(
                              width: 10.w,
                            ),
                            Container(
                              height: 80.h,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Text(
                                    '${VerificationForm.shopName}',
                                    style: TextStyle(fontSize: 16.sp),
                                  ),
                                  Text(
                                    '${VerificationForm.email}',
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  Text(
                                    '${VerificationForm.phoneNumber}',
                                    style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            //                     Spacer(),
                            //                     Row(
                            //   mainAxisSize: MainAxisSize.min,
                            //   children: [
                            //     IconButton(
                            //       icon: Icon(Icons.check),
                            //       onPressed: () => confirmVerificationForm(VerificationForm),
                            //     ),
                            //     IconButton(
                            //       icon: Icon(Icons.cancel),
                            //       onPressed: () => cancelVerificationForm(VerificationForm),
                            //     ),
                            //   ],
                            // ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
          ListView.builder(
            itemCount: confirmingVerificationForms.length,
            itemBuilder: (context, index) {
              final VerificationForm = confirmingVerificationForms[index];
              return Padding(
                padding: EdgeInsets.fromLTRB(10.w, 10.h, 10.w, 10.h),
                child: SingleChildScrollView(
                  child: GestureDetector(
                    onTap: () =>
                        _ToVerificationDetail(VerificationForm),
                    child: Container(
                      //height: 120.h,
                      width: 340.w,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.r),
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.grey,
                              blurRadius: 10,
                              spreadRadius: 0,
                              offset: Offset(0, 0)),
                        ],
                      ),
                      child: Material(
                        //color: Colors.blue,
                        borderRadius: BorderRadius.circular(8.r),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(
                              width: 10.w,
                            ),
                            Container(
                              height: 80.h,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Text(
                                    '${VerificationForm.shopName}',
                                    style: TextStyle(fontSize: 16.sp),
                                  ),
                                  Text(
                                    '${VerificationForm.email}',
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  Text(
                                    '${VerificationForm.phoneNumber}',
                                    style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            //                     Spacer(),
                            //                     Row(
                            //   mainAxisSize: MainAxisSize.min,
                            //   children: [
                            //     IconButton(
                            //       icon: Icon(Icons.check),
                            //       onPressed: () => confirmVerificationForm(VerificationForm),
                            //     ),
                            //     IconButton(
                            //       icon: Icon(Icons.cancel),
                            //       onPressed: () => cancelVerificationForm(VerificationForm),
                            //     ),
                            //   ],
                            // ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
