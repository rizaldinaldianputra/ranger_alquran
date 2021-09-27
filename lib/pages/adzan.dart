import 'package:flutter/material.dart';

/// This is the stateful widget that the main application instantiates.
class Adzan extends StatefulWidget {
  const Adzan({Key? key}) : super(key: key);

  @override
  State<Adzan> createState() => _AdzanState();
}

/// This is the private State class that goes with Adzan.
class _AdzanState extends State<Adzan> {
// [SliverAppBar]s are typically used in [CustomScrollView.slivers], which in
// turn can be placed in a [Scaffold.body].
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: MediaQuery.of(context).size.height * 0.28,
            flexibleSpace: const FlexibleSpaceBar(
              background: FlutterLogo(),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  child: Card(
                    child: ListTile(
                      leading: Icon(Icons.alarm),
                      title: Text('Three-line ListTile'),
                      subtitle: Text(
                          'A sufficiently long subtitle warrants three lines.'),
                      trailing: Icon(Icons.more_vert),
                      isThreeLine: true,
                    ),
                  ),
                );
              },
              childCount: 5,
            ),
          ),
        ],
      ),
    );
  }
}
