import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled2/product/product.dart';
import 'package:untitled2/product/product_repo.dart';
import 'package:untitled2/voucher/voucher.dart';
import 'package:untitled2/voucher/voucher.dart';
import 'package:untitled2/voucher/voucher_app.dart';

class EditVoucher extends StatefulWidget {
  final Voucher voucher;
  final Function(Voucher) onVoucherUpdated;

  EditVoucher(
      {required this.voucher,
      required this.onVoucherUpdated,
      required List vouchers});

  @override
  _AddProductScreenState createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<EditVoucher> {
  //TextEditingController _availableQuantityController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  //TextEditingController _priceController = TextEditingController();
  @override
  void initState() {
    super.initState();
    _nameController.text = widget.voucher.name.toString();
    startDate=widget.voucher.releasedDate;
    expDate=widget.voucher.expDate;
    discountAmount=widget.voucher.discountAmount;
    if(widget.voucher.productID!=null){
      dropdownValue== "Product";
    }else{
      dropdownValue== "Shop";
    }

  }
   String? dropdownValue ;
  String discountType = "Percent";
  int? discountAmount;
  int? discountPercent;
  Timestamp? startDate;
  Timestamp? expDate;
// DateTimeRange dataRange = DateTimeRange(
//     start: DateTime.now(),
//     end: DateTime.now().add(const Duration(days: 30)),
//   );
 
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  // String? dropdownValue = "Product";
  // String dropdownValue1 = "Percent";
  bool isDefaultAddress = false;

  Product? selectedProduct;
  List<Product>? list = ProductRepo().list;

  
  @override
  Widget build(BuildContext context) {
    //final start = dataRange.start;
    //final end = dataRange.end;
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Voucher'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                
                Text("Voucher name"),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
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
                Text("Voucher"),
                DropdownButton(
                  value: dropdownValue,
                  onChanged: ((String? newvalue) {
                    setState(() {
                      dropdownValue = newvalue!;
                    });
                  }),
                  items: const [
                    DropdownMenuItem(
                      child: Text("Product"),
                      value: "Product",
                    ),
                    DropdownMenuItem(
                      child: Text("Shop"),
                      value: "Shop",
                    ),
                  ],
                  isExpanded: true,
                ),
                if (dropdownValue == "Product")
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const Text('Select Category:'),
                      DropdownButton<Product>(
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
                if (dropdownValue == "Shop") Text("hello"),

                DropdownButton(
                 // value: dropdownValue1,
                  onChanged: ((String? newvalue) {
                    setState(() {
                      //dropdownValue1 = newvalue!;
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
                //if (dropdownValue1 == "Percent")
                  TextFormField(
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
                //if (dropdownValue1 == "Amount")
                  TextFormField(
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
                // _buidck(name: "Discount Amount", hintname: "Discount Amount", namevalue: "Discount Amount", namctr: TextEditingController()),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(child: Text("Released Date")),
                    SizedBox(
                      width: 12,
                    ),
                    Expanded(child: Text("Exp Date")),
                  ],
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: pickDateRange,
                        child:Text(""),
                            //Text('${start.year}/${start.month}/${start.day}'),
                      ),
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: pickDateRange,
                        child: Text(""),
                        //Text('${end.year}/${end.month}/${end.day}'),
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
        margin: EdgeInsets.only(left: 16.w, right: 16.w, bottom: 25.h),
        child: ElevatedButton(
          onPressed: () {
            _updateVoucher();
          },
          child: Text(
            'Update Voucher',
            style: TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }
   void _updateVoucher() {
    String name = _nameController.text;
    String expDate1 = expDate.toString();
    String releasedDate = startDate.toString();
    

    if (name.isNotEmpty ) {
    

      
        Voucher updatedVoucher = Voucher(
          id: widget.voucher.id,
          name: name,
          expDate: expDate,
          releasedDate: startDate,
          
        );

        widget.onVoucherUpdated(updatedVoucher);

        Navigator.pop(
          context,
          MaterialPageRoute(
              builder: (context) => VoucherApp(
                    
                  )),
        );
        // Close the EditProductScreen after updating
      
    }
  }
  Future pickDateRange() async {
    DateTimeRange? newDataRange = await showDateRangePicker(
      context: context,
      //initialDateRange: dataRange,
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );

    if (newDataRange == null) return;

    //setState(() => dataRange = newDataRange);
  }
}
