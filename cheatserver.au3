Func scpflymod()
    $priveflyspeedinputed = GUICtrlRead($priveflyspeedinput)
    If $scpriveflymodon = 0 Then
        $scpriveflymodon = 1
        GUICtrlSetState($priveflymodon, $gui_checked)
        _memorywrite($playerbase + $playerstate, $wowprocess, 129, "dword")
        _memorywrite($playerbase + $flyspeed, $wowprocess, $priveflyspeedinputed, "float")
    Else
        $scpriveflymodon = 0
        GUICtrlSetState($priveflymodon, $gui_unchecked)
        _memorywrite($playerbase + $playerstate, $wowprocess, 128, "dword")
        _memorywrite($playerbase + $flyspeed, $wowprocess, 7, "float")
    EndIf
EndFunc

Func scpfreezez()
    If $scprivefreezezon = 0 Then
        $scprivefreezezon = 1
        GUICtrlSetState($privefreezezon, $gui_checked)
        _memorywrite($playerbase + $playerstate2, $wowprocess, -2147482624, "ptr")
    Else
        $scprivefreezezon = 0
        GUICtrlSetState($privefreezezon, $gui_unchecked)
        _memorywrite($playerbase + $playerstate2, $wowprocess, -2147483648, "ptr")
    EndIf
EndFunc

Func scpspeed()
    $privespeedinputed = GUICtrlRead($privespeedinput)
    If $scprivespeedon = 0 Then
        $scprivespeedon = 1
        GUICtrlSetState($privespeedon, $gui_checked)
        _memorywrite($playerbase + $speed, $wowprocess, $privespeedinputed, "float")
        _memorywrite($playerbase + $speedswim, $wowprocess, $privespeedinputed, "float")
    Else
        $scprivespeedon = 0
        GUICtrlSetState($privespeedon, $gui_unchecked)
        _memorywrite($playerbase + $speed, $wowprocess, 7, "float")
        _memorywrite($playerbase + $speedswim, $wowprocess, 4.7, "float")
    EndIf
EndFunc

Func scpspeedglobale()
    If GUICtrlRead($privespeedon) = $gui_unchecked Then
        GUICtrlSetState($privespeedon, $gui_checked)
    ElseIf GUICtrlRead($privespeedon) = $gui_checked Then
        GUICtrlSetState($privespeedon, $gui_unchecked)
    EndIf
EndFunc

Func scpwallclimb()
    If $scprivewallclimbon = 0 Then
        $scprivewallclimbon = 1
        GUICtrlSetState($privewallclimbon, $gui_checked)
        GUICtrlSetState($wallclimbon, $gui_checked)
        _memorywrite($playerbase + $wallclimb, $wowprocess, 255, "float")
    Else
        $scprivewallclimbon = 0
        GUICtrlSetState($privewallclimbon, $gui_unchecked)
        GUICtrlSetState($wallclimbon, $gui_unchecked)
        _memorywrite($playerbase + $wallclimb, $wowprocess, 1, "float")
    EndIf
EndFunc

Func scpclicktp()
    If WinActive("World of Warcraft") Then
        If $scpriveclicktpon = 0 Then
            $scpriveclicktpon = 1
            GUICtrlSetState($priveclicktp, $gui_checked)
            If _ispressed(2) AND $scpriveclicktpon = 0 Then
                $playerstateorg = _memoryread($playerbase + $playerstate2, $wowprocess, "ptr")
                _memorywrite($playerbase + $playerstate2, $wowprocess, ($playerstateorg + 2048), "ptr")
                Sleep(245)
                _memorywrite($playerbase + $posx, $wowprocess, _memoryread($clicktpx, $wowprocess, "float"), "float")
                _memorywrite($playerbase + $posy, $wowprocess, _memoryread($clicktpy, $wowprocess, "float"), "float")
                _memorywrite($playerbase + $posz, $wowprocess, _memoryread($clicktpz, $wowprocess, "float"), "float")
                Sleep(245)
                _memorywrite($playerbase + $playerstate2, $wowprocess, $playerstateorg, "ptr")
                _memorywrite($playerbase + $playerstate2, $wowprocess, ($playerstateorg + 1024), "ptr")
                _memorywrite($playerbase + $playerstate2, $wowprocess, $playerstateorg, "ptr")
            EndIf
        Else
            $scpriveclicktpon = 0
            GUICtrlSetState($priveclicktp, $gui_unchecked)
        EndIf
    EndIf
EndFunc

Func scpsupersaut()
    If $scprivesupersauton = 0 Then
        $scprivesupersauton = 1
        GUICtrlSetState($privesupersauton, $gui_checked)
        GUICtrlSetState($supersauton, $gui_checked)
        If _ispressed(20) Then
            $privesupersautinputed = GUICtrlRead($privesupersautinput) * (-1)
            _memorywrite($playerbase + $hauteursaut, $wowprocess, $privesupersautinputed, "float")
        EndIf
    ElseIf $scprivesupersauton = 1 Then
        $scprivesupersauton = 0
        GUICtrlSetState($privesupersauton, $gui_unchecked)
        GUICtrlSetState($supersauton, $gui_unchecked)
    EndIf
EndFunc

Func scpspeedspeedn()
    GUICtrlSetData($privespeedinput, 7)
    GUICtrlSetData($privespeedglobaleinput, 7)
    _memorywrite($playerbase + $speed, $wowprocess, 7, "float")
    _memorywrite($playerbase + $speedswim, $wowprocess, 4.7, "float")
EndFunc

Func scpspeedspeed100()
    GUICtrlSetData($privespeedinput, 14)
    GUICtrlSetData($privespeedglobaleinput, 14)
EndFunc

