sub init()
    m.clipArea = m.top.findNode("clipArea")
    m.animation = m.top.findNode("scrollAnimation")
    m.interpolator = m.top.findNode("scrollInterpolator")
end sub

sub setContent(node as object)
    m.scrollTarget = node
    m.scrollTarget.id = "scrollTarget"

    width = m.top.width
    height = m.top.height

    m.clipArea.clippingRect = [0, 0, width, height]
    m.clipArea.appendChild(m.scrollTarget)

    m.scrollTop = 0
    m.animatedScrolling = m.top.animatedScrolling
    m.maxScroll = m.scrollTarget.boundingRect().height - height
    if m.maxScroll < 0 then m.maxScroll = 0
    m.scrollStep = m.top.scrollStep
    if m.scrollStep = 0 then m.scrollStep = int(height / 3)
end sub

sub scrollBy(distance as integer)
    ' calculate target position
    prevTop = m.top.scrollTop
    target = prevTop + distance
    if target < 20 ' snap to boundaries
        target = 0
    else if target > m.maxScroll - 20
        target = m.maxScroll
    end if
    m.top.scrollTop = target
end sub

sub applyScrolling(event as object)
    if m.scrollTarget = invalid then return
    target = event.getData()

    ' update translation
    if m.animatedScrolling
        m.animation.control = "stop"
        m.interpolator.keyValue = [
            m.scrollTarget.translation,
            [0, -target]
        ]
        m.animation.control = "start"
    else
        m.scrollTarget.translation = [0, -target]
    end if
end sub

function onKeyEvent(key as string, press as boolean) as boolean
    if not press then return false
    if key = "down"
        scrollBy(m.scrollStep)
        return true
    else if key = "up"
        scrollBy(-m.scrollStep)
        return true
    end if
    return false
end function
