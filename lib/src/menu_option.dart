part of draggable_customized_btn_navy_bar;

class MenuOption extends StatelessWidget {
  final IconData? _iconData;
  final Color? _colorIcon;
  final Color? _badgeColor;
  final Color? _badgeTextColor;
  final String? _badge;
  final GestureTapCallback? _onTap;
  final bool _enable;

  const MenuOption(this._iconData, this._colorIcon, this._badgeColor, this._badgeTextColor, this._onTap, this._enable, _badge
      {super.key});

  @override
  Widget build(BuildContext context) {
    var badgeTxt = (_badge ?? "");
    var isNum = double.tryParse(badgeTxt) != null;
    var maxLength = isNum ? 2 : 4;
    badgeTxt = badgeTxt.substring(0,badgeTxt.length > maxLength ? maxLength : badgeTxt.length) + (badgeTxt.length > maxLength ? (isNum ? "+" : ".") : "");
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
            child: Stack(
              fit: StackFit.loose,
              children: [
                Positioned.fill(
                  child: Center(
                    child: Icon(_iconData, color: _colorIcon, size: 30.0),
                  ),
                ),
                if(_badge != null && _badge!.isNotEmpty)
                  Positioned(
                    top: 0,
                    right: 0,
                    child: Container(
                    padding: EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: _badgeColor ?? appRed,
                    ),
                    child: Text(badgeTxt, style: TextStyle(color: _badgeTextColor ?? kScaffoldLight , fontSize: 8),),
                  ))
              ],
            ),
            height: 40,
            width: 40,
          )
        ));
  }
}