Func scpspeedspeedcustom()
    $privespeedcustominputed = GUICtrlRead($privesettinginputspeedcustominput)
    GUICtrlSetData($privespeedinput, $privespeedcustominputed)
    GUICtrlSetData($privespeedglobaleinput, $privespeedcustominputed)
EndFunc

Func scpspeedspeedp()
    $privespeedinputed = GUICtrlRead($privespeedinput)
    $priveincrement = GUICtrlRead($privesettinginputspeedincr)
    GUICtrlSetData($privespeedinput, $privespeedinputed + $priveincrement)
    GUICtrlSetData($privespeedglobaleinput, $privespeedinputed + $priveincrement)
EndFunc

Func scpspeedspeedm()
    $privespeedinputed = GUICtrlRead($privespeedinput)
    $priveincrement = GUICtrlRead($privesettinginputspeedincr)
    GUICtrlSetData($privespeedinput, $privespeedinputed - $priveincrement)
    GUICtrlSetData($privespeedglobaleinput, $privespeedinputed - $priveincrement)
EndFunc

Func scpspeedspeedflyn()
    GUICtrlSetData($priveflyspeedinput, 7)
EndFunc

Func scpspeedspeedfly280()
    GUICtrlSetData($priveflyspeedinput, 26.6)
EndFunc

Func scpspeedspeedflycustom()
    $privespeedflycustominputed = GUICtrlRead($privesettinginputspeedflycustominput)
    GUICtrlSetData($priveflyspeedinput, $privespeedflycustominputed)
EndFunc

Func scpspeedspeedflyp()
    $privespeedflyinputed = GUICtrlRead($priveflyspeedinput)
    $priveincrement = GUICtrlRead($privesettinginputspeedflyincr)
    GUICtrlSetData($priveflyspeedinput, $privespeedflyinputed + $priveincrement)
EndFunc

Func scpspeedspeedflym()
    $privespeedflyinputed = GUICtrlRead($priveflyspeedinput)
    $priveincrement = GUICtrlRead($privesettinginputspeedflyincr)
    GUICtrlSetData($priveflyspeedinput, $privespeedflyinputed - $priveincrement)
EndFunc

Func scpspeedsupersautp()
    $privesupersautinputed = GUICtrlRead($privesupersautinput)
    $priveincrement = GUICtrlRead($privesettinginputsupersautincr)
    GUICtrlSetData($privesupersautinput, $privesupersautinputed + $priveincrement)
    GUICtrlSetData($supersautinput, $privesupersautinputed + $priveincrement)
EndFunc

Func scpspeedsupersautm()
    $privesupersautinputed = GUICtrlRead($privesupersautinput)
    $priveincrement = GUICtrlRead($privesettinginputsupersautincr)
    GUICtrlSetData($privesupersautinput, $privesupersautinputed - $priveincrement)
    GUICtrlSetData($supersautinput, $privesupersautinputed - $priveincrement)
EndFunc

Func scpspeedtimespeedp()
    $vitessetempsinputed = GUICtrlRead($vitessetempsinput)
    $priveincrement = GUICtrlRead($privesettinginputtimespeedincr)
    GUICtrlSetData($vitessetempsinput, $vitessetempsinputed + $priveincrement)
    settimespeed()
EndFunc

Func scpspeedtimespeedm()
    $vitessetempsinputed = GUICtrlRead($vitessetempsinput)
    $priveincrement = GUICtrlRead($privesettinginputtimespeedincr)
    GUICtrlSetData($vitessetempsinput, $vitessetempsinputed - $priveincrement)
    settimespeed()
EndFunc

Func scpspeedtaillep()
    $priveincrement = GUICtrlRead($privesettinginputtailleincr)
    $playerscalevar = _memoryread($playerbase + $playerscale, $wowprocess, "float")
    $playernewtaille = $playerscalevar * $priveincrement
    _memorywrite(($playerbase + $playerscale), $wowprocess, $playernewtaille, "float")
    GUICtrlSetData($playerscaleinput, Round($playernewtaille, 5))
    $playerhauteurvar = _memoryread($playerbase + $playerhauteur, $wowprocess, "float")
    $playernewtaille = $playerhauteurvar * $priveincrement
    _memorywrite(($playerbase + $playerhauteur), $wowprocess, $playernewtaille, "float")
    GUICtrlSetData($playerhauteurinput, Round($playernewtaille, 5))
    $playerlargeurvar = _memoryread($playerbase + $playerlargeur, $wowprocess, "float")
    $playernewtaille = $playerlargeurvar * $priveincrement
    _memorywrite(($playerbase + $playerlargeur), $wowprocess, $playernewtaille, "float")
    GUICtrlSetData($playerlargeurinput, Round($playernewtaille, 5))
EndFunc

Func scpspeedtaillem()
    $priveincrement = GUICtrlRead($privesettinginputtailleincr)
    $playerscalevar = _memoryread($playerbase + $playerscale, $wowprocess, "float")
    $playernewtaille = $playerscalevar / $priveincrement
    _memorywrite(($playerbase + $playerscale), $wowprocess, $playernewtaille, "float")
    GUICtrlSetData($playerscaleinput, Round($playernewtaille, 5))
    $playerhauteurvar = _memoryread($playerbase + $playerhauteur, $wowprocess, "float")
    $playernewtaille = $playerhauteurvar / $priveincrement
    _memorywrite(($playerbase + $playerhauteur), $wowprocess, $playernewtaille, "float")
    GUICtrlSetData($playerhauteurinput, Round($playernewtaille, 5))
    $playerlargeurvar = _memoryread($playerbase + $playerlargeur, $wowprocess, "float")
    $playernewtaille = $playerlargeurvar / $priveincrement
    _memorywrite(($playerbase + $playerlargeur), $wowprocess, $playernewtaille, "float")
    GUICtrlSetData($playerlargeurinput, Round($playernewtaille, 5))
