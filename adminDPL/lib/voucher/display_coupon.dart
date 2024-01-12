import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled2/voucher/add_coupon.dart';
import 'package:untitled2/voucher/edit_voucher..dart';
import 'package:untitled2/voucher/voucher.dart';

class DisplayCoupon extends StatefulWidget {
  final List<Voucher> vouchers;
  final Function(String) onVoucherDeleted;
  final Function(Voucher) onVoucherUpdated;

  const DisplayCoupon({super.key, 
    required this.vouchers,
    required this.onVoucherDeleted,
    required this.onVoucherUpdated,
  });

  @override
  State<DisplayCoupon> createState() => __DisplayCouponState();
}

class __DisplayCouponState extends State<DisplayCoupon> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.vouchers.length,
        padding: const EdgeInsets.all(20),
        itemBuilder: (context, index) {
          final voucher = widget.vouchers[index];
          return GestureDetector(
            onTap: (){

              
              _navigateToEditVoucherScreen(context,voucher);
            },
            child: Column(
              children: [
                SizedBox(
                  height: 20.h,
                ),
                Container(
                  // padding: EdgeInsets.symmetric(
                  //   horizontal: 5.h,
                  //   vertical: 5.h,
                  // ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(9),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        spreadRadius: 2.h,
                        blurRadius: 2.h,
                        offset: const Offset(
                          0,
                          4,
                        ),
                      ),
                    ],
                  ),
                  child: Row(
                    // mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 10.w,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 10.h,
                              ),
                              Text(
                                // "ggggg"
                                '${voucher.name}',
                                //style: theme.textTheme.titleSmall,
          
                                style: const TextStyle(fontSize: 20),
                              ),
                              Text(voucher.discountAmount!=null ?"amount":"percent"
                                  //'Price: ${voucher.price}',
                                  //style: theme.textTheme.bodySmall,
                                  // maxLines: 2,
                                  ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Text(
                               "${voucher.releasedDate!.toDate().year}/${voucher.releasedDate!.toDate().month}/${voucher.releasedDate!.toDate().day} - ${voucher.expDate!.toDate().year}/${voucher.expDate!.toDate().month}/${voucher.expDate!.toDate().day}"
                                //'Quantity: ${voucher.availableQuantity}',
                                //style: theme.textTheme.bodySmall,
                                ,
                                style: const TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton.filled(
                            hoverColor: Colors.blue,
                            color: Colors.blue,
                            icon: const Icon(Icons.edit),
                            onPressed: () {
                              _navigateToEditVoucherScreen(context,voucher);
                            },
                          ),
                          
                          IconButton(
                            icon: const Icon(Icons.delete),
                            //color: Colors.blueGrey,
                            onPressed: () {
                              widget.onVoucherDeleted(voucher.id as String);
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }
  void _navigateToEditVoucherScreen(BuildContext context, Voucher voucher) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditVoucher(
          voucher: voucher,
          onVoucherUpdated: widget.onVoucherUpdated, 
          vouchers: const [],  
           
        ),
      ),
    );
  }
}
