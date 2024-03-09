import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:path_provider/path_provider.dart' as path_providre;
import 'package:image_picker/image_picker.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({super.key});

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Camera'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                final ImagePicker picker = ImagePicker();
                showModalBottomSheet(
                  context: context,
                  builder: (_) {
                    return Wrap(
                      children: [
                        GestureDetector(
                          onTap: () async {
                            final XFile? photo = await picker.pickImage(
                                source: ImageSource.camera);
                            if (photo != null) {
                              String path = (await path_providre
                                      .getApplicationDocumentsDirectory())
                                  .path;
                              String nome = basename(photo.path);
                              await photo.saveTo('$path/$nome');
                            }
                          },
                          child: const ListTile(
                            leading: FaIcon(FontAwesomeIcons.camera),
                            title: Text('Camera'),
                          ),
                        ),
                        GestureDetector(
                          onTap: () async {
                            final XFile? image = await picker.pickImage(
                                source: ImageSource.gallery);
                            if (image != null) {
                              String path = (await path_providre
                                      .getApplicationDocumentsDirectory())
                                  .path;
                              debugPrint(path);
                              String nome = basename(image.path);
                              debugPrint(nome);
                              await image.saveTo("$path/$nome");
                            }
                          },
                          child: const ListTile(
                            leading: FaIcon(FontAwesomeIcons.images),
                            title: Text('Gallery'),
                          ),
                        ),
                      ],
                    );
                  },
                );
                //final ImagePicker picker = ImagePicker();
                //final XFile? image =
                //  await picker.pickImage(source: ImageSource.camera);
              },
              child: const Text('Camera'),
            )
          ],
        ),
      ),
    );
  }
}
