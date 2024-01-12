import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: depend_on_referenced_packages
import 'package:ionicons/ionicons.dart';
import 'package:untitled2/chatlist.dart';
import 'package:untitled2/product/product.dart';
import 'package:untitled2/product/product_repo.dart';

import 'package:untitled2/payhistory.dart';
import 'package:untitled2/setting.dart';
import 'package:untitled2/verification.dart';
import 'package:untitled2/voucher/display_coupon.dart';
import 'package:untitled2/voucher/voucher_app.dart';

// ignore: must_be_immutable
class Dashboard extends StatelessWidget {
  Dashboard({super.key});
  // ignore: library_private_types_in_public_api
  final List<Product>? products = ProductRepo().list;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Seller'),
      ),
      body: SingleChildScrollView(
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
                          lable: "Products",
                          value: "0",
                          icon1: CupertinoIcons.cube_box),
                      SizedBox(
                        height: 12.h,
                      ),
                      _buiditeam(
                          lable: "Total Orders",
                          value: "0",
                          icon1: CupertinoIcons.square_list),
                    ],
                  ),
                  SizedBox(
                    width: 12.h,
                  ),
                  Column(
                    children: [
                      _buiditeam(
                          lable: "Rating",
                          value: "0.0",
                          icon1: CupertinoIcons.star),
                      SizedBox(
                        height: 12.h,
                      ),
                      _buiditeam(
                        lable: "Total Sales",
                        value: "đ0",
                        icon1: Ionicons.bar_chart_outline,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 80,
              color: const Color.fromRGBO(33, 150, 243, 1),
              child: Row(
                //crossAxisAlignment: CrossAxisAlignment.center,
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(
                    width: 20,
                  ),
                  GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ChatList(),
                      ),
                    ),
                    child: _buildicon(
                        name: "Messages",
                        icon: CupertinoIcons.chat_bubble_2_fill),
                  ),
                  const Spacer(),
                  GestureDetector(
                      // onTap: () => Navigator.push(
                      //       context,
                      //       MaterialPageRoute(
                      //         builder: (context) => const VoucherApp(),
                      //       ),
                      //     ),
                      child: _buildicon(
                          name: "Coupons", icon: CupertinoIcons.ticket_fill)),
                  const Spacer(),
                  GestureDetector(
                      onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const PayHistory(),
                            ),
                          ),
                      child: _buildicon(
                          name: "Payment History", icon: Icons.history)),
                  const Spacer(),
                  GestureDetector(
                      onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SettingSeller(),
                            ),
                          ),
                      child: Container(
                          child: _buildicon(
                              name: "Setting", icon: Icons.settings))),
                  const SizedBox(
                    width: 20,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 60,
              width: 350,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(8)),
              child: Center(
                child: Row(
                  children: [
                    const SizedBox(
                      width: 20,
                    ),
                    const Text(
                      "Your account has not been verified",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Verification(),
                        ),
                      ),
                      child: Container(
                        height: 40,
                        width: 100,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8)),
                        child: const Center(
                          child: Text(
                            "Verify now",
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Sales statistics"),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    maxLines: 4,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 10.0),
                      filled: true,
                      hoverColor: const Color(0XFFDADADA),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                 
                  const Text("Your Categories"),
                  const SizedBox(
                    height: 10,
                  ),
                  products != null && products!.isNotEmpty
                      ? SingleChildScrollView(
                          child: Container(
                            height: 120,
                            // width: double.infinity,
                            child: ListView.separated(
                                separatorBuilder: (context, index) => SizedBox(
                                      width: 10,
                                    ),
                                scrollDirection: Axis.horizontal,
                                // shrinkWrap: true,
                                //scrollDirection: Axis.horizontal,
                                itemCount: products!.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Container(
                                    height: 80,
                                    width: 80,
                                    child: Stack(
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          child: Image.network(
                                              products![index]!.images![0]),
                                        ),
                                        Positioned.fill(
                                          child: Align(
                                            alignment: Alignment.center,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              //mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                SizedBox(
                                                  height: 20,
                                                ),
                                                Text(
                                                  products![index].name!,
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 18,
                                                  ),
                                                ),
                                                Text(
                                                  products![index]
                                                      .availableQuantity
                                                      .toString(),
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 18,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],

                                      // title: Text(list![index].name!),
                                      //subtitle:Text(list![index].availableQuantity.toString()),
                                    ),
                                  );
                                }),
                          ),
                        )
                      : Container(),
                      const SizedBox(
                    height: 20,
                  ),

                  const Text("Top Prducts"),
                  const SizedBox(
                    height: 5,
                  ),
                  ListView.builder(
                      shrinkWrap: true,
                      itemCount: products!.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
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
                                      crossAxisAlignment: CrossAxisAlignment.start,
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
                  // Expanded(
                  //   child: ListView.builder(
                  //     itemCount: 4,
                  //     itemBuilder: (context, index){
                  //       return Container(
                  //         color: Colors.blue,
                  //         child: ListTile(
                  //           title: Text("helo"),
                  //         ),
                  //       );
                  //     },

                  //     ),
                  // ),

                  // Container(
                  //   decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.circular(8),
                  //     border: Border.all(
                  //       width: 1,
                  //       color: Color(0XFFDADADA),
                  //     ),
                  //   ),
                  //   child: Column(
                  //       crossAxisAlignment: CrossAxisAlignment.start,
                  //       children: [
                  //         SizedBox(
                  //           height: 10,
                  //         ),
                  //         Row(
                  //           children: [
                  //             SizedBox(
                  //               width: 12,
                  //             ),
                  //             Text(
                  //               'Order',
                  //               style: TextStyle(
                  //                 fontSize: 18,
                  //                 fontWeight: FontWeight.bold,
                  //               ),
                  //             ),
                  //           ],
                  //         ),
                  //         SizedBox(
                  //           height: 10,
                  //         ),
                  //         Row(
                  //           children: [
                  //             SizedBox(
                  //               width: 12,
                  //             ),
                  //             Text('This year'),
                  //           ],
                  //         ),
                  //         SizedBox(
                  //           height: 10,
                  //         ),
                  //         Padding(
                  //           padding: const EdgeInsets.all(12.0),
                  //           child: Column(
                  //             children: [
                  //               _buildoder(name1: "New order", value: "0", ic: CupertinoIcons.cart),
                  //               SizedBox(height: 10,),
                  //               _buildoder(name1: "Cancelled", value: "0", ic: Icons.content_paste_off_outlined),
                  //               SizedBox(height: 10,),
                  //               _buildoder(name1: "Delivering", value: "0", ic: Icons.local_shipping_outlined),
                  //               SizedBox(height: 10,),
                  //               _buildoder(name1: "Delivered", value: "0", ic: Icons.assignment_turned_in_outlined),
                  //               SizedBox(height: 10,),
                  //             ],
                  //           ),
                  //         )
                  //       ]),
                  // )
                ],
              ),
            ),
          ],
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
        height: 70,
        width: 180,
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

  Widget _buildicon({
    required String name,
    required IconData icon,
  }) =>
      Column(
        //crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 25,
            color: Colors.white,
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            name,
            style: const TextStyle(fontSize: 14, color: Colors.white),
          ),
        ],
      );
  Widget _buildoder({
    required String name1,
    required String value,
    required IconData ic,
  }) =>
      Container(
        height: 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            width: 1,
            color: const Color(0XFFDADADA),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              width: 20,
            ),
            Icon(
              ic,
              size: 40,
            ),
            const SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Text(
                  name1,
                  style: const TextStyle(
                    fontSize: 18,

                    ///fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 18,
                    //fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            )
          ],
        ),
      );
}
