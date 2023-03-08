part of draggable_customized_btn_navy_bar;

class MenuOption extends StatelessWidget {
  final IconData? _iconData;
  final Color? _colorIcon;
  final Color? _badgeColor;
  final Color? _badgeTextColor;
  final GestureTapCallback? _onTap;
  final bool _enable;
  final ValueListenable<String>? _badge;

  const MenuOption(this._iconData, this._colorIcon, this._badgeColor,
      this._badgeTextColor, this._onTap, this._enable, this._badge,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return ButtonScale(
        activeOpacity: true,
        onTap: _enable
            ? () {
                _onTap!();
              }
            : null,
        child: Container(
            color: Colors.transparent,
            alignment: Alignment.center,
            child: SizedBox(
              height: 40,
              width: 40,
              child: Stack(
                fit: StackFit.loose,
                children: [
                  Positioned.fill(
                    child: Center(
                      child: Icon(_iconData, color: _colorIcon, size: 30.0),
                    ),
                  ),
                  if(_badge != null)
                  ValueListenableBuilder(
                      valueListenable: _badge!,
                      builder: (BuildContext context, dynamic badge,
                              Widget? child) =>
                          _getBadge(badge)),
                ],
              ),
            )));
  }

  Widget _getBadge(dynamic badge) {
    String badgeTxt = "";
    if (badge is num || badge is String) {
      badgeTxt = (badge?.toString() ?? "").trim().toUpperCase();
      var total = double.tryParse(badgeTxt);
      if (total != null) {
        badgeTxt = total > 99 ? "99+" : "${total.toInt()}";
      } else {
        var maxLength = 3;
        badgeTxt = badgeTxt.substring(
                0,
                badgeTxt.length > maxLength
                    ? maxLength
                    : badgeTxt.length);
      }
      ;
    }
    return Positioned(
      top: 0,
      right: 0,
      child: AnimatedOpacity(
        duration: Duration(milliseconds: 50),
        opacity: badgeTxt.isEmpty ? 0 : 1,
        child: Container(
          width: 25,
          padding: EdgeInsets.all(3),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: _badgeColor ?? appPink,
          ),
          child: Center(
            child:  Text(
                badgeTxt,
                style: TextStyle(
                    color: _badgeTextColor ?? kScaffoldLight, fontSize: 8),
            ),
          ),
        ),
      ),
    );
  }
}
