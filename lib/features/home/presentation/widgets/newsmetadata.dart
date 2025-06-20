import 'package:flutter/material.dart';

class NewsMetaData extends StatelessWidget {
  final String author;
  final DateTime publishedAt;

  const NewsMetaData({
    super.key,
    required this.author,
    required this.publishedAt,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            'By $author',
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey[600],
              fontWeight: FontWeight.w500,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),

        const SizedBox(width: 8),

        Text(
          _getTimeAgo(publishedAt),
          style: TextStyle(fontSize: 12, color: Colors.grey[500]),
        ),

        const SizedBox(width: 8),

        Icon(Icons.more_horiz, color: Colors.grey[400], size: 16),
      ],
    );
  }

  String _getTimeAgo(DateTime dateTime) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);

    if (difference.inDays > 0) {
      return '${difference.inDays}d ago';
    } else if (difference.inHours > 0) {
      return '${difference.inHours}h ago';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes}m ago';
    } else {
      return 'Just now';
    }
  }
}
