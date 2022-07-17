
import 'package:flutter/material.dart';
import 'package:my_app/components/appbar.dart';
import 'package:my_app/components/bottom_nav.dart';
import 'package:my_app/http/httporder.dart';
import 'package:my_app/model/order.dart';
import 'package:my_app/pallate.dart';
import 'package:my_app/screens/orders/components/body.dart';



class OrdersScreen extends StatefulWidget {
  const OrdersScreen({ Key? key }) : super(key: key);
  static String routeName= '/myorders';

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
    List<Order> orders = List<Order>.empty(growable: true);

  late Future<List<Order>> futureOrder;

  @override
  void initState() {
    WidgetsFlutterBinding.ensureInitialized();
    super.initState();
    futureOrder = HttpConnectOrder().getOrders();
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context,"Orders History"),
      body: Body(),
      bottomNavigationBar: BottomNav(),
    );
  
  }
}