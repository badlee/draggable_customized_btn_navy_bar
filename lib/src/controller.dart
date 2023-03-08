part of draggable_customized_btn_navy_bar;

class DraggableCustomizedBtnNavyBarController {
  final Map<String, ValueNotifier<String>> _badges = {};
  _DraggableCustomizedBtnNavyBarState? _parent;
  DraggableCustomizedBtnNavyBarController _initBadges(List<DraggableCustomizedDotBarItem?> items,
      List<DraggableCustomizedDotBarItem?> hiddenItems) {
    items.whereType<DraggableCustomizedDotBarItem>().forEach((item) {
      _badges[item.keyItem] = _getValueNotifier(item.badge);
    });

    hiddenItems.whereType<DraggableCustomizedDotBarItem>().forEach((item) {
      _badges[item.keyItem] = _getValueNotifier(item.badge);
    });
    return this;
  }
  String _getValue(badge)=>badge is String || badge is num ? badge.toString() : (badge is bool && badge == true ? "!": "");
  _getValueNotifier(dynamic badge) {
    return ValueNotifier<String>(_getValue(badge));
  }

  
  bool get settingsIsOpen {
    return _parent?._settingVisible ?? false;
  }

  
  ValueNotifier<String>? _getNotifier(String keyItem) {
    return _badges[keyItem];
  }
  
  bool hasBadge(String keyItem) {
    return _badges.containsKey(keyItem);
  }

  String? getBadge(String keyItem) {
    return _badges[keyItem]?.value;
  }
  void setBadge(String keyItem, badge) {
    _badges[keyItem]?.value = _getValue(badge);
  }

  String? operator [](String keyItem) {
    return getBadge(keyItem);
  }
  void operator []=(String keyItem,badge) {
    setBadge(keyItem,badge);
  }
}
