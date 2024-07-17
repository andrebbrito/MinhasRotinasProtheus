#include "protheus.ch"

/*/{Protheus.doc} FESTA001
description: Cadastro de Tipo
@type function
@version 1.0 
@author andre.brito
@since 17/07/2024
/*/
User Function FESTA001()

	Local cAlias := "SZ1"
	Local cTitulo := "Tipo de Grupo"
	Local cVldExc := ".T."
	Local cVldAlt := ".T."

	dbSelectArea(cAlias)
	dbSetOrder(1)
	AxCadastro(cAlias,cTitulo,cVldExc,cVldAlt)

Return Nil

User Function VldAlt(cAlias,nReg,nOpc)

	Local lRet := .T.
	Local aArea := GetArea()
	Local nOpcao:= 0

	iF RetCodUsr() # "000000" .Or. INCLUI
		nOpcao := AxAltera(cAlias,nReg,nOpc)
	ELSE
		msgstop("usuario nao autorizado","atencao")
        lRet := .F.
	eNDif

	If nOpcao == 1
		MsgInfo("Alteração concluída com sucesso!")
	Endif

	RestArea(aArea)
Return lRet


User Function VldExc(cAlias,nReg,nOpc)
	Local lRet := .T.
	Local aArea := GetArea()
	Local nOpcao := 0

	nOpcao := AxExclui(cAlias,nReg,nOpc)

	If nOpcao == 1
		MsgInfo("Exclusão concluída com sucesso!")
	Endif

	RestArea(aArea)
	
Return lRet
