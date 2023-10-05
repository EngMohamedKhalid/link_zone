import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../widgets/custom_alert_dialog.dart';

class ImagePickerService {
  static final ImagePicker _picker = ImagePicker();

  static Future<XFile?> getImage({required ImageSource imageSource,}) async {
    if (imageSource == ImageSource.camera) {
      final cameraPer = await Permission.camera.request();
      if (!cameraPer.isGranted) {
        globalAlertDialogue('Can not open, Camera Permission is denied!'.tr());
        return null;
      }
    } else if (imageSource == ImageSource.gallery) {
      if(Platform.isIOS){
        final photosPer = await Permission.photos.request();
        if (!photosPer.isGranted) {
          globalAlertDialogue('${photosPer.name}Can not gallery, gallery Permission is denied!'.tr());
          return null;
        }
      }
    }
    XFile? image;
    try {
      image = await _picker.pickImage(
        source: imageSource,
        maxHeight: 480,
        maxWidth: 360,
        imageQuality: 80,
      );
    } catch (e) {
      globalAlertDialogue(e.toString());
    }
    return image;
  }

}
