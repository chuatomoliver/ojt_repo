import 'package:permission_handler/permission_handler.dart';

const List<String> permissionName = [
  'Camera',
  'Contacts',
  'File Manager',
  'Location'
];

const List<Permission> permissions = [
  Permission.camera,
  Permission.contacts,
  Permission.manageExternalStorage,
  Permission.location
];
