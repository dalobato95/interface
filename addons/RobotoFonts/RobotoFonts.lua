if not RobotoFonts then return end
local revision = tonumber(string.sub("$Revision: 63551 $", 12, -3))
RobotoFonts.revision = (revision > RobotoFonts.revision) and revision or RobotoFonts.revision
RobotoFonts:Register("font", "Roboto Black", [[Interface\Addons\RobotoFonts\fonts\Roboto-Black.ttf]])
RobotoFonts:Register("font", "Roboto Bold", [[Interface\Addons\RobotoFonts\fonts\Roboto-Bold.ttf]])
RobotoFonts:Register("font", "Roboto Italic", [[Interface\Addons\RobotoFonts\fonts\Roboto-Italic.ttf]])
RobotoFonts:Register("font", "Roboto Light", [[Interface\Addons\RobotoFonts\fonts\Roboto-Light.ttf]])
RobotoFonts:Register("font", "Roboto Medium", [[Interface\Addons\RobotoFonts\fonts\Roboto-Medium.ttf]])
RobotoFonts:Register("font", "Roboto Regular", [[Interface\Addons\RobotoFonts\fonts\Roboto-Regular.ttf]])
RobotoFonts:Register("font", "Roboto Thin", [[Interface\Addons\RobotoFonts\fonts\Roboto-Thin.ttf]])
RobotoFonts:Register("font", "RobotoCondensed Bold", [[Interface\Addons\RobotoFonts\fonts\RobotoCondensed-Bold.ttf]])
RobotoFonts:Register("font", "RobotoCondensed Light", [[Interface\Addons\RobotoFonts\fonts\RobotoCondensed-Light.ttf]])
RobotoFonts:Register("font", "RobotoCondensed-Regular", [[Interface\Addons\RobotoFonts\fonts\RobotoCondensed-Regular.ttf]])
