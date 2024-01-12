import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled2/models/verification_form.dart';

class DetailScreen extends StatelessWidget {
  final VerificationForm verification;
  final Function(VerificationForm) onConfirm;
  final Function(VerificationForm) unConfirm;
  // ignore: prefer_const_constructors_in_immutables
  DetailScreen(
      {super.key,
      required this.verification,
      required this.onConfirm,
      required this.unConfirm});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Infomation detail'),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(18.w, 10.h, 18.w, 10.h),
        child: SingleChildScrollView(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Infomation seller',
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 18.h),

              Row(
                children: [
                  Text(
                    'Shop name',
                    style: TextStyle(
                      fontSize: 18.sp,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    '${verification.shopName}',
                    style: TextStyle(
                      fontSize: 18.sp,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              Divider(
                height: 2.w,
              ),
              SizedBox(height: 10.h),
              Row(
                children: [
                  Text(
                    'Phone number',
                    style: TextStyle(
                      fontSize: 18.sp,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    '${verification.phoneNumber}',
                    style: TextStyle(
                      fontSize: 18.sp,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              Divider(
                height: 2.w,
              ),
              SizedBox(height: 10.h),
              Row(
                children: [
                  Text(
                    'Email',
                    style: TextStyle(
                      fontSize: 18.sp,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    '${verification.email}',
                    style: TextStyle(
                      fontSize: 18.sp,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              Divider(
                height: 2.w,
              ),
              SizedBox(height: 10.h),
              Row(
                children: [
                  Text(
                    'Address',
                    style: TextStyle(
                      fontSize: 18.sp,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    '${verification.contactAddress?.district} ${verification.contactAddress?.city}',
                    style: TextStyle(
                      fontSize: 18.sp,
                    ),
                    maxLines: 3,
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              Divider(
                height: 2.w,
              ),
              SizedBox(height: 10.h),
              Text(
                'Legal information',
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 18.h),
              
              SizedBox(height: 18.h),
              Text(
                'License',
                style: TextStyle(
                  fontSize: 18.sp,
                ),
              ),
              SizedBox(height: 18.h),
              // Center(
              //   child: Container(
              //     child: Image.network(
              //       'https://picsum.photos/250?image=9',
              //     ),
              //   ),
              // ),
              Text(
                '${verification.licenseNo}',
                style: TextStyle(
                  fontSize: 18.sp,
                ),
              ),
              SizedBox(height: 18.h),
              Text(
                'Tap paper',
                style: TextStyle(
                  fontSize: 18.sp,
                ),
              ),
              SizedBox(height: 30.h),
              Center(
                child: Image.network(
                  "${verification.taxPaper}",
                  height: 160.h,
                  width: 320.w,
                  
                ),
              ),
              
            ],
          ),
        ),
      ),
      // bottomNavigationBar: Padding(
      //   padding:  EdgeInsets.all(10.h),
      //   child: Row(
      //     mainAxisSize: MainAxisSize.min,
      //     children: [
      //       SizedBox(
      //         width: 30.w,
      //       ),
      //       Container(
      //         decoration: BoxDecoration(
      //           shape: BoxShape.circle,
      //           color: Colors.grey.shade200,
      //         ),
      //         child: IconButton(
      //             iconSize: 40,
      //             color: Colors.red,
      //             icon: Icon(Icons.close),
      //             onPressed: () {
      //               unConfirm(verification);
      //               Navigator.pop(context);
      //             }
      
      //             //cancelVerificationForm(VerificationForm),
      //             ),
      //       ),
      //       Spacer(),
      //       Container(
      //         decoration: BoxDecoration(
      //           shape: BoxShape.circle,
      //           color: Colors.grey.shade200,
      //         ),
      //         child: IconButton(
      //             color: Colors.green,
      //             iconSize: 40,
      //             icon: Icon(Icons.check),
      //             onPressed: () {
      //               onConfirm(verification);
      //               Navigator.pop(context);
      //             }
      //             // confirmVerificationForm(VerificationForm),
      //             ),
      //       ),
      //       SizedBox(
      //         width: 30.w,
      //       ),
      //     ],
          
      //   ),
      // ),
    );
  }
}
