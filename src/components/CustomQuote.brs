sub onSizeChanged(event)
    size = event.getData() ' [width, height]
    line = m.top.findNode("line")
    line.height = size[1]
end sub
