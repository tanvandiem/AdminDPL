import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';



class GeneralSetting extends StatefulWidget {
  const GeneralSetting({super.key});

  @override
  State<GeneralSetting> createState() => __GeneralSettingState();
}

class __GeneralSettingState extends State<GeneralSetting> {
  TextEditingController _nameController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
 
   File? _image;

  Future getImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('General Setting'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 _buidck(name: "Shop name", hintname: "Shop name", namevalue: "Shop name", namctr: TextEditingController()),
                  SizedBox(height: 20,),
                    Text(" Shop Image"),
                     SizedBox(
                      height: 10.h,
                    ),
                     
                    GestureDetector(
                       onTap: () {
              getImage();
                      },
                      child: Row(
                        children: [
                          Container(
                            height: 50,
                            width: 302,
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
                            height: 50,
                            width: 75,
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
                    _image == null
              ? Icon(
                  Icons.add_a_photo_outlined,
                  size: 80,
                  color: Colors.black38,
                )
              : Image.file(
                  _image!,
                  height: 80,
                ),
                    const SizedBox(height: 10,),
                     
                   
                   _buidck(name: "Shop Adress", hintname: "Full Adress", namevalue: "Full Adress", namctr: TextEditingController()),
                  SizedBox(height: 20,),
                   _buidck(name: "Shop number", hintname: "Phone number", namevalue: "Phone number", namctr: TextEditingController()),
                  SizedBox(height: 20,),
                   _buidck(name: "Shop description", hintname: "description", namevalue: "description", namctr: TextEditingController()),
                  SizedBox(height: 20,),

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
            // onPressed: () {
            //   if (_formKey.currentState?.validate() ?? false) {
            //     _formKey.currentState?.save();
            //     Product newProduct = Product(name: name, price: price,availableQuantity: availableQuantity,);
            //       widget.onProductAdded(newProduct);

            //       // Clear text fields
            //       _nameController.clear();
            //       _priceController.clear();
            //       _quantityController.clear();
            //   }
            // },
            //  onPressed: () {
            //     // String name = _nameController.text;
            //     // //double price = double.tryParse(_priceController.text) ?? 0.0;
            //   // _addProduct(context);
            //     // if (name.isNotEmpty) {
            //     //   Product newProduct = Product(name: name,);
            //     //   widget.onProductAdded(newProduct);

            //     //   // Clear text fields
            //     //   _nameController.clear();
            //     //   _priceController.clear();
            //     // }
            //   },
             onPressed: () {
          if (_formKey.currentState!.validate()) {
            // If the form is valid, perform your action
            // e.g., submit the form or perform some other logic
            // You can access the validated text using _controller.text
          }
        },
            child: Text(
              'Save',
              style: TextStyle(fontSize: 18),
            ),
          ),
        ),
        
        );
  }
   Widget _buidck({
    required String name,
    required String hintname,
    required String namevalue,
    required TextEditingController namctr,

  }) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: namctr,
                  
                  decoration: InputDecoration(
                    hintText: hintname,
                    hintStyle: TextStyle(color: Colors.grey),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
                    filled: true,
                    hoverColor: Color(0XFFDADADA),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter " + namevalue;
                    }
                    return null;
                  },
                  onSaved: (value) {
                    namctr;
                  },
                ),
                
              ],
            );
  
}