EndFunc

Func tp()
    If WinActive("World of Warcraft") Then
        If GUICtrlRead($tpmanu) = $gui_checked AND GUICtrlRead($tpauto) = $gui_unchecked Then
            If _ispressed(68, $dll) Then
                For $x = 0 To 10
                    $position = _memoryread($playerbase + $posx, $wowprocess, "float")
                    $newposition = $position + 0.13
                    _memorywrite($playerbase + $posx, $wowprocess, $newposition, "float")
                    Send("{left}{left}{right}{right}")
                    Sleep(60)
                    $x = $x + 1
                Next
            EndIf
            If _ispressed(65, $dll) Then
                For $x = 0 To 10
                    $position = _memoryread($playerbase + $posx, $wowprocess, "float")
                    $newposition = $position - 0.13
                    _memorywrite($playerbase + $posx, $wowprocess, $newposition, "float")
                    Send("{left}{left}{right}{right}")
                    Sleep(60)
                    $x = $x + 1
                Next
            EndIf
            If _ispressed(64, $dll) Then
                For $x = 0 To 10
                    $position = _memoryread($playerbase + $posy, $wowprocess, "float")
                    $newposition = $position + 0.13
                    _memorywrite($playerbase + $posy, $wowprocess, $newposition, "float")
                    Send("{left}{left}{right}{right}")
                    Sleep(60)
                    $x = $x + 1
                Next
            EndIf
            If _ispressed(66, $dll) Then
                For $x = 0 To 10
                    $position = _memoryread($playerbase + $posy, $wowprocess, "float")
                    $newposition = $position - 0.13
                    _memorywrite($playerbase + $posy, $wowprocess, $newposition, "float")
                    Send("{left}{left}{right}{right}")
                    Sleep(60)
                    $x = $x + 1
                Next
            EndIf
            If _ispressed(67, $dll) Then
                For $x = 0 To 10
                    $position = _memoryread($playerbase + $posz, $wowprocess, "float")
                    $newposition = $position + 0.13
                    _memorywrite($playerbase + $posz, $wowprocess, $newposition, "float")
                    Send("{left}{left}{right}{right}")
                    Sleep(60)
                    $x = $x + 1
                Next
            EndIf
            If _ispressed(69, $dll) Then
                For $x = 0 To 10
                    $position = _memoryread($playerbase + $posz, $wowprocess, "float")
                    $newposition = $position - 0.13
                    _memorywrite($playerbase + $posz, $wowprocess, $newposition, "float")
                    Send("{left}{left}{right}{right}")
                    Sleep(60)
                    $x = $x + 1
                Next
            EndIf
        EndIf
        If GUICtrlRead($tpmanu) = $gui_unchecked AND GUICtrlRead($tpauto) = $gui_checked Then
            If _ispressed(68, $dll) Then
                Do
                    $position = _memoryread($playerbase + $posx, $wowprocess, "float")
                    $newposition = $position + 0.13
                    _memorywrite($playerbase + $posx, $wowprocess, $newposition, "float")
                    Send("{left}{left}{right}{right}")
                    Sleep(60)
                Until _ispressed(61, $dll)
            EndIf
            If _ispressed(65, $dll) Then
                Do
                    $position = _memoryread($playerbase + $posx, $wowprocess, "float")
                    $newposition = $position - 0.13
                    _memorywrite($playerbase + $posx, $wowprocess, $newposition, "float")
                    Send("{left}{left}{right}{right}")
                    Sleep(60)
                Until _ispressed(61, $dll)
            EndIf
            If _ispressed(64, $dll) Then
                Do
                    $position = _memoryread($playerbase + $posy, $wowprocess, "float")
                    $newposition = $position + 0.13
                    _memorywrite($playerbase + $posy, $wowprocess, $newposition, "float")
                    Send("{left}{left}{right}{right}")
                    Sleep(60)
                Until _ispressed(61, $dll)
            EndIf
            If _ispressed(66, $dll) Then
                Do
                    $position = _memoryread($playerbase + $posy, $wowprocess, "float")
                    $newposition = $position - 0.13
                    _memorywrite($playerbase + $posy, $wowprocess, $newposition, "float")
                    Send("{left}{left}{right}{right}")
                    Sleep(60)
                Until _ispressed(61, $dll)
            EndIf
            If _ispressed(67, $dll) Then
                Do
                    $position = _memoryread($playerbase + $posz, $wowprocess, "float")
                    $newposition = $position + 0.13
                    _memorywrite($playerbase + $posz, $wowprocess, $newposition, "float")
                    Send("{left}{left}{right}{right}")
                    Sleep(60)
                Until _ispressed(61, $dll)
            EndIf
            If _ispressed(69, $dll) Then
                Do
                    $position = _memoryread($playerbase + $posz, $wowprocess, "float")
                    $newposition = $position - 0.13
                    _memorywrite($playerbase + $posz, $wowprocess, $newposition, "float")
                    Send("{left}{left}{right}{right}")
                    Sleep(60)
                Until _ispressed(61, $dll)
            EndIf
        EndIf
    EndIf
EndFunc

Func sconoclipaction()
    If WinActive("World of Warcraft") Then
        If GUICtrlRead($noclipactionon) = $gui_checked Then
            $locationx = _memoryread($playerbase + $posx, $wowprocess, "float")
            $locationy = _memoryread($playerbase + $posy, $wowprocess, "float")
            $locationr = _memoryread($playerbase + $posr, $wowprocess, "float")
            $newlocationx = $locationx + 0.13 * Cos($locationr)
            $newlocationy = $locationy + 0.13 * Sin($locationr)
            _memorywrite($playerbase + $posx, $wowprocess, $newlocationx, "float")
            _memorywrite($playerbase + $posy, $wowprocess, $newlocationy, "float")
            Send("{left}{left}{right}{right}")
            $x = $x + 1
        EndIf
    EndIf
