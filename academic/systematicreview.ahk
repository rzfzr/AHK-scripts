#SingleInstance force

Esc::

    send, {right}
    sleep, 100
    send, {right}
    sleep, 100
    send, {right}
    sleep, 100
    send, !{Enter}

Return

`::
    send, ^w
    sleep, 500
    send, {left}
    sleep, 100
    send, {left}
    sleep, 100
    send, {left}
    sleep, 100
    send, !{Enter}

Return

F1::
    send, ^w
    sleep, 500
    send, {left}
    sleep, 100
    send, {left}
    sleep, 100
    send, {left}
    sleep, 100
    send, !{Enter}

    send, Sim
    sleep, 200
    send, {Enter}
    sleep, 200
    send, {right}
    sleep, 200
    send, {right}
    sleep, 200
    send, {right}
    sleep, 200
    send, !{Enter}
Return

F2::
    send, ^w
    sleep, 400
    send, {left}
    sleep, 200
    send, {left}
    sleep, 200
    send, {left}
    sleep, 200
    send, !{Enter}

    send, Não
    send, {Tab}

    sleep, 200
    send, ^v
    sleep, 200
    send, {Down}
    sleep, 200
    send, {right}
    sleep, 200
    send, {right}
    sleep, 200
    send, !{Enter}
Return

F3::

    send, {Right}
    sleep, 200
    send, {Up}
    sleep, 200
    send, {Delete}
    sleep, 200
    send, {Left}
    sleep, 200
    send, {Delete}
Return