import 'package:mime/mime.dart';

class CustomMap {
  var mimeResolver = MimeTypeResolver();
  CustomMap() {
    mimeResolver.addMagicNumber([0x1A, 0x45, 0xDF, 0xA3], 'video/x-matroska');
    mimeResolver.addExtension('mkv', 'video/x-matroska');
  }
}