EndFunc

Func privexyz()
    If WinActive("World of Warcraft") Then
        If _ispressed(68, $dll) Then
            $privexyzspeed = GUICtrlRead(Abs($privexyzspeedinput))
            $locationx = _memoryread($playerbase + $posx, $wowprocess, "float")
            $locationy = _memoryread($playerbase + $posy, $wowprocess, "float")
            $locationr = _memoryread($playerbase + $posr, $wowprocess, "float")
            $newlocationx = $locationx + $privexyzspeed * Cos($locationr)
            $newlocationy = $locationy + $privexyzspeed * Sin($locationr)
            _memorywrite($playerbase + $posx, $wowprocess, $newlocationx, "float")
            _memorywrite($playerbase + $posy, $wowprocess, $newlocationy, "float")
        EndIf
        If _ispressed(65, $dll) Then
            $privexyzspeed = GUICtrlRead(Abs($privexyzspeedinput))
            $locationx = _memoryread($playerbase + $posx, $wowprocess, "float")
            $locationy = _memoryread($playerbase + $posy, $wowprocess, "float")
            $locationr = _memoryread($playerbase + $posr, $wowprocess, "float")
            $newlocationx = $locationx - $privexyzspeed * Cos($locationr)
            $newlocationy = $locationy - $privexyzspeed * Sin($locationr)
            _memorywrite($playerbase + $posx, $wowprocess, $newlocationx, "float")
            _memorywrite($playerbase + $posy, $wowprocess, $newlocationy, "float")
        EndIf
        If _ispressed(66, $dll) Then
            $privexyzspeed = GUICtrlRead(Abs($privexyzspeedinput))
            $locationx = _memoryread($playerbase + $posx, $wowprocess, "float")
            $locationy = _memoryread($playerbase + $posy, $wowprocess, "float")
            $locationr = _memoryread($playerbase + $posr, $wowprocess, "float")
            $newlocationx = $locationx - $privexyzspeed * Cos($locationr + ($pi / 2))
            $newlocationy = $locationy - $privexyzspeed * Sin($locationr + ($pi / 2))
            _memorywrite($playerbase + $posx, $wowprocess, $newlocationx, "float")
            _memorywrite($playerbase + $posy, $wowprocess, $newlocationy, "float")
        EndIf
        If _ispressed(64, $dll) Then
            $privexyzspeed = GUICtrlRead(Abs($privexyzspeedinput))
            $locationx = _memoryread($playerbase + $posx, $wowprocess, "float")
            $locationy = _memoryread($playerbase + $posy, $wowprocess, "float")
            $locationr = _memoryread($playerbase + $posr, $wowprocess, "float")
            $newlocationx = $locationx - $privexyzspeed * Cos($locationr - ($pi / 2))
            $newlocationy = $locationy - $privexyzspeed * Sin($locationr - ($pi / 2))
            _memorywrite($playerbase + $posx, $wowprocess, $newlocationx, "float")
            _memorywrite($playerbase + $posy, $wowprocess, $newlocationy, "float")
        EndIf
        If _ispressed(67, $dll) Then
            $privexyzspeed = GUICtrlRead(Abs($privexyzspeedinput))
            $position = _memoryread($playerbase + $posz, $wowprocess, "float")
            $newposition = $position + $privexyzspeed
            _memorywrite($playerbase + $posz, $wowprocess, $newposition, "float")
        EndIf
        If _ispressed(69, $dll) Then
            $privexyzspeed = GUICtrlRead(Abs($privexyzspeedinput))
            $position = _memoryread($playerbase + $posz, $wowprocess, "float")
            $newposition = $position - $privexyzspeed
            _memorywrite($playerbase + $posz, $wowprocess, $newposition, "float")
        EndIf
    EndIf
EndFunc

Func priveteleportcamera()
    If _memoryread($posxcamera, $wowprocess, "float") <> 0 Then
        If IniRead($setting, "Options", "Msgbox", "Erreur") = 1 Then
            $msgboxtpcamera = MsgBox(4, "Warning", "This function si for Private server only." & @CRLF & " " & @CRLF & "If you are playing on live server, click on No." & @CRLF & "If you are playing on private server, you can click Yes to continue.")
            If $msgboxtpcamera = 6 Then
                IniWrite($setting, "Options", "Msgbox", 0)
                MsgBox(0, "Warning", "These messages won't be displayed anymore.")
                $camposx = _memoryread($posxcamera, $wowprocess, "Float")
                $camposy = _memoryread($posxcamera + 4, $wowprocess, "Float")
                $camposz = _memoryread($posxcamera + 8, $wowprocess, "Float")
                _memorywrite($playerbase + $posx, $wowprocess, $camposx, "Float")
                _memorywrite($playerbase + $posy, $wowprocess, $camposy, "Float")
                _memorywrite($playerbase + $posz, $wowprocess, $camposz, "Float")
            ElseIf $msgboxtpcamera = 7 Then
            EndIf
        Else
            $camposx = _memoryread($posxcamera, $wowprocess, "Float")
            $camposy = _memoryread($posxcamera + 4, $wowprocess, "Float")
            $camposz = _memoryread($posxcamera + 8, $wowprocess, "Float")
            _memorywrite($playerbase + $posx, $wowprocess, $camposx, "Float")
            _memorywrite($playerbase + $posy, $wowprocess, $camposy, "Float")
            _memorywrite($playerbase + $posz, $wowprocess, $camposz, "Float")
        EndIf
    EndIf
EndFunc

