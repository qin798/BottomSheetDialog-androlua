local bindClass = luajava.bindClass;
local BottomSheetDialog = bindClass "com.google.android.material.bottomsheet.BottomSheetDialog"
local Glide = bindClass "com.bumptech.glide.Glide"
local ColorStateList = bindClass "android.content.res.ColorStateList"
local LuaAdapter = bindClass "com.androlua.LuaAdapter"
local Snackbar = bindClass "com.google.android.material.snackbar.Snackbar"
local LuaThemeUtil = luajava.newInstance("github.daisukiKaffuChino.utils.LuaThemeUtil",activity)
local Layout = require "Layout"
local _M = {}
local views = {}
local dialog,button_layout_load
local requestManager = Glide.with(activity)

_M.setTitle = function(str)
  views.top_bar.setVisibility(0)
  views.title.setText(str)
  return _M
end

_M.setIcon = function(drawable)
  views.icon_layout.setVisibility(0)
  requestManager.load(drawable).into(views.icon)
  return _M
end

_M.setView = function(view)
  local content = views.content
  content.setVisibility(0)
  content.removeAllViews()
  content.addView(view)
  return _M
end

_M.setMessage = function(str)
  local message = views.message
  message.setVisibility(0)
  message.setText(str)
  return _M
end

local button_onClick = function(button,str,click,cancel)
  click = click or lambda():nil
  views.button_layout.setVisibility(0)
  local button = views[button]
  button.setVisibility(0)
  button.setText(str)
  button.onClick = cancel == false and click or function()
    local re = click()
    _M.dismiss()
    return re
  end
end

_M.setPositiveButton = function(...)
  button_onClick("positive_button",...)
  return _M
end

_M.setNegativeButton = function(...)
  button_onClick("negative_button",...)
  return _M
end

_M.setItems = function(items,icons,click)
  if type(icons) == "function" then
    click = icons or lambda():nil
    icons = {}
  end
  _M.setView(Layout.load(res.layout.dialog_list,views))
  local adapter = LuaAdapter(activity,res.layout.dialog_listitem)
  views.mListView.setAdapter(adapter)
  for k,v in ipairs(items) do
    adapter.add({
      button={
        text = v,
        icon = res.drawable[tostring(icons[k])],
        onClick = function(v)
          local re = click(dialog,k)
          _M.dismiss()
          return re
        end
      }
    })
  end
  return _M
end

_M.print = function(...)
  local t = {tostring(...)}
  return Snackbar.make(views.base_layout.getParent(),tostring(table.concat(t,"\n")),Snackbar.LENGTH_SHORT)
  .setAnchorView(views.base_layout)
  .show()
end

_M.show = function()
  dialog.show()
  return _M
end

_M.dismiss = function()
  dialog.dismiss()
  return _M
end

setmetatable(_M,{
  __index = lambda(self,...):dialog[...]
})

return function(...)
  dialog = BottomSheetDialog(...)
  .setContentView(Layout.load(res.layout.dialog_bottomsheet,views));

  views.close.onClick = _M.dismiss

  local color = LuaThemeUtil.getColorSecondaryVariant();
  local attrsArray = {android.R.attr.selectableItemBackgroundBorderless}
  local typedArray =activity.obtainStyledAttributes(attrsArray)
  local ripple=typedArray.getResourceId(0,0)
  local Pretend=activity.Resources.getDrawable(ripple)
  Pretend.setColor(ColorStateList(int[0].class{int{}},int{color}))
  views.close.setBackground(Pretend.setColor(ColorStateList(int[0].class{int{}},int{color})))

  return _M
end