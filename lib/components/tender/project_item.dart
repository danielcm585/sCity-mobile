import 'package:flutter/material.dart';
import 'package:scity_mobile/models/tender/project_model.dart';
import 'package:scity_mobile/pages/tender/project_detail_page.dart';

class ProjectItem extends StatefulWidget {
  const ProjectItem({super.key,
    required this.data,
    required this.refresh,
  });

  final Project data;
  final VoidCallback refresh;

  @override
  State<ProjectItem> createState() => _ProjectItemState();
}

class _ProjectItemState extends State<ProjectItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context, 
          MaterialPageRoute(builder: (context) => ProjectDetailPage(data: widget.data, refresh: widget.refresh)),
        );
      },
      child: Container(
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
          children: [
            Text(
              widget.data.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              )
            ),
            const SizedBox(height: 8),
            Text(
              widget.data.description,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            )
          ]
        )
      )
    );
  }
}