import 'package:flutter_bloc/flutter_bloc.dart';

class ImagePreview extends Cubit<String> {
  ImagePreview() : super('');

  void displayImage(String imageUrl) => emit(imageUrl);
}
