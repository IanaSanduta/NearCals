import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';
import 'dart:io';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  File? fileImg;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                Stack(
                  children: [
                    buildImage(context),
                  ],
                ),
                const SizedBox(
                  height: 24,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  //Widget to create CircleAvatar
  Widget buildImage(BuildContext context) {
    //Variables
    FileImage? image;

    // Null-Safety
    if (fileImg != null) {
      image = FileImage(File(fileImg!.path));
    }

    return ClipOval(
      child: Material(
        color: const Color.fromARGB(129, 180, 189, 185,
        ),
        child: Ink.image(
          image: (fileImg != null)
              ? image as ImageProvider
              : const AssetImage('resources/default_user.png'),
          fit: BoxFit.cover,
          width: 200,
          height: 200,
          child: InkWell(
              onTap: () async => showImageSource(context),
              splashColor: const Color.fromARGB(196, 4, 59, 229,),
              highlightColor: const Color.fromARGB(129, 180, 189, 185,
              )),
        ),
      ),
    );
  }

  //Show options to change photo
  Future<ImageSource?> showImageSource(BuildContext context) async {
    if (Platform.isIOS) {
      return showCupertinoModalPopup<ImageSource>(
          context: context,
          builder: (context) => CupertinoActionSheet(
                actions: [
                  CupertinoActionSheetAction(
                      child: const Text('Camera'),
                      onPressed: () {
                        pickImage(ImageSource.camera);
                        Navigator.pop(context);
                      }),
                  CupertinoActionSheetAction(
                      child: const Text('Gallery'),
                      onPressed: () {
                        pickImage(ImageSource.gallery);
                        Navigator.pop(context);
                      }),
                ],
              ));
    } else {
      return showModalBottomSheet(
          context: context,
          builder: (context) => Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: double.infinity,
                    color: Colors.blue.shade900,
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
                    child: const Text('Profile Photo',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold,
                            color: Colors.white),
                        textAlign:TextAlign.center),
                  ),
                  ListTile(
                    iconColor: Colors.blue.shade900,
                    leading: const Icon(Icons.camera_alt),
                    title: const Text('Camera'),
                    onTap: () {
                      pickImage(ImageSource.camera);
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                      iconColor: Colors.blue.shade900,
                      leading: const Icon(Icons.image),
                      title: const Text('Gallery'),
                      onTap: () {
                        pickImage(ImageSource.gallery);
                        Navigator.pop(context);
                      }),
                ],
              ));
    }
  }

  //Function to take photo or retrieve photo from gallery
  Future pickImage(ImageSource source) async {
    try {
      //Get a photo depend on gallery or camera
      final pickFile = await ImagePicker().pickImage(source: source);

      //End function if an image is not selected
      if (pickFile == null) return;

      //Edit and Update photo
      editImage(pickFile.path);

    } on PlatformException catch (e) {
        print(e.message);
    }
  }

  //Function to edit a photo
  Future editImage(String imagePath) async {
    // Set crop settings
    final editImg = await ImageCropper().cropImage(
        sourcePath: imagePath,
        cropStyle: CropStyle.circle,
        aspectRatioPresets: Platform.isAndroid
            ? [
          CropAspectRatioPreset.square,
          CropAspectRatioPreset.ratio3x2,
          CropAspectRatioPreset.original,
          CropAspectRatioPreset.ratio4x3,
          CropAspectRatioPreset.ratio16x9
        ]
            : [
          CropAspectRatioPreset.original,
          CropAspectRatioPreset.square,
          CropAspectRatioPreset.ratio3x2,
          CropAspectRatioPreset.ratio4x3,
          CropAspectRatioPreset.ratio5x3,
          CropAspectRatioPreset.ratio5x4,
          CropAspectRatioPreset.ratio7x5,
          CropAspectRatioPreset.ratio16x9
        ],
        androidUiSettings: AndroidUiSettings(
          toolbarColor: Colors.blue.shade900,
          toolbarWidgetColor: Colors.white,
          initAspectRatio: CropAspectRatioPreset.square,
          lockAspectRatio: false,
        ),
        iosUiSettings: const IOSUiSettings(
          rotateButtonsHidden: false,
          rotateClockwiseButtonHidden: false,
          aspectRatioLockEnabled: false,
          minimumAspectRatio: 1.0,
        ));

    //Update photo into UI
    if (editImg != null) {
        setState(() => fileImg = editImg);
      }
  }
}