import 'package:flutter/material.dart';

import '../api_service.dart';

class StarBucksList extends StatelessWidget {
  const StarBucksList(
      {Key? key,
      required this.apiservice,
      required this.description,
      required this.imgSrc,
      required this.title})
      : super(key: key);

  final ApiService apiservice;
  final String imgSrc;
  final String description;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(200),
          child: Image.network(
            imgSrc,
            width: 32,
            loadingBuilder: (BuildContext context, Widget child,
                ImageChunkEvent? loadingProgress) {
              if (loadingProgress == null) {
                return child;
              }
              return Center(
                child: CircularProgressIndicator(
                  value: loadingProgress.expectedTotalBytes != null
                      ? loadingProgress.cumulativeBytesLoaded /
                          loadingProgress.expectedTotalBytes!
                      : null,
                ),
              );
            },
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
            ),
            Text(
              description,
              style: const TextStyle(color: Colors.grey),
            ),
          ],
        )
      ],
    );
  }
}
