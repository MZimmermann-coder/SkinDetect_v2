import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skindetect/blocs/scaffold_app_bar.dart';
import 'package:skindetect/blocs/scaffold_color.dart';

ScaffoldColorCubit color = ScaffoldColorCubit();
// ScaffoldAppBarCubit appBar = ScaffoldAppBarCubit();

class ScaffoldWithNav extends StatefulWidget {
  ScaffoldWithNav({super.key, required this.child});

  final Widget child;

  @override
  State<StatefulWidget> createState() => _ScaffoldWithNav();
}

class _ScaffoldWithNav extends State<ScaffoldWithNav> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ScaffoldColorCubit, Color>(
      bloc: color,
      builder: (context, state) => Scaffold(
        backgroundColor: state,
        body: SafeArea(child: widget.child),
        bottomNavigationBar: Container(
            height: 60,
            padding: EdgeInsets.symmetric(horizontal: 50),
            decoration: BoxDecoration(
                color: Color(0xFFFFFFFF),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 5,
                    blurRadius: 5,
                    offset: Offset(0, -1), // changes position of shadow
                  ),
                ]),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () => context.go("/faq"),
                    icon: Icon(
                      Icons.question_mark,
                      size: 28,
                    ),
                    color: iconColor(context, "/faq"),
                  ),
                  IconButton(
                    onPressed: () => context.go("/home"),
                    icon: Icon(Icons.home, size: 35),
                    color: iconColor(context, "/home"),
                  ),
                  IconButton(
                    onPressed: () => context.go("/history"),
                    icon: Icon(Icons.history, size: 33),
                    color: iconColor(context, "/history"),
                  )
                ])),
      ),
    );
  }

  Color iconColor(BuildContext ctx, String path) {
    return GoRouter.of(ctx).location.contains(path)
        ? Color.fromARGB(255, 41, 44, 47)
        : Color.fromARGB(255, 126, 126, 122);
  }
}