Func copytp()
    GUICtrlSetData($privexinputtp, Round((_memoryread($playerbase + $posx, $wowprocess, "float")), 3))
    GUICtrlSetData($priveyinputtp, Round((_memoryread($playerbase + $posy, $wowprocess, "float")), 3))
    GUICtrlSetData($privezinputtp, Round((_memoryread($playerbase + $posz, $wowprocess, "float")), 3))
EndFunc

Func gotp()
    _memorywrite($playerbase + $posx, $wowprocess, GUICtrlRead($privexinputtp), "float")
    _memorywrite($playerbase + $posy, $wowprocess, GUICtrlRead($priveyinputtp), "float")
    _memorywrite($playerbase + $posz, $wowprocess, GUICtrlRead($privezinputtp), "float")
EndFunc

Func gocorps()
    If _memoryread($corps, $wowprocess, "float") <> 0 Then
        $corpsx = _memoryread($corps, $wowprocess, "float")
        $corpsy = _memoryread($corps + 4, $wowprocess, "float")
        $corpsz = _memoryread($corps + 8, $wowprocess, "float")
        _memorywrite($playerbase + $posx, $wowprocess, $corpsx, "float")
        _memorywrite($playerbase + $posy, $wowprocess, $corpsy, "float")
        _memorywrite($playerbase + $posz, $wowprocess, $corpsz, "float")
    EndIf
EndFunc

Func clicktp()
    If WinActive("World of Warcraft") Then
        If _ispressed(IniRead($setting, "Raccourcis - Prive", "Clicktptouche", "Erreur"), $dll) AND _ispressed(2, $dll) Then
            $playerstateorg = _memoryread($playerbase + $playerstate2, $wowprocess, "ptr")
            _memorywrite($playerbase + $playerstate2, $wowprocess, ($playerstateorg + 2048), "ptr")
            Sleep(245)
            If _memoryread($clicktpx, $wowprocess, "float") = 0 Then
                _memorywrite($playerbase + $playerstate2, $wowprocess, $playerstateorg, "ptr")
                Send("{DOWN}")
            Else
                _memorywrite($playerbase + $posx, $wowprocess, _memoryread($clicktpx, $wowprocess, "float"), "float")
                _memorywrite($playerbase + $posy, $wowprocess, _memoryread($clicktpy, $wowprocess, "float"), "float")
                _memorywrite($playerbase + $posz, $wowprocess, _memoryread($clicktpz, $wowprocess, "float"), "float")
                Sleep(245)
                _memorywrite($playerbase + $playerstate2, $wowprocess, $playerstateorg, "ptr")
                _memorywrite($playerbase + $playerstate2, $wowprocess, ($playerstateorg + 1024), "ptr")
                _memorywrite($playerbase + $playerstate2, $wowprocess, $playerstateorg, "ptr")
                Sleep(500)
            EndIf
        EndIf
    EndIf
EndFunc

Func nocooldown()
    cooldowns(0, 300)
EndFunc

Func cooldowns($spell, $spellcd)
    $cd = $basecd
    $nr = 0
    $nextcd = _memoryread($cd + 8, $wowprocess, "ptr")
    While ($nextcd <> 0) AND (BitAND($nextcd, 1) = 0)
        $nr = $nr + 1
        $cd = $nextcd
        $nextcd = _memoryread($cd + 4, $wowprocess, "ptr")
        $ecd = _memoryread($cd + 4, $wowprocess, "int")
        $id = _memoryread($cd + 8, $wowprocess, "int")
        $starttime = _memoryread($cd + 16, $wowprocess, "uint")
        Local $pf = DllStructCreate("ulong")
        DllCall("kernel32.dll", "none", "QueryPerformanceFrequency", "ptr", DllStructGetPtr($pf))
        Local $pc = DllStructCreate("int64")
        DllCall("kernel32.dll", "none", "QueryPerformanceCounter", "ptr", DllStructGetPtr($pc))
        $ts = (DllStructGetData($pc, 1) / DllStructGetData($pf, 1)) * 1000
        $mycd = _memoryread($cd + 16, $wowprocess, "int")
        If ($ts - $starttime < $spellcd) Then
            _memorywritegcd($cd + 16, $wowprocess, "uint", $starttime - 1500)
            Return 1
        EndIf
    WEnd
    Return 0
EndFunc

Func privetpcibledos()
    $targetguid = _memoryread($targetguidstatic, $wowprocess, "uint64")
    If $targetguid = 0 Then Return
    $adr = getguid($targetguid)
    $targetx = _memoryread($adr + $posx, $wowprocess, "float")
    $targety = _memoryread($adr + $posy, $wowprocess, "float")
    $targetz = _memoryread($adr + $posz, $wowprocess, "float")
    $targetr = _memoryread($adr + $posr, $wowprocess, "float")
    _memorywrite($playerbase + $posx, $wowprocess, $targetx - (3 * Cos($targetr)), "float")
    _memorywrite($playerbase + $posy, $wowprocess, $targety - (3 * Sin($targetr)), "float")
    _memorywrite($playerbase + $posz, $wowprocess, $targetz + 1.5, "float")
    _memorywrite($playerbase + $posr, $wowprocess, $targetr, "float")
    Sleep(150)
    ControlSend("World of Warcraft", "", "", "{S}")
EndFunc

Func privetpcibleundermap()
    $targetguid = _memoryread($targetguidstatic, $wowprocess, "uint64")
    If $targetguid = 0 Then Return
    $adr = getguid($targetguid)
    $targetx = _memoryread($adr + $posx, $wowprocess, "float")
    $targety = _memoryread($adr + $posy, $wowprocess, "float")
    $targetz = _memoryread($adr + $posz, $wowprocess, "float")
    $targetr = _memoryread($adr + $posr, $wowprocess, "float")
    _memorywrite($playerbase + $posx, $wowprocess, $targetx - (8 * Cos($targetr)), "float")
    _memorywrite($playerbase + $posy, $wowprocess, $targety - (8 * Sin($targetr)), "float")
    _memorywrite($playerbase + $posz, $wowprocess, $targetz - 5, "float")
    _memorywrite($playerbase + $posr, $wowprocess, $targetr, "float")
    Sleep(150)
    ControlSend("World of Warcraft", "", "", "{Q}{D}")
