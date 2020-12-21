import 'package:flutter/material.dart';

class ImageViewer extends StatelessWidget {
  final String image;

  const ImageViewer({Key key, this.image}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      height: 200,
      width: 200,
      child: Image.network(
        image,
        fit: BoxFit.fitHeight,
        loadingBuilder: (BuildContext context, Widget child,
            ImageChunkEvent loadingProgress) {
          if (loadingProgress == null) return child;
          return Center(
              child: CircularProgressIndicator(
            value: loadingProgress.expectedTotalBytes != null
                ? loadingProgress.cumulativeBytesLoaded /
                    loadingProgress.expectedTotalBytes
                : null,
          ));
        },
      ),
      decoration: BoxDecoration(
          color: Colors.white,
          // image: DecorationImage(image: NetworkImage(), fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(25)),
    );
  }
}
