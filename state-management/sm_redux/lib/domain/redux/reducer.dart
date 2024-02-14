import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:simpe_state_management/domain/redux/action.dart';

import 'app_state.dart';

int _addCounterReducer(int count, IncrementEvent action) => count + 1;
int _clearCounterReducer(int count, ClearEvent action) => 0;

Reducer<int> _counterReducer = combineReducers([
  TypedReducer<int, IncrementEvent>(_addCounterReducer),
  TypedReducer<int, ClearEvent>(_clearCounterReducer),
]);

AppState reducer(AppState state, dynamic action) => AppState(
    countInCart: _counterReducer(state.countInCart, action),
    plist: _listReducer(state.plist, action));

Reducer<Widget> _listReducer = combineReducers(
    [TypedReducer(_getListReducer), TypedReducer(_loadedListReducer)]);

Widget _getListReducer(Widget widget, GetProductsListAction action) =>
    const Center(child: CircularProgressIndicator());

Widget _loadedListReducer(Widget widget, LoadedProductsListAction action) =>
    action.plist;
