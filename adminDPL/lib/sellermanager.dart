import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled2/address_infor.dart';

import 'package:untitled2/models/city.dart';
import 'package:untitled2/models/district.dart';
import 'package:untitled2/models/shop.dart';
import 'package:untitled2/product/product.dart';
import 'package:untitled2/product/product_repo.dart';



class SellerManager extends StatefulWidget {
  const SellerManager({super.key});

  @override
  State<SellerManager> createState() => __SellerManagerState();
}

class __SellerManagerState extends State<SellerManager> {

  void _removeTodo(String id) {
    setState(() {
      listshop.removeWhere((element) => element.id == id);
    });
    // _saveLocalData();
  }
    
    
    List<Shop> listshop = [
      Shop(
      ratingCount: 123,
      totalProduct: 32,
      name: "DK",
      addressInfor: AddressInfor(
          city: City(id: 8, name: "Tuyen Quang"),
          country: "Viet nam",
          isDefaultAddress: false,
          latitude: 123.12,
          longitude: 123,
          name: "My address",
          district: District(id: 123, name: "Hoang Mai")),
      contactPhone: "0987654321",
      id: "shopID01",
      shopDescription:
          "Cultivate your love for gardening with Green Thumb Nursery. We offer a variety of plants, gardening tools, and expert advice to help you create a vibrant and thriving garden.",
      logo:
          "https://cdn.shopify.com/shopifycloud/hatchful_web_two/bundles/4a14e7b2de7f6eaf5a6c98cb8c00b8de.png",
      rating: 4.4,
      shopView: 120,
      totalRevenue: 120000,
      totalOrder: 12,
    ),
    ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 2,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          heroTag: "b1",
          onPressed: () { 
            //  Navigator.push(
            //                 context,
            //                 MaterialPageRoute(
            //                   builder: (context) => const AddSeller(),
            //                 ),
            //  );
           },),
        appBar: AppBar(
          title: const Text('Seller Manager'),
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(
                child: Text("unconfimred",style: TextStyle(
                  fontSize: 18,
                ),),
                //icon: Icon(Icons.cloud_outlined),
              ),
              Tab(
                child: Text("confirm",style: TextStyle(
                  fontSize: 18,
                ),),
              ),
              
            ],
          ),
        ),
        body:  TabBarView(
          children: [
            Container(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Text("It's cloudy here"),
                    //build(context),
                  ],
                ),
              ),
            ),
            ListView.builder(
                      shrinkWrap: true,
                      itemCount: listshop!.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                          child: SingleChildScrollView(
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
                                    SizedBox(width: 10.w,),
                                    Container(
                                      height: 80.h,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: 10.h,
                                          ),
                                          Text(
                                            listshop![index].name!,
                                            style: TextStyle(fontSize: 16),
                                          ),
                                          Text(
                                            listshop![index].contactPhone!,
                                            style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.grey,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10.h,
                                          ),
                                          Text(
                                            listshop![index].totalProduct.toString(),
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Spacer(),
                                    IconButton(
                            icon: const Icon(Icons.delete),
                            //color: Colors.blueGrey,
                            onPressed: () {
                              //widget.onVoucherDeleted(voucher.id as String);
                              _removeTodo(listshop[index].id.toString());
                            },
                          ),

                                    // Image.network(
                                    //   listshop![index]!.images![0],
                                    //   height: 80.h,
                                    //   width: 80.w,
                                    //   fit: BoxFit.cover,
                                    // ),
                                    // SizedBox(
                                    //   width: 15.w,
                                    // ),
                          
                                    // Column(
                                    //   children: [
                                    //     Text("hello")
                                    //   ],
                                    // )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      }),

            
          ],
        ),
      ),
    );
  }
}

Widget build(BuildContext context)
{
  final List<Product>? listshop = ProductRepo().list;
   return ListView.builder(
                      shrinkWrap: true,
                      itemCount: listshop!.length,
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
                                    listshop![index]!.images![0],
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
                                          listshop![index].name!,
                                          style: TextStyle(fontSize: 16),
                                        ),
                                        Text(
                                          listshop![index].types.toString(),
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.grey,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10.h,
                                        ),
                                        Text(
                                          listshop![index].price.toString(),
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
                      });
}

