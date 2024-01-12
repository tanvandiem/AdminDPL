import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

class Category {
  String? id;
  String? name;
  String? logo;
  Category({this.id, this.name, this.logo}) {
    id ??= Uuid().v4();
  }
  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(id: json['id'], name: json['name'], logo: json['logo']);
  }
  Map<String, dynamic> toJson() => {'id': id, 'name': name, 'logo': logo};

   Future<void> pickLogo() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      logo = File(pickedFile.path) as String;
    }
  }
}
