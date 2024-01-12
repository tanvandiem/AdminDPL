import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getwidget/components/list_tile/gf_list_tile.dart';
import 'package:image_picker/image_picker.dart';
import 'package:untitled2/models/deliver_service.dart';
import 'package:uuid/uuid.dart';

class DeliverListScreen extends StatefulWidget {
  @override
  _DeliverListScreenState createState() => _DeliverListScreenState();
}

class _DeliverListScreenState extends State<DeliverListScreen> {
  final List<DeliverService> categories = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Deliver Management')),
      body: ListView.builder(
  itemCount: categories.length,
  itemBuilder: (context, index) {
    final category = categories[index];
    
    return Dismissible(
      key: Key(category.id.toString()), // Assuming category has an 'id' property
      onDismissed: (direction) {
        setState(() {
          categories.removeAt(index);
        });
      },
      child: Padding(
        padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 0),
        child: GestureDetector(
          onTap: () async {
            final updatedCategory = await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => EditDeliverScreen(
                  deliver: category,
                ),
              ),
            );
            if (updatedCategory != null && updatedCategory is DeliverService) {
              setState(() {
                categories[index] = updatedCategory;
              });
            }
          },
          child: Container(
            height: 100.h,
            width: 343.w,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Material(
              borderRadius: BorderRadius.circular(8),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    height: 100.h,
                    width: 176.w,
                    color: Colors.blue,
                    child: Center(
                      child: Text(
                        category.name ?? '',
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFFF6F6F6),
                        ),
                      ),
                    ),
                  ),
                  Image.file(
                    File(category.logo!), // Assuming logo is a file path
                    height: 100.h,
                    width: 150.w,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  },
),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddDeliverScreen()),
          );
          if (result != null && result is DeliverService) {
            setState(() {
              categories.add(result);
            });
          }
        },
      ),
    );
  }
}

class AddDeliverScreen extends StatefulWidget {
  @override
  _AddDeliverScreenState createState() => _AddDeliverScreenState();
}

class _AddDeliverScreenState extends State<AddDeliverScreen> {
  TextEditingController nameController = TextEditingController();
  DeliverService deliver = DeliverService();

  Future<void> _pickImage() async {
    await deliver.pickLogo();
    setState(() {}); // Cập nhật giao diện để hiển thị ảnh đã chọn.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Deliver')),
      body: Padding(
        padding: EdgeInsets.all(16.0.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            SizedBox(height: 16.0.h),
            ElevatedButton(
              onPressed: _pickImage,
              child: Text('Pick Logo'),
            ),
            if (deliver.logo != null) Image.file(File(deliver.logo!)),
            SizedBox(height: 32.0.h),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(
                  context,
                  DeliverService(
                    name: nameController.text,
                    logo: deliver.logo,
                  ),
                );
              },
              child: Text('Add'),
            ),
          ],
        ),
      ),
    );
  }
}

class EditDeliverScreen extends StatefulWidget {
  final DeliverService deliver;

  EditDeliverScreen({required this.deliver});

  @override
  _EditDeliverScreenState createState() => _EditDeliverScreenState();
}

class _EditDeliverScreenState extends State<EditDeliverScreen> {
  TextEditingController nameController = TextEditingController();

  Future<void> _pickImage() async {
    await widget.deliver.pickLogo();
    setState(() {}); // Cập nhật giao diện để hiển thị ảnh đã chọn.
  }

  @override
  void initState() {
    super.initState();
    nameController.text = widget.deliver.name ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Edit Deliver')),
      body: Padding(
        padding: EdgeInsets.all(16.0.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            SizedBox(height: 16.0.h),
            ElevatedButton(
              onPressed: _pickImage,
              child: Text('Pick Another Logo'),
            ),
            if (widget.deliver.logo != null)
              Image.file(File(widget.deliver.logo!)),
            SizedBox(height: 32.0.h),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(
                  context,
                  DeliverService(
                    id: widget.deliver.id,
                    name: nameController.text,
                    logo: widget.deliver.logo,
                  ),
                );
              },
              child: Text('Update'),
            ),
          ],
        ),
      ),
    );
  }
}
