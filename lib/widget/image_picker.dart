import 'dart:io';
import 'package:diary/common.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class ImagePickerWidget extends StatefulWidget {
  const ImagePickerWidget({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ImagePickerState();
  }
}

class _ImagePickerState extends State<ImagePickerWidget> {
  XFile? _imgPath;
  ImagePicker imagePicker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: .6.sh,
      child: Scaffold(
          appBar: AppBar(
            title: const Text("ImagePicker"),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                 _ImageView(_imgPath),
                GestureDetector(
                  onTap: _takePhoto,
                  child: Text("拍照"),
                ),
                GestureDetector(
                  onTap: _openGallery,
                  child: Text("选择照片"),
                ),
              ],
            ),
          )),
    );
  }

  /*图片控件*/
  Widget _ImageView(imgPath) {

    if (imgPath == null) {
      return const Center(
        child: Text("请选择图片或拍照"),
      );
    } else {
      File? path = File(imgPath.path);
      return Image.file(path);
     }
  }

  /*拍照*/
  _takePhoto() async {
    PermissionUtil.checkPermissionStatus(Permission.camera);
    XFile? image = await imagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      _imgPath = image;
    });
  }

  /*相册*/
  _openGallery() async {
    PermissionUtil.checkPermissionStatus(Permission.photos);
    XFile? image = await imagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _imgPath = image;
    });
  }
}
