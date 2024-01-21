local ColorStateList = bindClass "android.content.res.ColorStateList"
local MaterialButton = bindClass "com.google.android.material.button.MaterialButton"
local MaterialCardView = bindClass "com.google.android.material.card.MaterialCardView"
local LinearLayoutCompat = bindClass "androidx.appcompat.widget.LinearLayoutCompat"
local MaterialTextView = bindClass "com.google.android.material.textview.MaterialTextView"
local AppCompatImageView = bindClass "androidx.appcompat.widget.AppCompatImageView"
local ColorBackground = LuaThemeUtil.getColorSurfaceVariant();
local ColorPrimary = LuaThemeUtil.getColorPrimary();
local ColorText = LuaThemeUtil.getColorOnSurfaceVariant();
local ColorRipple = LuaThemeUtil.getColorSecondaryVariant();
local typeface = res.font.jost

return {
  MaterialButton,
  layout_width="match",
  layout_height="52dp",
  BackgroundTintList=ColorStateList.valueOf(ColorBackground),
  id="button",
  textColor=ColorText,
  iconTint=ColorStateList.valueOf(ColorPrimary),
  RippleColor=ColorStateList.valueOf(ColorRipple),
  typeface=typeface,
  --textAllCaps=false,
  gravity="start|center",
}