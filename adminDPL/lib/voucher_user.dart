import 'package:flutter/material.dart';
//import 'package:flutter_ticket_view/ticketview.dart';


class VoucherUser extends StatefulWidget {
  const VoucherUser({super.key});

  @override
  State<VoucherUser> createState() => __VoucherUserState();
}

class __VoucherUserState extends State<VoucherUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment history'),
      ),
    //   body: TicketView(
    //     child: Container(
    //       child: Text("gg"),
    //     ),
    // )
    );
  }
}