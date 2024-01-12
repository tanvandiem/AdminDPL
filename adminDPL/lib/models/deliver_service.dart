import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

class DeliverService {
  String? id;
  String? name;
  String? logo;
  DeliverService({this.id, this.logo, this.name}) {
    id ??= Uuid().v4();
  }
  factory DeliverService.fromJson(Map<String, dynamic> json) {
    return DeliverService(
      id: json['id'],
      name: json['name'],
      logo: json['logo'],
    );
  }
  Map<String, dynamic> toJson() => {
        'logo': logo,
        'id': id,
        'name': name,
      };
       Future<void> pickLogo() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      logo = pickedFile.path; // Lưu đường dẫn tới ảnh
    }
  }
}
