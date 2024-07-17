#include "TOTVS.ch"
#include "TOPCONN.ch"


User Function MA035VLD()
    // Local nOpc  := ParamIxb[1]
    Local _LRet := .T.

    If getTipoBLQ(BM_FSTPGRP) = .F.                
        _LRet := .F.
        Help("",1,"MA035VLD",,"O Tipo vinculado a este Grupo está Bloqueado",1)
    endif

Return _LRet


Static Function getTipoBLQ(cTipo)
    Local c_Query, nMsblql, LRet

    c_Query := " SELECT Z1_MSBLQL "
    c_Query += " FROM " + RetSqlName("SZ1990") + " (nolock) "
    c_Query += " WHERE Z1_COD = '" + CTipo + "'"
    c_Query += " AND D_E_L_E_T_ <> '*' "

    Tcquery c_Query new alias "QRY"
    DbSelectArea("QRY")
    QRY->( DbGotop())    
    nMsblql := QRY->Z1_MSBLQL
    QRY->(DbCloseArea())

    If nMsblql = "1"
        LRet := .F.
    Else
        LRet := .T.
    EndIf
    
Return LRet
