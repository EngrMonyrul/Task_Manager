import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class Downloader {
  Downloader._();

  static Future<bool> getStoragePermission() async {
    PermissionStatus storagePermissionStatus = await Permission.storage.status;
    debugPrint("Initial storage permission status: $storagePermissionStatus");
    if (storagePermissionStatus.isGranted) return true;

    if (storagePermissionStatus.isDenied ||
        storagePermissionStatus.isRestricted) {
      storagePermissionStatus = await Permission.storage.request();
      debugPrint(
          "Requested storage permission status: $storagePermissionStatus");
      return storagePermissionStatus.isGranted;
    }

    if (storagePermissionStatus.isPermanentlyDenied) {
      await openAppSettings();
      return storagePermissionStatus.isGranted;
    }

    return false;
  }

  static Future<String> getStoragePath(
      {required bool permissionGranted}) async {
    if (!permissionGranted) {
      permissionGranted = await getStoragePermission();
    }
    debugPrint("Permission granted: $permissionGranted");
    if (permissionGranted) {
      Directory? storageDirectory = await getExternalStorageDirectory();
      debugPrint("Storage directory: ${storageDirectory?.path}");
      if (storageDirectory != null) {
        return storageDirectory.path;
      }
    }
    throw Exception("Storage permission not granted or directory not found");
  }

  static Future<bool> downloadFile({
    required String fileName,
    required String extension,
    required String fileUrl,
  }) async {
    try {
      bool permissionGranted = await getStoragePermission();
      String downloadPath =
          await getStoragePath(permissionGranted: permissionGranted);
      String filePath = "$downloadPath/$fileName$extension";
      File file = File(filePath);

      if (await file.exists()) {
        String timestamp = DateTime.now().millisecondsSinceEpoch.toString();
        filePath = "$downloadPath/${fileName}_$timestamp$extension";
        file = File(filePath);
      }

      final response = await http.get(Uri.parse(fileUrl));
      if (response.statusCode == 200) {
        await file.writeAsBytes(response.bodyBytes);
        return true;
      } else {
        debugPrint("Error -> HTTP status ${response.statusCode}");
        return false;
      }
    } catch (e) {
      debugPrint("Error -> ${e.toString()}");
      return false;
    }
  }
}
