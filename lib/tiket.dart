import 'package:flutter/material.dart';
// import 'package:vector_math/vector_math.dart' as v_math;


class Tiket extends StatefulWidget {
  const Tiket({Key? key}) : super(key: key);
  @override

  _TiketState createState() => _TiketState();
}

class _TiketState extends State<Tiket> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( 
        title:  const Text('Tiket'),
      ),
      body: Center(
        child: Ticket(
          top: Container(
            margin: const EdgeInsets.all(0),
            height: 180,
            child: Column(
              mainAxisSize:MainAxisSize.min,
              children: <Widget>[
                Row(
                  mainAxisAlignment:MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(top: 20,left: 10),
                      child: Container(
                        width: 150,
                        height: 120,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius:BorderRadius.circular(8),
                        ),
                        child: Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment:MainAxisAlignment.center,
                              children: const [
                                Flexible(
                                  child:Text('noUrut',
                                   
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment:MainAxisAlignment.center,
                              children: const [
                                Flexible(
                                  child:Text('No. Urut',
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Container(
                      padding: const EdgeInsets.only(top: 20,right: 10),
                      child: Container(
                        width: 150,
                        height: 120,
                        padding: const EdgeInsets.all(10,),
                        decoration:BoxDecoration(
                          color: Colors.green,
                          borderRadius:BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment:MainAxisAlignment.center,
                              children: const [
                                Flexible(
                                  child: Text('noTiket',
                                   
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment:MainAxisAlignment.center,
                              children: const [
                                Flexible(
                                  child: Text('No. Tiket',
                                    
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          bottom: Container(
            height: 180,
          ),
          width: 350,
          borderRadius: 10,
          punchRadius: 10,
        ),
      ),
    );
  }
}

class Ticket extends StatefulWidget {
  final double width;
  final EdgeInsets padding;
  final double punchRadius;
  final double borderRadius;
  final Widget top;
  final Widget bottom;
  final Color? color;
  final bool isCornerRounded;

  @override
  const Ticket({
    Key ? key,
    required this.width,
    required this.top,
    required this.bottom,
    required this.borderRadius,
    required this.punchRadius,
    this.padding = const EdgeInsets.all(5.0),
    this.color = Colors.white,
    this.isCornerRounded = false, 
  }): super(key: key);

  @override
  _TicketState createState() => _TicketState();
}

class _TicketState extends State<Ticket> {
  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Container(
        padding: widget.padding,
        decoration:  BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.04),
              blurRadius: 20,
              offset: const Offset(0.0, 0.0),
            ),
            BoxShadow(
              color: Colors.black.withOpacity(.05),
              blurRadius: 20,
              offset: const Offset(0.0, 10.0),
              spreadRadius: -15, 
            )
          ], 
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            
            ClipPath(
              clipper: TicketClipper(widget.punchRadius),
              child: Column(
                children: <Widget>[
                  
                  Container(
                    width: widget.width,
                    child: widget.top,
                    decoration: BoxDecoration(
                      color: widget.color,
                      borderRadius: BorderRadius.circular(widget.borderRadius,),
                    ),
                  ),
                  SizedBox(
                    width: widget.width,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      color: Colors.white,
                      child: const Dash(
                        width: 5,
                        height: 3,
                        color:  Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            ClipPath(
              clipper: TicketClipperBottom(widget.punchRadius),
              child: Container(
                width: widget.width,
                child: widget.bottom,
                decoration: BoxDecoration(
                  color: widget.color,
                  borderRadius: BorderRadius.circular(widget.borderRadius), 
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class TicketClipper extends CustomClipper<Path> {
  double punchRadius;
  TicketClipper(this.punchRadius);

  @override
  Path getClip(Size size) {
    Path path = Path();

    path.lineTo(0.0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0.0);

    path.addOval(
        Rect.fromCircle(center: Offset(0.0, size.height), radius: punchRadius));
    path.addOval(Rect.fromCircle(
        center: Offset(size.width, size.height), radius: punchRadius));

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}

class TicketClipperBottom extends CustomClipper<Path> {
  double punchRadius;
  TicketClipperBottom(this.punchRadius);

  @override
  Path getClip(Size size) {
    Path path = Path();

    path.lineTo(0.0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0.0);

    path.addOval(Rect.fromCircle(center: const Offset(0.0, 0), radius: punchRadius),);
    path.addOval(Rect.fromCircle(center: Offset(size.width, 0), radius: punchRadius),);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}

class Dash extends StatelessWidget {

  final double height;
  final double width;
  final Color color;

  const Dash({
    Key? key,
    this.height = 1, 
    this.width = 3, 
    this.color = Colors.black, 
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final boxWidth = constraints.constrainWidth();
        final dashWidth = width;
        final dashHeight = height;
        final dashCount = (boxWidth / (2 * dashWidth)).floor();
        return Flex(
          children: List.generate(dashCount, (_) {
            return SizedBox(
              width: dashWidth,
              height: dashHeight,
              child: DecoratedBox(
                decoration: BoxDecoration(color: color),
              ),
            );
          }),
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          direction: Axis.horizontal,
        );
      },
    );
  }
}