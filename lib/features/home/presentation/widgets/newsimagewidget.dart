import 'package:flutter/material.dart';
import 'package:news/features/home/presentation/widgets/newsImageplaceholder.dart';

class NewsImageWidget extends StatelessWidget {
  final String? imageUrl;
  
  const NewsImageWidget({super.key, this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
        color: Colors.grey[200],
      ),
      child: imageUrl != null
          ? ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
              child: Image.network(
                imageUrl!,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return const NewsImagePlaceholder();
                },
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return const NewsImagePlaceholder();
                },
              ),
            )
          : const NewsImagePlaceholder(),
    );
  }
}
