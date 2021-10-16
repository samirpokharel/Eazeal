import 'package:flutter/material.dart';

abstract class InfiniteListView<T> extends StatefulWidget {
  const InfiniteListView({Key? key}) : super(key: key);

  @override
  _InfiniteListViewState createState() => _InfiniteListViewState<T>();

  Widget getItemWidget(T item);

  Future<List<T>> getListData(int? pageNumber);

  Widget getLoadingWidget() => const Center(child: CircularProgressIndicator());

  Widget getPaginationLoadingWidget() {
    return const Center(
      child: Padding(
        padding: EdgeInsets.all(12),
        child: CircularProgressIndicator(),
      ),
    );
  }

  Widget getErrorWidget(dynamic error) {
    return const Center(
      child: Padding(
        padding: EdgeInsets.all(24),
        child: Text(
          "Something went wrong! Tap to try again.",
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }

  Widget getPaginationErrorWidget(dynamic error) {
    return const Center(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Text("Something went wrong! Tap to try again."),
      ),
    );
  }
}

class _InfiniteListViewState<T> extends State<InfiniteListView> {
  late bool _hasMore;
  late bool _error;
  late bool _loading;
  int? _pageNumber;
  late List<T?> _listData;
  final int _nextPageThreshold = 5;
  dynamic _encounteredError;

  @override
  void initState() {
    super.initState();
    _hasMore = true;
    _error = false;
    _loading = true;
    _pageNumber = 1;
    _listData = [];
    fetchPhotos();
  }

  @override
  Widget build(BuildContext context) {
    if (_listData.isEmpty) {
      if (_loading) {
        return widget.getLoadingWidget();
      } else if (_error) {
        return InkWell(
          onTap: () => retry(),
          child: widget.getErrorWidget(_encounteredError),
        );
      }
    } else {
      return ListView.builder(
          itemCount: _listData.length + (_hasMore ? 1 : 0),
          itemBuilder: (context, index) {
            if (index == _listData.length - _nextPageThreshold) {
              fetchPhotos();
            }
            if (index == _listData.length) {
              if (_error) {
                return InkWell(
                  onTap: () => retry(),
                  child: widget.getPaginationErrorWidget(_encounteredError),
                );
              } else {
                return widget.getPaginationLoadingWidget();
              }
            }
            return widget.getItemWidget(_listData[index]);
          });
    }
    return Container();
  }

  void retry() {
    setState(() {
      _loading = true;
      _error = false;
      fetchPhotos();
    });
  }

  Future<void> fetchPhotos() async {
    widget.getListData(_pageNumber).then((value) {
      setState(() {
        _loading = false;
        if (value.isEmpty) {
          _hasMore = false;
        } else {
          _pageNumber = _pageNumber! + 1;
          _listData.addAll(value as List<T?>);
        }
      });
    }).catchError((error) {
      setState(() {
        _encounteredError = error;
        _loading = false;
        _error = true;
      });
    });
  }
}