EndFunc

Func getguid($currenttargetguid)
    $clientconnection = _memoryread($staticclientconnection, $wowprocess, "dword")
    $curlistmgr = _memoryread($clientconnection + $mgroffset, $wowprocess, "dword")
    $firstobject = _memoryread($curlistmgr + $ofs_first_obj, $wowprocess, "dword")
    $curobject = $firstobject
    $type = _memoryread($curobject + $ofs_obj_type, $wowprocess, "dword")
    While $type < 8 AND $type > 0
        $guidobj = _memoryread($curobject + $ofs_obj_guid, $wowprocess, "int64")
        If $guidobj = $currenttargetguid Then
            $currenttargetguidadr = $curobject
            Return $currenttargetguidadr
            ExitLoop
        EndIf
        $curobject = _memoryread($curobject + $ofs_next_obj, $wowprocess, "dword")
        $type = _memoryread($curobject + $ofs_obj_type, $wowprocess, "dword")
    WEnd
    $currenttargetguid = ""
EndFunc

Func speed()
    If GUICtrlRead($privespeedon) = $gui_unchecked Then
        GUICtrlSetState($privespeedglobaleon, $gui_enable)
        GUICtrlSetState($privespeedglobaleinput, $gui_enable)
        _memorywrite($playerbase + $speed, $wowprocess, 7, "float")
        _memorywrite($playerbase + $speedswim, $wowprocess, 4.7, "float")
    EndIf
EndFunc

Func collisionm2()
    If GUICtrlRead($privecollisionsm2) = $gui_unchecked Then
        _memorywrite($collisionm2s, $wowprocess, 1166743412, "Ptr")
        _memorywrite($collisionm2c, $wowprocess, 23233551, "Ptr")
    EndIf
EndFunc

Func collisionwmo()
    If GUICtrlRead($privecollisionswmo) = $gui_unchecked Then
        _memorywrite($collisionwmo, $wowprocess, -1070463371, "Ptr")
    EndIf
EndFunc

Func collisionall()
    If GUICtrlRead($privecollisionsall) = $gui_unchecked Then
        GUICtrlSetState($privecollisionswmo, $gui_enable)
        GUICtrlSetState($privecollisionswmo, $gui_unchecked)
        GUICtrlSetState($privecollisionsm2, $gui_enable)
        GUICtrlSetState($privecollisionsm2, $gui_unchecked)
        _memorywrite($collisionm2s, $wowprocess, 1166743412, "Ptr")
        _memorywrite($collisionm2c, $wowprocess, 23233551, "Ptr")
        _memorywrite($collisionwmo, $wowprocess, -1070463371, "Ptr")
    EndIf
EndFunc

Func flymod()
    If GUICtrlRead($priveflymodon) = $gui_unchecked Then
        _memorywrite($playerbase + $playerstate, $wowprocess, 128, "dword")
    EndIf
EndFunc

Func privefreezez()
    If GUICtrlRead($privefreezezon) = $gui_unchecked Then
        _memorywrite($playerbase + $playerstate2, $wowprocess, -2147483648, "ptr")
    EndIf
EndFunc

Func privewaterwalk()
    If GUICtrlRead($privewaterwalkon) = $gui_unchecked Then
        _memorywrite($playerbase + $playerstate, $wowprocess, 128, "dword")
    EndIf
EndFunc

Func privemount()
    If GUICtrlRead($privemounton) = $gui_unchecked Then
        $mount1value = _memoryread($mount1, $wowprocess, "ptr")
        $mount2value = _memoryread($mount2, $wowprocess, "ptr")
        _memorywrite($mount1, $wowprocess, $mount1value - 119, "Ptr")
        _memorywrite($mount2, $wowprocess, $mount2value - 119, "Ptr")
    EndIf
EndFunc

Func privemultijump()
    If GUICtrlRead($priveinfinitejumpon) = $gui_unchecked Then
        _memorywrite($infinitejumppatch, $wowprocess, -1223736203, "Ptr")
    EndIf
EndFunc

Func privenoclip1()
    If GUICtrlRead($privenoclip1on) = $gui_unchecked Then
        _memorywrite($collisionm2s, $wowprocess, 1166743412, "Ptr")
        _memorywrite($collisionm2c, $wowprocess, 23233551, "Ptr")
        _memorywrite($collisionwmo, $wowprocess, -1070463371, "Ptr")
    EndIf
EndFunc

Func privenoclip()
    If GUICtrlRead($privenoclipon) = $gui_checked Then
        _memorywrite(($playerbase + $playerlargeur), $wowprocess, 0, "float")
    Else
        _memorywrite(($playerbase + $playerlargeur), $wowprocess, $playerlargeurreset, "float")
    EndIf
EndFunc

