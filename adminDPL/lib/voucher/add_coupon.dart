import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled2/product/product.dart';
import 'package:untitled2/product/product_repo.dart';

import 'package:untitled2/voucher/voucher.dart';
import 'package:untitled2/voucher/voucher_app.dart';

class AddCoupon extends StatefulWidget {
  final List<Voucher> vouchers;
  final Function(Voucher) onVoucherAdded;
  AddCoupon({required this.vouchers, required this.onVoucherAdded});
  @override
  State<AddCoupon> createState() => __AddCouponState();
}

class __AddCouponState extends State<AddCoupon> {
  // DateTimeRange dateRange = DateTimeRange(
  //   start: DateTime.now(),
  //   end: DateTime.now().add(const Duration(days: 30)),
  // );

  TextEditingController _nameController = TextEditingController();
  TextEditingController _percentController = TextEditingController();
  TextEditingController _amountController = TextEditingController();
  

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? dropdownValue = "Product";
  String discountType = "Percent";
  int? discountAmount;
  int? discountPercent;
  Timestamp? startDate = Timestamp.fromDate(DateTime.now());
  Timestamp? expDate =
      Timestamp.fromDate(DateTime.now().add(const Duration(days: 30)));

  Product? selectedProduct;
  List<Product>? list = ProductRepo().list;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AddCoupon'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Voucher",
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  height: 10.h,
                ),
                DropdownButtonFormField(
                  borderRadius: BorderRadius.circular(10),
                  //dropdownColor: Colors.grey,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  value: dropdownValue,
                  onChanged: ((String? newvalue) {
                    setState(() {
                      dropdownValue = newvalue!;
                    });
                   
                  }),
                  items: const [
                    DropdownMenuItem(
                      child: Text("For Product"),
                      value: "Product",
                    ),
                    DropdownMenuItem(
                      child: Text("For Shop"),
                      value: "Shop",
                    ),
                  ],
                  isExpanded: true,
                ),
            //     Text(
            //   'You selected: $dropdownValue',
            //   style: TextStyle(fontSize: 20),
            // ),
                if (dropdownValue == "Product")
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        'Select Product:',
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(height: 10.h,),
                      DropdownButtonFormField<Product>(
                        borderRadius: BorderRadius.circular(10),
                        //dropdownColor: Colors.grey,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        value: selectedProduct,
                        isExpanded: true,
                        items: list!.map((Product p) {
                          return DropdownMenuItem<Product>(
                            value: p,
                            child: Text(p.name!),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          setState(() {
                            selectedProduct = newValue!;
                            // Reset selected product when category changes
                          });
                        },
                      ),
                      // Hiển thị danh sách sản phẩm ở đây
                      // Ví dụ: ListView.builder(...)
                    ],
                  ),
                // Hiển thị dòng "hello" khi chọn "Shop"
                if (dropdownValue == "Shop") Text(""),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Voucher name",
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
                    filled: true,
                    hoverColor: Color.fromARGB(110, 218, 218, 218),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a product number';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _nameController;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Discount ",
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  height: 10.h,
                ),

                DropdownButtonFormField(
                  
                  borderRadius: BorderRadius.circular(10),
                  //dropdownColor: Colors.grey,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  value: discountType,
                  onChanged: ((String? newvalue) {
                    setState(() {
                      discountType = newvalue!;
                    });
                  }),
                  items: const [
                    DropdownMenuItem(
                      child: Text("Percent"),
                      value: "Percent",
                    ),
                    DropdownMenuItem(
                      child: Text("Amount"),
                      value: "Amount",
                    ),
                  ],
                  isExpanded: true,
                ),
                SizedBox(
                  height: 10.h,
                ),
                if (discountType == "Percent")
                
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Percent",
                  style: TextStyle(fontSize: 20),),
                      SizedBox(height: 10.h,),
                      TextFormField(
                        controller: _percentController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 15.0, horizontal: 10.0),
                          filled: true,
                          hoverColor: Color.fromARGB(110, 218, 218, 218),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none),
                        ),
                        // The validator receives the text that the user has entered.
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          if (int.tryParse(value) == null ||
                              int.parse(value) <= 0 ||
                              int.parse(value) >= 100) {
                            return 'Please enter a positive integer for price';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
               
                if (discountType == "Amount")
                
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Amount",
                  style: TextStyle(fontSize: 20),),
                      SizedBox(height: 10.h,),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        controller: _amountController,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 10.0),
                          filled: true,
                          hoverColor: Color.fromARGB(110, 218, 218, 218),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none),
                        ),
                        // The validator receives the text that the user has entered.
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          if (int.tryParse(value) == null ||
                              int.parse(value) <= 0 ||
                              int.parse(value) >= 100) {
                            return 'Please enter a number from 1 to 100';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                // _buidck(name: "Discount Amount", hintname: "Discount Amount", namevalue: "Discount Amount", namctr: TextEditingController()),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                        child: Text(
                      "Released Date",
                      style: TextStyle(fontSize: 20),
                    )),
                    SizedBox(
                      width: 12,
                    ),
                    Expanded(
                        child: Text(
                      "Exp Date",
                      style: TextStyle(fontSize: 20),
                    )),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        
                        
                        onPressed: pickDateRange,
                        child: Text(
                            '${startDate!.toDate().year}/${startDate!.toDate().month}/${startDate!.toDate().day}'),
                      ),
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: pickDateRange,
                        child: Text(
                            '${expDate!.toDate().year}/${expDate!.toDate().month}/${expDate!.toDate().day}'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 40,
        width: 370,
        margin: EdgeInsets.only(left: 16, right: 16, bottom: 25),
        child: ElevatedButton(
          onPressed: () {
            
            _addVoucher(context);
          },
          child: Text(
            'Send',
            style: TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }

  Future pickDateRange() async {
    DateTimeRange? newDataRange = await showDateRangePicker(
      context: context,
      initialDateRange:
          DateTimeRange(start: startDate!.toDate(), end: expDate!.toDate()),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );

    if (newDataRange == null) return;

    setState(() {
      expDate = Timestamp.fromDate(newDataRange.end);
      startDate = Timestamp.fromDate(newDataRange.start);
    });
  }

  void _addVoucher(BuildContext context) {
    String name = _nameController.text;
    String? shopID;
    String? productID;

    if (dropdownValue == "Product") {
      productID = selectedProduct!.id;
    } else {
      shopID = "shopID";
    }
    if (discountType == "Percent") {
      discountPercent = int.parse(_percentController.text);
    } else {
      discountAmount = int.parse(_amountController.text);
    }

    if (name.isNotEmpty) {
      if (discountType == "Percent" && _percentController.text.isNotEmpty) {
        Voucher newVoucher = Voucher(
          name: name,
          discountAmount: discountAmount,
          discountPercent: discountPercent,
          expDate: expDate,
          productID: productID,
          releasedDate: startDate,
          shopID: shopID,
        );
        widget.onVoucherAdded(newVoucher);
      } else if (discountType != "Percent" &&
          _amountController.text.isNotEmpty) {
        Voucher newVoucher = Voucher(
          name: name,
          discountAmount: discountAmount,
          discountPercent: discountPercent,
          expDate: expDate,
          productID: productID,
          releasedDate: startDate,
          shopID: shopID,
        );
        widget.onVoucherAdded(newVoucher);
      }

      // Clear text fields and image path
      _nameController.clear();
      //_priceController.clear();

      Navigator.pop(
        context,
        MaterialPageRoute(
          builder: (context) => VoucherApp(),
        ),
      );
    }
  }
}
