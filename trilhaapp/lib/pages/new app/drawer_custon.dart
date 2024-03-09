import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:path_provider/path_provider.dart' as path_providre;
import 'camera/camera_page.dart';
import 'connectivity_plus/connectivity_plus_page.dart';
import 'gps/gps.page.dart';
import 'qr_code/qr_code_page.dart';

class DrawerCustonV2 extends StatelessWidget {
  const DrawerCustonV2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 250,
        color: Colors.white,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          InkWell(
            onTap: () {
              showBottomSheet(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  context: context,
                  builder: (context) {
                    return Wrap(
                      children: [
                        ListTile(
                          leading: const Icon(Icons.camera_alt),
                          title: const Text('Camera'),
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                        ListTile(
                          leading: const Icon(Icons.photo),
                          title: const Text('Galeria'),
                          onTap: () {
                            Navigator.pop(context);
                          },
                        )
                      ],
                    );
                  });
            },
            child: const UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Colors.blueAccent),
                currentAccountPicture: CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage('img/marcelo_alve.jpg'),
                ),
                accountName: Text('Marcelo Alve'),
                accountEmail: Text('Marcelo@gmail.com')),
          ),
          const SizedBox(height: 5),
          const Divider(
            color: Colors.black,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: InkWell(
              onTap: () async {
                Navigator.pop(context);
                var url = Uri.parse('https://dio.me');
                await launchUrl(url);
              },
              child: const Row(
                children: [
                  FaIcon(
                    FontAwesomeIcons.internetExplorer,
                    color: Colors.blue,
                    size: 22,
                  ),
                  SizedBox(width: 5),
                  Text('Abrir dio',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
                ],
              ),
            ),
          ),
          const Divider(
            color: Colors.black,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
                Share.share('Olhem esse site ! https://dio.me');
                //Share.share('check out my website https://example.com', subject: 'Look what I made!');
              },
              child: const Row(
                children: [
                  FaIcon(
                    FontAwesomeIcons.shareNodes,
                    color: Colors.blue,
                    size: 22,
                  ),
                  SizedBox(width: 5),
                  Text('Comaprtilhar',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
                ],
              ),
            ),
          ),
          const Divider(
            color: Colors.black,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: InkWell(
              onTap: () async {
                //Navigator.pop(context);
                var ditectory =
                    await path_providre.getApplicationSupportDirectory();
                debugPrint(ditectory.path);
              },
              child: const Row(
                children: [
                  FaIcon(
                    FontAwesomeIcons.database,
                    color: Colors.blue,
                    size: 22,
                  ),
                  SizedBox(width: 5),
                  Text('Path',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
                ],
              ),
            ),
          ),
          const Divider(
            color: Colors.black,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: InkWell(
              onTap: () async {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const GpsPage()));
              },
              child: const Row(
                children: [
                  FaIcon(
                    FontAwesomeIcons.map,
                    color: Colors.blue,
                    size: 22,
                  ),
                  SizedBox(width: 5),
                  Text('GPS',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
                ],
              ),
            ),
          ),
          const Divider(color: Colors.black),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: InkWell(
              onTap: () async {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CameraPage()));
              },
              child: const Row(
                children: [
                  FaIcon(
                    FontAwesomeIcons.camera,
                    color: Colors.blue,
                    size: 22,
                  ),
                  SizedBox(width: 5),
                  Text('Camera',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
                ],
              ),
            ),
          ),
          const Divider(color: Colors.black),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: InkWell(
              onTap: () async {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const QrCodePage()));
              },
              child: const Row(
                children: [
                  FaIcon(
                    FontAwesomeIcons.qrcode,
                    color: Colors.blue,
                    size: 22,
                  ),
                  SizedBox(width: 5),
                  Text('QR CODE',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
                ],
              ),
            ),
          ),
          const Divider(color: Colors.black),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: InkWell(
              onTap: () async {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ConnectivityPlusPage()));
              },
              child: const Row(
                children: [
                  FaIcon(
                    FontAwesomeIcons.wifi,
                    color: Colors.blue,
                    size: 22,
                  ),
                  SizedBox(width: 5),
                  Text('Connectivity Plus',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
                ],
              ),
            ),
          ),
          const Divider(
            color: Colors.black,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: InkWell(
              onTap: () async {
                //Navigator.pop(context);
                PackageInfo packageInfo = await PackageInfo.fromPlatform();

                String appName = packageInfo.appName;
                String packageName = packageInfo.packageName;
                String version = packageInfo.version;
                String buildNumber = packageInfo.buildNumber;
                debugPrint(appName);
                debugPrint(packageName);
                debugPrint(version);
                debugPrint(buildNumber);

                debugPrint(Platform.isIOS.toString());
                debugPrint(Platform.operatingSystem.toString());
                DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
                IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
                debugPrint('Running on ${iosInfo.utsname.machine}');
              },
              child: const Row(
                children: [
                  FaIcon(
                    FontAwesomeIcons.appStore,
                    color: Colors.blue,
                    size: 22,
                  ),
                  SizedBox(width: 5),
                  Text('Informacoes pacote',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
                ],
              ),
            ),
          ),
          const Divider(
            color: Colors.black,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: InkWell(
              onTap: () async {
                //Navigator.pop(context);
                DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
                final info = await deviceInfo.deviceInfo;
                debugPrint('${info.data}');

                if (Platform.isIOS) {
                  IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
                  debugPrint('Running on ${iosInfo.utsname.machine}');
                } else if (Platform.isAndroid) {
                  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
                  AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
                  debugPrint('Running on ${androidInfo.model}');
                } else {
                  WebBrowserInfo webBrowserInfo =
                      await deviceInfo.webBrowserInfo;
                  debugPrint('Running on ${webBrowserInfo.userAgent}');
                }
              },
              child: const Row(
                children: [
                  FaIcon(
                    FontAwesomeIcons.robot,
                    color: Colors.blue,
                    size: 22,
                  ),
                  SizedBox(width: 5),
                  Text('Infor Dispositivo',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
                ],
              ),
            ),
          ),
          const Divider(
            color: Colors.black,
          ),
        ]));
  }
}