Func debloperso()
    $playerstateorg = _memoryread($playerbase + $playerstate2, $wowprocess, "ptr")
    If $playerstateorg = -2147481600 Then
        _memorywrite($playerbase + $playerstate2, $wowprocess, ($playerstateorg - 2048), "ptr")
    ElseIf $playerstateorg = -2147480576 Then
        _memorywrite($playerbase + $playerstate2, $wowprocess, ($playerstateorg - 2048), "ptr")
    ElseIf $playerstateorg = -2130704384 Then
        _memorywrite($playerbase + $playerstate2, $wowprocess, ($playerstateorg - 2048), "ptr")
    ElseIf $playerstateorg = -1879046144 Then
        _memorywrite($playerbase + $playerstate2, $wowprocess, ($playerstateorg - 2048), "ptr")
    ElseIf $playerstateorg = -1879045120 Then
        _memorywrite($playerbase + $playerstate2, $wowprocess, ($playerstateorg - 2048), "ptr")
    ElseIf $playerstateorg = -1862268928 Then
        _memorywrite($playerbase + $playerstate2, $wowprocess, ($playerstateorg - 2048), "ptr")
    ElseIf $playerstateorg = 2048 Then
        _memorywrite($playerbase + $playerstate2, $wowprocess, ($playerstateorg - 2048), "ptr")
    ElseIf $playerstateorg = 3072 Then
        _memorywrite($playerbase + $playerstate2, $wowprocess, ($playerstateorg - 2048), "ptr")
    ElseIf $playerstateorg = 16779264 Then
        _memorywrite($playerbase + $playerstate2, $wowprocess, ($playerstateorg - 2048), "ptr")
    Else
    EndIf
EndFunc

Func privestopfall()
    _memorywrite($playerbase + $playerstate2, $wowprocess, -2147482624, "ptr")
    _memorywrite($playerbase + $playerstate2, $wowprocess, -2147483648, "ptr")
    Send("{Space}")
    Sleep(25)
    _memorywrite($playerbase + $playerstate2, $wowprocess, -2147482624, "ptr")
    _memorywrite($playerbase + $playerstate2, $wowprocess, -2147483648, "ptr")
EndFunc

Func privesupersaut()
    If _ispressed(20) Then
        $privesupersautinputedbrut = GUICtrlRead($privesupersautinput)
        $privesupersautinputed = Abs($privesupersautinputedbrut) * (-1)
        _memorywrite($playerbase + $hauteursaut, $wowprocess, $privesupersautinputed, "float")
    EndIf
EndFunc

Func privetrackherbes()
    If GUICtrlRead($privetrackherbes) = $gui_checked Then
        $trackvalue = _memoryread($playerbase2 + $ressources, $wowprocess, "dword")
        _memorywrite($playerbase2 + $ressources, $wowprocess, ($trackvalue + 2), "dword")
    Else
        $trackvalue = _memoryread($playerbase2 + $ressources, $wowprocess, "dword")
        _memorywrite($playerbase2 + $ressources, $wowprocess, ($trackvalue - 2), "dword")
    EndIf
EndFunc

Func privetrackfilons()
    If GUICtrlRead($privetrackfilons) = $gui_checked Then
        $trackvalue = _memoryread($playerbase2 + $ressources, $wowprocess, "dword")
        _memorywrite($playerbase2 + $ressources, $wowprocess, ($trackvalue + 4), "dword")
    Else
        $trackvalue = _memoryread($playerbase2 + $ressources, $wowprocess, "dword")
        _memorywrite($playerbase2 + $ressources, $wowprocess, ($trackvalue - 4), "dword")
    EndIf
EndFunc

Func privetrackcoffres()
    If GUICtrlRead($privetrackcoffres) = $gui_checked Then
        $trackvaluer = _memoryread($playerbase2 + $ressources, $wowprocess, "dword")
        _memorywrite($playerbase2 + $ressources, $wowprocess, ($trackvaluer + 32), "dword")
    Else
        $trackvaluer = _memoryread($playerbase2 + $ressources, $wowprocess, "dword")
        _memorywrite($playerbase2 + $ressources, $wowprocess, ($trackvaluer - 32), "dword")
    EndIf
EndFunc

Func privetrackpoissons()
    If GUICtrlRead($privetrackpoissons) = $gui_checked Then
        $trackvaluer = _memoryread($playerbase2 + $ressources, $wowprocess, "dword")
        _memorywrite($playerbase2 + $ressources, $wowprocess, ($trackvaluer + 262144), "dword")
    Else
        $trackvaluer = _memoryread($playerbase2 + $ressources, $wowprocess, "dword")
        _memorywrite($playerbase2 + $ressources, $wowprocess, ($trackvaluer - 262144), "dword")
    EndIf
EndFunc

Func privetrackallres()
    If GUICtrlRead($privetrackallres) = $gui_checked Then
        GUICtrlSetState($privetrackherbes, $gui_checked)
        GUICtrlSetState($privetrackfilons, $gui_checked)
        GUICtrlSetState($privetrackcoffres, $gui_checked)
        GUICtrlSetState($privetrackpoissons, $gui_checked)
        _memorywrite($playerbase2 + $ressources, $wowprocess, -1, "dword")
    Else
        GUICtrlSetState($privetrackherbes, $gui_unchecked)
        GUICtrlSetState($privetrackfilons, $gui_unchecked)
        GUICtrlSetState($privetrackcoffres, $gui_unchecked)
        GUICtrlSetState($privetrackpoissons, $gui_unchecked)
        _memorywrite($playerbase2 + $ressources, $wowprocess, 0, "dword")
    EndIf
EndFunc

Func privetrackbetes()
    If GUICtrlRead($privetrackbetes) = $gui_checked Then
        $trackvalueh = _memoryread($playerbase2 + $hunt, $wowprocess, "dword")
        _memorywrite($playerbase2 + $hunt, $wowprocess, ($trackvalueh + 1), "dword")
    Else
        $trackvalueh = _memoryread($playerbase2 + $hunt, $wowprocess, "dword")
        _memorywrite($playerbase2 + $hunt, $wowprocess, ($trackvalueh - 1), "dword")
    EndIf
EndFunc

Func privetrackdragons()
    If GUICtrlRead($privetrackdragons) = $gui_checked Then
        $trackvalueh = _memoryread($playerbase2 + $hunt, $wowprocess, "dword")
        _memorywrite($playerbase2 + $hunt, $wowprocess, ($trackvalueh + 2), "dword")
    Else
        $trackvalueh = _memoryread($playerbase2 + $hunt, $wowprocess, "dword")
        _memorywrite($playerbase2 + $hunt, $wowprocess, ($trackvalueh - 2), "dword")
    EndIf
