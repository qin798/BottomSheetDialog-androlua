bindClass = luajava.bindClass
newInstance = luajava.newInstance
Layout = require "Layout"
MDC_R = bindClass "com.google.android.material.R"
R = bindClass "github.znzsofficial.openlua.R"
luadir = activity.getLuaDir()
LuaThemeUtil = newInstance("github.daisukiKaffuChino.utils.LuaThemeUtil",activity)
android = {
  R = bindClass "android.R"
}
loadlayout = Layout.load

activity.setTitle("BottomSheetDialog")
.setContentView(Layout.load(require("activity_main")))