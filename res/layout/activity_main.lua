local bindClass = luajava.bindClass;
local LinearLayout = bindClass "android.widget.LinearLayout"
local Button = bindClass "android.widget.Button"

return {
  LinearLayout,
  layout_width="match",
  layout_height="match",
  orientation="vertical",
  gravity="center",
  backgroundColor=0xffffffff,
  {
    Button,
    id="mButton",
  },
}