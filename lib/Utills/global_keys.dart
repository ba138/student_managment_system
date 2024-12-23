import 'package:flutter/material.dart';

final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
final GlobalKey<ScaffoldState> _gridScaffoldKey = GlobalKey<ScaffoldState>();
final GlobalKey<ScaffoldState> _addProductScaffoldKey =
    GlobalKey<ScaffoldState>();
final GlobalKey<ScaffoldState> _orderScaffoldKey = GlobalKey<ScaffoldState>();
final GlobalKey<ScaffoldState> _financeScaffoldKey = GlobalKey<ScaffoldState>();
final GlobalKey<ScaffoldState> _courseScaffoldKey = GlobalKey<ScaffoldState>();
final GlobalKey<ScaffoldState> _addCourseScaffoldKey =
    GlobalKey<ScaffoldState>();

// Getters
GlobalKey<ScaffoldState> get getScaffoldKey => _scaffoldKey;
GlobalKey<ScaffoldState> get getgridscaffoldKey => _gridScaffoldKey;
GlobalKey<ScaffoldState> get getAddProductscaffoldKey => _addProductScaffoldKey;
GlobalKey<ScaffoldState> get getOrderScaffoldKey => _orderScaffoldKey;
GlobalKey<ScaffoldState> get getFinanceScaffoldKey => _financeScaffoldKey;
GlobalKey<ScaffoldState> get getCourseScaffoldKey => _courseScaffoldKey;
GlobalKey<ScaffoldState> get addCourseScaffoldKey => _addCourseScaffoldKey;

// Callbacks
void controlDashboarkMenu() {
  if (!_scaffoldKey.currentState!.isDrawerOpen) {
    _scaffoldKey.currentState!.openDrawer();
  }
}

void controlProductsMenu() {
  if (!_gridScaffoldKey.currentState!.isDrawerOpen) {
    _gridScaffoldKey.currentState!.openDrawer();
  }
}

void controlAddProductsMenu() {
  if (!_addProductScaffoldKey.currentState!.isDrawerOpen) {
    _addProductScaffoldKey.currentState!.openDrawer();
  }
}

void controlOrderScreen() {
  if (!_orderScaffoldKey.currentState!.isDrawerOpen) {
    _orderScaffoldKey.currentState!.openDrawer();
  }
}

void controlFinanceScreen() {
  if (!_financeScaffoldKey.currentState!.isDrawerOpen) {
    _financeScaffoldKey.currentState!.openDrawer();
  }
}

void controlCourseScreen() {
  if (!_courseScaffoldKey.currentState!.isDrawerOpen) {
    _courseScaffoldKey.currentState!.openDrawer();
  }
}

void controlAddCourseScreen() {
  if (!_addCourseScaffoldKey.currentState!.isDrawerOpen) {
    _addCourseScaffoldKey.currentState!.openDrawer();
  }
}
