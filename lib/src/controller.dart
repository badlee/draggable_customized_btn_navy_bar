part of draggable_customized_btn_navy_bar;

class DraggableCustomizedBtnNavyBarController {
  Map<String, ValueListenable> _badges = {};
  StreamController<DragItemUpdate>? _dragItemUpdateStream;
  void _initBadges(List<DraggableCustomizedDotBarItem?> items,
      List<DraggableCustomizedDotBarItem?> hiddenItems) {
    items.forEach((item) {
      _badges[item.keyItem] = _getValueListenable(item.badge);
    });

    hiddenItems.forEach((item) {
      _badges[item.keyItem] = _getValueListenable(item.badge);
    });
  }
  
  void _initDragItemUpdate(StreamController<DragItemUpdate>? dragItemUpdateStream){
    _dragItemUpdateStream = dragItemUpdateStream;
  }

  _getValueListenable(dynamic _badge) {
    if (_badge is! ValueListenable) {
      _badge = ValueNotifier(_badge);
    }
    return _badge;
  }

  ValueListenable? _badge(String id) {
    return _badges[id];
  }
  bool get settingsIsOpen {
    return false;
  }
  void openSettings(){

  }
  void closeSettings(){
    
  }
  void toogleSettings(){

  }

  void setBadge(String id, value) {
    _badge(id)?.value = value;
  }

  getBadge(String id) {
    return _badge(id)?.value;
  }

  hasBadge(String id) {
    return _badges.containsKey(id);
  }

  operator [](String id) {
    return getBadge(id);
  }

  void operator []=(String id, value) {
    return setBadge(id, value);
  }
}
