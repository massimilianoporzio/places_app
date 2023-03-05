import 'package:flutter/material.dart';

import '../../domain/entities/place_entity.dart';

class TitleSection extends StatelessWidget {
  final Place place;
  const TitleSection({
    Key? key,
    required this.place,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Row(
        children: [
          Expanded(
            //prende tutto il resto dello spazio lasciato
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    place.title,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Text(
                  place.subtitle,
                  style: TextStyle(color: Colors.grey.shade500),
                ),
              ],
            ),
          ),
          Icon(
            Icons.star,
            color: Colors.red[500],
          ),
          const Padding(
            padding: EdgeInsets.only(left: 4),
            child: Text('41'),
          )
        ],
      ),
    );
  }
}
