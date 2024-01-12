import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getwidget/components/list_tile/gf_list_tile.dart';
import 'package:image_picker/image_picker.dart';
import 'package:untitled2/categoryuser/category.dart';
import 'package:uuid/uuid.dart';



class CategoryListScreen extends StatefulWidget {
  @override
  _CategoryListScreenState createState() => _CategoryListScreenState();
}

class _CategoryListScreenState extends State<CategoryListScreen> {
  final List<Category> categories = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Category Management'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add, color: Colors.white),
            onPressed: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddCategoryScreen()),
          );
          if (result != null && result is Category) {
            setState(() {
              categories.add(result);
            });
          }
        }
          )
        ],
      ),
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
        padding:  EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 0),
        child: GestureDetector(
          onTap: () async {
            final updatedCategory = await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => EditCategoryScreen(
                  category: category,
                ),
              ),
            );
            if (updatedCategory != null && updatedCategory is Category) {
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
              borderRadius: BorderRadius.circular(8.r),
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

      // floatingActionButton: FloatingActionButton(
      //   child: Icon(Icons.add),
      //   heroTag: "bt2",
      //   onPressed: () async {
      //     final result = await Navigator.push(
      //       context,
      //       MaterialPageRoute(builder: (context) => AddCategoryScreen()),
      //     );
      //     if (result != null && result is Category) {
      //       setState(() {
      //         categories.add(result);
      //       });
      //     }
      //   },
      // ),
    );
  }
}

class AddCategoryScreen extends StatefulWidget {
  @override
  _AddCategoryScreenState createState() => _AddCategoryScreenState();
}

class _AddCategoryScreenState extends State<AddCategoryScreen> {
  TextEditingController nameController = TextEditingController();
  Category category = Category();

  Future<void> _pickImage() async {
    await category.pickLogo();
    setState(() {}); // Cập nhật giao diện để hiển thị ảnh đã chọn.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Category')),
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
            if (category.logo != null) Image.file(File(category.logo!)),
            SizedBox(height: 32.0.h),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(
                  context,
                  Category(
                    name: nameController.text,
                    logo: category.logo,
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

class EditCategoryScreen extends StatefulWidget {
  final Category category;

  EditCategoryScreen({required this.category});

  @override
  _EditCategoryScreenState createState() => _EditCategoryScreenState();
}

class _EditCategoryScreenState extends State<EditCategoryScreen> {
  TextEditingController nameController = TextEditingController();

  Future<void> _pickImage() async {
    await widget.category.pickLogo();
    setState(() {}); // Cập nhật giao diện để hiển thị ảnh đã chọn.
  }

  @override
  void initState() {
    super.initState();
    nameController.text = widget.category.name ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Edit Category')),
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
            if (widget.category.logo != null)
              Image.file(File(widget.category.logo!)),
            SizedBox(height: 32.0.h),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(
                  context,
                  Category(
                    id: widget.category.id,
                    name: nameController.text,
                    logo: widget.category.logo,
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
