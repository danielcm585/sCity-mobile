import 'package:flutter/material.dart';
import 'package:scity_mobile/models/tender/registrant_model.dart';

class RegistrantItem extends StatefulWidget {
  const RegistrantItem({super.key,
    required this.data,
  });

  final Registrant data;

  @override
  State<RegistrantItem> createState() => _RegistrantItemState();
}

class _RegistrantItemState extends State<RegistrantItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10)
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 0.5,
            blurRadius: 5,
            offset: const Offset(1, 1), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            'Judul',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            )
          ),
          SizedBox(height: 4),
          Text(
            'Dekripsi',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          )
        ]
      )
    );
  }
}