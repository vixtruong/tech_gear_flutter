import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:techgear/models/product.dart';

class ProductAdminCard extends StatefulWidget {
  final Product product;

  const ProductAdminCard({super.key, required this.product});

  @override
  State<ProductAdminCard> createState() => _ProductAdminCardState();
}

class _ProductAdminCardState extends State<ProductAdminCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: GestureDetector(
        onTap: () {
          context.push(
              '/product-detail?productId=${widget.product.id}&isAdmin=true');
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.network(
              widget.product.imgUrl,
              height: 100,
              width: 100,
            ),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    widget.product.name,
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  Text(
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    widget.product.description,
                  ),
                  Text("${widget.product.price}"),
                ],
              ),
            ),
            PopupMenuButton<String>(
              color: Colors.white,
              onSelected: (value) {
                // Xử lý khi chọn một mục
              },
              itemBuilder: (context) => [
                PopupMenuItem(
                  value: 'edit',
                  child: Text('Edit'),
                ),
                PopupMenuItem(
                  value: 'delete',
                  child: Text('Delete'),
                ),
                PopupMenuItem(
                  onTap: () {
                    context
                        .push('/manage-product-variants/${widget.product.id}');
                  },
                  value: 'variants',
                  child: Text('Manage variants'),
                ),
              ],
              icon: Icon(Icons.more_vert_outlined),
            )
          ],
        ),
      ),
    );
  }
}
