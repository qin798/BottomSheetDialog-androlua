bindClass = luajava.bindClass
newInstance = luajava.newInstance
Layout = require "Layout"
MDC_R = bindClass "com.google.android.material.R"
res = require "res"
R = bindClass "com.load.LuaAppX.R"
luadir = activity.getLuaDir()
LuaThemeUtil = newInstance("github.daisukiKaffuChino.utils.LuaThemeUtil",activity)
android = {
  R = bindClass "android.R"
}
loadlayout = Layout.load

local layout = require("res.layout.activity_main")
local Build = bindClass "android.os.Build"
local WindowManager = bindClass "android.view.WindowManager"

activity.setTheme(R.style.Theme_Material3_Green)
activity.setTitle("test")
activity.setContentView(Layout.load(layout))

local ColorPrimary = LuaThemeUtil.getColorPrimary()
local BottomSheetDialog = require "mods.dialog.BottomSheetDialog"

mButton.onClick = function()
  local dialog = BottomSheetDialog(activity)
  dialog.setTitle("新建工程")
  .setIcon(luadir .. "/create.png") -- 传 drawable 也可以
  .setMessage("无可奈何花落去，似曾相识燕归来😔")
  .setPositiveButton("确定",dialog.print,false) -- 第三个参数是点击后是否关闭对话框，可有可无，默认关闭
  .setNegativeButton("取消",function()
    local cancel = activity.getString(android.R.string.cancel)
    dialog.print(cancel).setAction(cancel,dialog.print)
  end,false)
  .setItems(
  {"删除","CLOSE","close"},
  {"close","close","close"},
  print
  )
  .show()



  --[[ 此外，它还支持 
  com.google.android.material.bottomsheet.BottomSheetDialog
  里的所有方法
  感兴趣可以去看看原理
  ]]
  -- 例如
  dialog.getWindow()
  .setStatusBarColor(0x000000) -- 设置顶部状态栏颜色
  .setNavigationBarColor(ColorPrimary) -- 设置底部虚拟按键栏颜色

end