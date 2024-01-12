// add_product_screen.dart

import 'dart:io';


import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:untitled2/product/product.dart';
import 'package:untitled2/product/product_app.dart';

class EditProductScreen extends StatefulWidget {
  final Product product;
  final Function(Product) onProductUpdated;

  EditProductScreen(
      {required this.product,
      required this.onProductUpdated,
      required List products});
List<String>? images=[];
  @override
  _AddProductScreenState createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<EditProductScreen> {
  TextEditingController _availableQuantityController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _priceController = TextEditingController();
  @override
  void initState() {
    super.initState();
    _nameController.text = widget.product.name.toString();
    _priceController.text = widget.product.price.toString();
    _availableQuantityController.text =
        widget.product.availableQuantity.toString();
  }

 List<String>? images=[];
  String? name;
  String? description;
  int? availableQuantity;
  int? price;
  List<String>? types;
  List<String>? colors;
  List<String>? size;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Product'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Product information",
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text("Product name"),
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
                const SizedBox(
                  height: 10,
                ),
                Text("Category"),
                const SizedBox(
                  height: 10,
                ),
                DropdownSearch(
                  items: ["Dress", "Shirt", "Hat", "Glover"],
                  dropdownDecoratorProps: DropDownDecoratorProps(),
                  onChanged: print,
                  selectedItem: "Hat",
                  validator: (String? item) {
                    if (item == null)
                      return "Required field";
                    else if (item == "Brazil")
                      return "Invalid item";
                    else
                      return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),

                Text("Quantity"),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: _availableQuantityController,
                  keyboardType: TextInputType.number,
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
                      return 'Please enter  a price';
                    }

                    // Kiểm tra xem giá trị có phải là số nguyên dương hay không
                    if (int.tryParse(value) == null || int.parse(value) <= 0) {
                      return 'Please enter a positive integer for price';
                    }

                    return null;
                  },
                  onSaved: (value) {
                    // Lưu giá trị chỉ khi nó là một số nguyên dương
                    if (int.tryParse(value!) != null && int.parse(value) > 0) {
                      _availableQuantityController;
                    }
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                Text("Price"),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: _priceController,
                  keyboardType: TextInputType.number,
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
                      return 'Please enter  a price';
                    }

                    // Kiểm tra xem giá trị có phải là số nguyên dương hay không
                    if (int.tryParse(value) == null || int.parse(value) <= 0) {
                      return 'Please enter a positive integer for price';
                    }

                    return null;
                  },
                  onSaved: (value) {
                    // Lưu giá trị chỉ khi nó là một số nguyên dương
                    if (int.tryParse(value!) != null && int.parse(value) > 0) {
                      _priceController;
                    }
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                Text("Type"),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
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
                    // if (value == null || value.isEmpty) {
                    //   return 'Please enter a typer';
                    // }
                    // return null;
                  },
                  onSaved: (value) {
                    types = value as List<String>?;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                Text("Size"),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
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
                      return 'Please enter a size';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    size = value as List<String>?;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                Text("Colors"),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                    filled: true,
                    hoverColor:Color.fromARGB(110, 218, 218, 218),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a colors';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    colors = value as List<String>?;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                Text("Description"),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  maxLines: 4,
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
                      return 'Please enter a description';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    description = value;
                  },
                ),

                const SizedBox(
                  height: 10,
                ),

                const SizedBox(
                  height: 10,
                ),
                Text("Image"),
                const SizedBox(
                  height: 10,
                ),

                GestureDetector(
                 onTap: () async{
          await  _pickImage();
          },
                  child: Row(
                    children: [
                      Container(
                        height: 50.h,
                        width: 260.w,
                        //child: Center(child: Text("Choose file")),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Choose file",
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Color.fromARGB(110, 218, 218, 218),
                            width: 2,
                          ),
                          color: Colors.white10,
                          //color: Color.fromARGB(110, 218, 218, 218),
                          borderRadius: BorderRadius.horizontal(
                            left: Radius.circular(10),
                          ),
                        ),
                      ),
                      Container(
                        height: 50.h,
                        width: 70.w,
                        child: Center(child: Text("Brower")),
                        decoration: BoxDecoration(
                          color: Color.fromARGB(110, 218, 218, 218),
                          borderRadius: BorderRadius.horizontal(
                            right: Radius.circular(10),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                images == null
                    ? Icon(
                        Icons.add_a_photo_outlined,
                        size: 40,
                        color: Colors.black38,
                      )
                    : buildListImage(),


                // Các trường khác tương tự
                SizedBox(height: 16),
                 Text("Video"),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Container(
                        height: 50.h,
                        width: 260.w,
                        //child: Center(child: Text("Choose file")),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Choose file",
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Color.fromARGB(110, 218, 218, 218),
                            width: 2,
                          ),
                          color: Colors.white10,
                          //color: Color.fromARGB(110, 218, 218, 218),
                          borderRadius: BorderRadius.horizontal(
                            left: Radius.circular(10),
                          ),
                        ),
                      ),
                      Container(
                        height: 50.h,
                        width: 70.w,
                        child: Center(child: Text("Brower")),
                        decoration: BoxDecoration(
                          color: Color.fromARGB(110, 218, 218, 218),
                          borderRadius: BorderRadius.horizontal(
                            right: Radius.circular(10),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Icon(Icons.video_library_outlined,
                  size: 40,
                color: Colors.black38
                  
                  ),
                  const SizedBox(height: 10,),
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
            _updateProduct();
          },
          child: Text(
            'Update Product',
            style: TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }
Widget buildListImage(){
    return SingleChildScrollView(
      child: Container(
          height: MediaQuery.of(context).size.height*0.15,
            // width: double.infinity,
          // padding: EdgeInsets.only(left: 10.w,top: 5.h,bottom: 5.h),
          child:  ListView.separated(itemBuilder: (context, index) {
          
            return Image.file(
                    File(images![index]),
                    height: 80.h,
                    width: 120.h,
                  );
          },itemCount: images!.length,
          separatorBuilder: (context, index) => SizedBox(width: 10.w,),
          physics: BouncingScrollPhysics(),
          // shrinkWrap: true,
           scrollDirection: Axis.horizontal,
          ),
          
        
      ),
    );
  }

  Future<void> _pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        images!.add(image.path);
        // _imagePath = shopLogo.path;
      });
    }
  }

  void _updateProduct() {
    String name = _nameController.text;
    String priceString = _priceController.text;
    String quantityString = _availableQuantityController.text;

    if (name.isNotEmpty &&
        priceString.isNotEmpty &&
        quantityString.isNotEmpty) {
      int price = int.tryParse(priceString) ?? 0;
      int quantity = int.tryParse(quantityString) ?? 0;

      if (price > 0 && quantity >= 0) {
        Product updatedProduct = Product(
          id: widget.product.id,
          name: name,
          price: price,
          images: widget.product.images!,
          availableQuantity: quantity,
        );

        widget.onProductUpdated(updatedProduct);

        Navigator.pop(
          context,
          MaterialPageRoute(
              builder: (context) => ProductsApp(
                    
                  )),
        );
        // Close the EditProductScreen after updating
      }
    }
  }
}
