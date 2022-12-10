import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scity_mobile/models/tender/registrant_model.dart';
import 'package:scity_mobile/providers/cookie_request_provider.dart';
import 'package:scity_mobile/utils/general/parse_idr.dart';
import 'package:scity_mobile/utils/tender/choose_registrant.dart';

class RegistrantItem extends StatefulWidget {
  const RegistrantItem({super.key,
    required this.data,
    required this.refresh,
  });

  final Registrant data;
  final VoidCallback refresh;

  @override
  State<RegistrantItem> createState() => _RegistrantItemState();
}

class _RegistrantItemState extends State<RegistrantItem> {
  void refresh() {
    widget.refresh();
    setState(() { });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        left: 10,
        top: 10,
        bottom: 10,
      ),
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    (
                      widget.data.company != null ? 
                        widget.data.company!.companyName : 
                        widget.data.project!.title
                    ),
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    )
                  ),
                  const SizedBox(width: 4),
                  (
                    widget.data.isChosen ? 
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                        decoration: const BoxDecoration(
                          color: Color.fromRGBO(0x10,0xb9,0x81,1),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(4),
                            topRight: Radius.circular(4),
                            bottomLeft: Radius.circular(4),
                            bottomRight: Radius.circular(4)
                          ),
                        ),
                        child: const Text(
                          'CHOSEN',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          )
                        )
                      ) : 
                      Container()
                  )
                ],
              ),
              const SizedBox(height: 4),
              Text(
                parseIdr(widget.data.offerPrice),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              )
            ]
          ),
          ElevatedButton(
            onPressed: () {
              final request = context.read<CookieRequest>();
              chooseRegistrant(request, refresh, widget.data.id);
            }, 
            style: ElevatedButton.styleFrom(
              shape: const CircleBorder()
            ),
            // color: Colors.white,
            // backgroundColor: const Color.fromRGBO(0x10,0xb9,0x81,1),
            child: const Icon(
              Icons.check,
              color: Colors.white,
            ),
          )
        ],
      )
    );
  }
}