import 'package:flutter/material.dart';

class StoryItemWidget extends StatelessWidget {
  final String name;
  final String image;

  const StoryItemWidget({
    super.key,
    required this.name,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 60,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Stack(
              alignment: AlignmentDirectional.bottomEnd,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(
                    "$image",
                  ),
                ),
                CircleAvatar(
                  radius: 9,
                  backgroundColor: Colors.white,
                ),
                CircleAvatar(
                  radius: 8,
                  backgroundColor: Colors.green,
                ),
              ],
            ),
          ),
          SizedBox(height: 5),
          Text(
            "$name",
            maxLines: 2,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
