import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: depend_on_referenced_packages
import 'package:ionicons/ionicons.dart';

import 'package:untitled2/product/product.dart';
import 'package:untitled2/product/product_repo.dart';

// ignore: must_be_immutable
class DashAdmin extends StatelessWidget {
  DashAdmin({super.key});
  // ignore: library_private_types_in_public_api
  final List<Product>? products = ProductRepo().list;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                height: 40.h,
              ),
              Padding(
                padding: const EdgeInsetsDirectional.all(8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        _buiditeam(
                            lable: "User",
                            value: "1000",
                            icon1: Icons.account_box),
                        SizedBox(
                          height: 12.h,
                        ),
                        _buiditeam(
                            lable: "Seller",
                            value: "1000",
                            icon1: Icons.manage_accounts),
                      ],
                    ),
                    SizedBox(
                      width: 12.h,
                    ),
                    Column(
                      children: [
                        _buiditeam(
                            lable: "Order",
                            value: "1000",
                            icon1: CupertinoIcons.cart_fill),
                        SizedBox(
                          height: 12.h,
                        ),
                        _buiditeam(
                          lable: "Product",
                          value: "1000",
                          icon1: CupertinoIcons.cube_box_fill,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
             
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                        children: [
                          _buiditeam1(
                              lable: "Category",
                              value: "1000",
                              icon1: Icons.category),
                          SizedBox(
                            width: 12.h,
                          ),
                          _buiditeam1(
                              lable: "Delivery ",
                              value: "1000",
                              icon1: Icons.local_shipping_rounded),
                        ],
                      ),
              ),
              SizedBox(
                            height: 10.h,
                          ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Top Products",
                    style: TextStyle(
                      fontSize: 20.sp
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  ListView.builder(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemCount: products!.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: EdgeInsets.fromLTRB(10.w, 10.h, 10.w, 10.h),
                          child: Container(
                            //height: 120.h,
                            width: 340.w,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
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
                                  Image.network(
                                    products![index]!.images![0],
                                    height: 80.h,
                                    width: 80.w,
                                    fit: BoxFit.cover,
                                  ),
                                  SizedBox(
                                    width: 15.w,
                                  ),
                                  Container(
                                    height: 80.h,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 10.h,
                                        ),
                                        Text(
                                          products![index].name!,
                                          style: TextStyle(fontSize: 16),
                                        ),
                                        Text(
                                          products![index].types.toString(),
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.grey,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10.h,
                                        ),
                                        Text(
                                          products![index].price.toString(),
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),

                                  // Column(
                                  //   children: [
                                  //     Text("hello")
                                  //   ],
                                  // )
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buiditeam({
    required String lable,
    required String value,
    required IconData icon1,
  }) =>
      Container(
        height: 120.h,
        width: 160.w,
        decoration: BoxDecoration(
            color: Colors.blue, borderRadius: BorderRadius.circular(10)),
        child:
            //SizedBox(width: 10,),

            Stack(
          //alignment: Alignment.topCenter,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(5.w, 5.h, 0, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    icon1,
                    size: 75.sp,
                    color: Color.fromARGB(151, 33, 82, 243),
                  ),
                ],
              ),
            ),

            //padding: EdgeInsets.fromLTRB(40.w, 40.h, 0, 0),
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                // mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    height: 30.h,
                  ),
                  Text(
                    value,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24.sp,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    lable,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 19.sp,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    Widget _buiditeam1({
    required String lable,
    required String value,
    required IconData icon1,
  }) =>
      Container(
        height: 70.h,
        width: 160.w,
        decoration: BoxDecoration(
            color: Colors.blue, borderRadius: BorderRadius.circular(10)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //SizedBox(width: 10,),
            Row(
              children: [
                const SizedBox(
                  width: 10,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      lable,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      value,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              children: [
                Icon(
                  icon1,
                  size: 40,
                  color: Colors.white,
                ),
                const SizedBox(
                  width: 10,
                ),
              ],
            )
          ],
        ),
      );
}
