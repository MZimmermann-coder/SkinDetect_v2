import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

typedef AppBar? AppBarFunction(BuildContext context);

class ScaffoldAppBarCubit extends Cubit<AppBarFunction> {
  ScaffoldAppBarCubit() : super((context) => null);

  setAppBar(String title, Color color) =>
      emit((BuildContext context) => (AppBar(
            title: Text(title),
            elevation: 0,
            backgroundColor: color,
            leading: InkWell(
              onTap: () {
                context.pop();
              },
              child: Icon(
                Icons.arrow_back_ios,
                color: Colors.black54,
              ),
            ),
          )));

  unsetAppBar() => emit((context) => null);
}
