
data:= {}

^!f12::
winget hw, id, a
if ((hw != "") && (hw != 0)) {
  if (data[hw]) {
    winset exstyle, % data[hw], ahk_id %hw%
    data.delete(hw)
  } else {
    winget es, exstyle, ahk_id %hw%
    data[hw]:= es
    winset exstyle, % (es | 0x80), ahk_id %hw%
  }
}
return