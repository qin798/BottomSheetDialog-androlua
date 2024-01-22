local bindClass = luajava.bindClass;
local LinearLayout = bindClass "android.widget.LinearLayout"
local MaterialButton = bindClass "com.google.android.material.button.MaterialButton"

local BottomSheetDialog = require "mods.dialog.bottomsheetdialog.BottomSheetDialog"

local mButton = function(t)
  return {
    MaterialButton,
    layout_width="match",
    layout_marginBottom="10dp",
    OnClickListener=t.onClick,
    text=t.text,
  }
end

return {
  LinearLayout,
  layout_width="match",
  layout_height="match",
  orientation="vertical",
  backgroundColor=LuaThemeUtil.getColorBackground(),
  padding="10dp",

  mButton({
    text="title",
    onClick=function()
      BottomSheetDialog(activity)
      .setTitle("Title")
      .show()
    end
  }),

  mButton({
    text="message",
    onClick=function()
      BottomSheetDialog(activity)
      .setTitle("Title")
      .setMessage("Message")
      .show()
    end
  }),

  mButton({
    text="icon",
    onClick=function()
      BottomSheetDialog(activity)
      .setTitle("Title")
      .setMessage("Message")
      .setIcon(activity.getLuaDir().."/create.png")
      .show()
    end
  }),

  mButton({
    text="button",
    onClick=function()
      BottomSheetDialog(activity)
      .setTitle("Title")
      .setMessage("Message")
      .setIcon(activity.getLuaDir().."/create.png")
      .setPositiveButton("确定",nil)
      .setNegativeButton("取消",nil)
      .show()
    end
  }),

  mButton({
    text="dialog do not dismiss after clicking the positive button.",
    onClick=function()
      BottomSheetDialog(activity)
      .setTitle("Title")
      .setMessage("Message")
      .setIcon(activity.getLuaDir().."/create.png")
      .setPositiveButton("确定",nil,false)
      .setNegativeButton("取消",nil)
      .show()
    end
  }),

  mButton({
    text="dialog do not dismiss after clicking the negative button.",
    onClick=function()
      BottomSheetDialog(activity)
      .setTitle("Title")
      .setMessage("Message")
      .setIcon(activity.getLuaDir().."/create.png")
      .setPositiveButton("确定",nil)
      .setNegativeButton("取消",nil,false)
      .show()
    end
  }),

  mButton({
    text="a toast show on the dialog.",
    onClick=function()
      local dialog = BottomSheetDialog(activity)
      dialog.setTitle("Title")
      .setMessage("Message")
      .setIcon(activity.getLuaDir().."/create.png")
      .setPositiveButton("确定",dialog.print,false)
      .setNegativeButton("取消",function()
        dialog.print("确认取消")
        .setAction("取消",dialog.dismiss)
      end,false)
      .show()
    end
  }),

  mButton({
    text="items",
    onClick=function()
      local dialog = BottomSheetDialog(activity)
      dialog.setTitle("Title")
      .setIcon(activity.getLuaDir().."/create.png")
      .setItems({"Item 1","Item 2","Item 3"},nil)
      .show()
    end
  }),

}