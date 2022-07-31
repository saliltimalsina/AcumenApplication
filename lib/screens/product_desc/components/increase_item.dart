import 'package:flutter/material.dart';
import 'package:my_app/pallate.dart';
import 'package:my_app/size_config.dart';

class IncreaseItem extends StatefulWidget {
  const IncreaseItem({
    Key? key,
  }) : super(key: key);

  @override
  State<IncreaseItem> createState() => _IncreaseItemState();
}

class _IncreaseItemState extends State<IncreaseItem> {
  int _itemQty = 0;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
                color: Colors.orange, borderRadius: BorderRadius.circular(8)),
            child: TextButton(
                onPressed: () {
                  if (_itemQty > 0) {
                    setState(() {
                      _itemQty--;
                    });
                  }
                },
                child: Center(
                    child: Container(
                        child: Icon(
                  Icons.remove,
                  color: Colors.white,
                )))),
          ),
          const SizedBox(
            width: 15,
          ),
          Text(
            _itemQty.toString(),
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          const SizedBox(
            width: 15,
          ),
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
                color: Colors.orange, borderRadius: BorderRadius.circular(8)),
            child: TextButton(
                onPressed: () {
                  setState(() {
                    _itemQty++;
                  });
                },
                child: const Center(
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
