import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class Verification extends StatefulWidget {
  const Verification({super.key});

  @override
  State<Verification> createState() => __VerificationState();
}

class __VerificationState extends State<Verification> {
 FilePickerResult? result;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Verification'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Form(
               key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //_buidck(name: "Your name", hintname: "Your name", namevalue: "Your name", namctr: TextEditingController()),
                  SizedBox(height: 20,),
                   _buidck(name: "Shop name", hintname: "Shop name", namevalue: "Shop name", namctr: TextEditingController()),
                  SizedBox(height: 20,),
                   _buidck(name: "License No", hintname: "License No", namevalue: "License No", namctr: TextEditingController()),
                  SizedBox(height: 20,),
                   _buidck(name: "Full Adress", hintname: "Full Adress", namevalue: "Full Adress", namctr: TextEditingController()),
                  SizedBox(height: 20,),
                   _buidck(name: "Phone number", hintname: "Phone number", namevalue: "Phone number", namctr: TextEditingController()),
                  SizedBox(height: 20,),
                   //_buidck(name: "Email", hintname: "Email", namevalue: "Email", namctr: TextEditingController()),
                  Text("Tax paper"),
                  SizedBox(height: 10,),
                  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
                child: GestureDetector(
                  onTap: () async{
                      result = await FilePicker.platform.pickFiles();
                      if (result == null) {
                          print("No file selected");
                        } else {
                        setState(() {
                          print(result?.files.single.name);
                        });
                         
                        }
                  },
                  child:  Row(
                        children: [
                          Container(
                             height: 50.h,
                          width: 261.w,
                            //child: Center(child: Text("Choose file")),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 10,
                                ),
                                result != null 
                                ?Text(result?.files.single.name ?? "", style: const TextStyle(fontSize: 14, ))
                                : Text(
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
                            width: 71.5.w,
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
          if (_formKey.currentState!.validate()) {
            // If the form is valid, perform your action
            // e.g., submit the form or perform some other logic
            // You can access the validated text using _controller.text
          }
        },
            child: Text(
              'Send',
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
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
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
