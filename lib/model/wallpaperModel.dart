// ignore_for_file: public_member_api_docs, sort_constructors_first
class WallpaperModel {
  String photographer;
  String photographer_url;
  int photographer_id;
  SrcModel src;

  WallpaperModel({
    required this.photographer,
    required this.photographer_url,
    required this.photographer_id,
    required this.src,
  });
}

class SrcModel {
  String original;
  String small;
  String portrait;

  SrcModel({
    required this.original,
    required this.small,
    required this.portrait,
  });
}
