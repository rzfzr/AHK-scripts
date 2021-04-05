#SingleInstance force

>!2::
    Reload
Return
>!1::
    
    Send Clicnet Desenvolvimento
    f()
    Send Rafael Goncalves
    page()
    Send clicnet.com.br@gmail.com
    page()
    
    Send 2
    page()
    f()
    
    Send {Space};contract
    
    Send 22229876111
    f()
    Send Razao social
    f()
    Send 12360000
    f()
    Send nome da rua
    f()
    Send 999
    f()
    Send complemento
    f()
    Send bairro sao
    f()
    f()
    Send paran
    Send {enter}
    f()
    f()
    Send band
    Send {enter}
    f()
    Send 43111151625
    
    
    page()
    
    send 541111100000007
    f() 
    send Rafael Cartao Nome
    f()
    send 0121
    f()
    send 123
    
    page()
    
Return

page(jump:=1){
    Send {tab 2}
    Send {Space}
    sleep, 400
    ; jump = numero de tabs depois de mudar a pagina, padrao 1
    ; Loop, %jump%
    ; {
    ; Send {tab}
    ; Sleep, 15
    ; }
}
f(){
    Send {tab}
    Sleep, 6
    
}

~^s:: ;ao salvar este arquivo ele recarrega
WinGetActiveTitle, Title
WinWaitActive, % RegExReplace(Title, "\*", "-")
Reload
Return