EndFunc

Func privetrackdemons()
    If GUICtrlRead($privetrackdemons) = $gui_checked Then
        $trackvalueh = _memoryread($playerbase2 + $hunt, $wowprocess, "dword")
        _memorywrite($playerbase2 + $hunt, $wowprocess, ($trackvalueh + 4), "dword")
    Else
        $trackvalueh = _memoryread($playerbase2 + $hunt, $wowprocess, "dword")
        _memorywrite($playerbase2 + $hunt, $wowprocess, ($trackvalueh - 4), "dword")
    EndIf
EndFunc

Func privetrackelementaires()
    If GUICtrlRead($privetrackelementaires) = $gui_checked Then
        $trackvalueh = _memoryread($playerbase2 + $hunt, $wowprocess, "dword")
        _memorywrite($playerbase2 + $hunt, $wowprocess, ($trackvalueh + 8), "dword")
    Else
        $trackvalueh = _memoryread($playerbase2 + $hunt, $wowprocess, "dword")
        _memorywrite($playerbase2 + $hunt, $wowprocess, ($trackvalueh - 8), "dword")
    EndIf
EndFunc

Func privetrackgeants()
    If GUICtrlRead($privetrackgeants) = $gui_checked Then
        $trackvalueh = _memoryread($playerbase2 + $hunt, $wowprocess, "dword")
        _memorywrite($playerbase2 + $hunt, $wowprocess, ($trackvalueh + 16), "dword")
    Else
        $trackvalueh = _memoryread($playerbase2 + $hunt, $wowprocess, "dword")
        _memorywrite($playerbase2 + $hunt, $wowprocess, ($trackvalueh - 16), "dword")
    EndIf
EndFunc

Func privetrackmortsvivants()
    If GUICtrlRead($privetrackmortsvivants) = $gui_checked Then
        $trackvalueh = _memoryread($playerbase2 + $hunt, $wowprocess, "dword")
        _memorywrite($playerbase2 + $hunt, $wowprocess, ($trackvalueh + 32), "dword")
    Else
        $trackvalueh = _memoryread($playerbase2 + $hunt, $wowprocess, "dword")
        _memorywrite($playerbase2 + $hunt, $wowprocess, ($trackvalueh - 32), "dword")
    EndIf
EndFunc

Func privetrackhumanoides()
    If GUICtrlRead($privetrackhumanoides) = $gui_checked Then
        $trackvalueh = _memoryread($playerbase2 + $hunt, $wowprocess, "dword")
        _memorywrite($playerbase2 + $hunt, $wowprocess, ($trackvalueh + 64), "dword")
    Else
        $trackvalueh = _memoryread($playerbase2 + $hunt, $wowprocess, "dword")
        _memorywrite($playerbase2 + $hunt, $wowprocess, ($trackvalueh - 64), "dword")
    EndIf
EndFunc

Func privetrackbestioles()
    If GUICtrlRead($privetrackbestioles) = $gui_checked Then
        $trackvalueh = _memoryread($playerbase2 + $hunt, $wowprocess, "dword")
        _memorywrite($playerbase2 + $hunt, $wowprocess, ($trackvalueh + 128), "dword")
    Else
        $trackvalueh = _memoryread($playerbase2 + $hunt, $wowprocess, "dword")
        _memorywrite($playerbase2 + $hunt, $wowprocess, ($trackvalueh - 128), "dword")
    EndIf
EndFunc

Func privetrackallbet()
    If GUICtrlRead($privetrackallbet) = $gui_checked Then
        GUICtrlSetState($privetrackbetes, $gui_checked)
        GUICtrlSetState($privetrackdragons, $gui_checked)
        GUICtrlSetState($privetrackdemons, $gui_checked)
        GUICtrlSetState($privetrackelementaires, $gui_checked)
        GUICtrlSetState($privetrackgeants, $gui_checked)
        GUICtrlSetState($privetrackmortsvivants, $gui_checked)
        GUICtrlSetState($privetrackhumanoides, $gui_checked)
        GUICtrlSetState($privetrackbestioles, $gui_checked)
        _memorywrite($playerbase2 + $hunt, $wowprocess, -1, "dword")
    Else
        GUICtrlSetState($privetrackbetes, $gui_unchecked)
        GUICtrlSetState($privetrackdragons, $gui_unchecked)
        GUICtrlSetState($privetrackdemons, $gui_unchecked)
        GUICtrlSetState($privetrackelementaires, $gui_unchecked)
        GUICtrlSetState($privetrackgeants, $gui_unchecked)
        GUICtrlSetState($privetrackmortsvivants, $gui_unchecked)
        GUICtrlSetState($privetrackhumanoides, $gui_unchecked)
        GUICtrlSetState($privetrackbestioles, $gui_unchecked)
        _memorywrite($playerbase2 + $hunt, $wowprocess, 0, "dword")
    EndIf
EndFunc

Func _memorywritegcd($iv_address, $ah_handle, $sv_type, $subj)
    If NOT IsArray($ah_handle) Then
        SetError(1)
        Return 0
    EndIf
    Local $v_buffer = DllStructCreate($sv_type)
    If @error Then
        SetError(@error + 1)
        Return 0
    EndIf
    DllStructSetData($v_buffer, 1, $subj)
    DllCall($ah_handle[0], "int", "WriteProcessMemory", "int", $ah_handle[1], "int", $iv_address, "ptr", DllStructGetPtr($v_buffer), "int", DllStructGetSize($v_buffer), "int", "")
    If NOT @error Then
        Return -1
    Else
        SetError(6)
        Return 0
    EndIf
EndFunc
