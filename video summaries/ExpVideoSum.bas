Attribute VB_Name = "Module1"
Sub ExportVidSum()
'
' ExportVidSum Macro
'
'
' User needs to have copied the column from the video sum document
' Create new doc based on Video Summaries.dotx
    Documents.Add Template:= _
        "C:\Users\jjpdq\Documents\Custom Office Templates\Video summaries.dotx", _
        NewTemplate:=False, DocumentType:=0
' Use AutoText to add subtitle
    Selection.EndKey Unit:=wdLine
    Selection.TypeText Text:="reFR"
    Selection.Range.InsertAutoText
    
' Paste copied column to end of the document
    Selection.EndKey Unit:=wdStory
    Selection.PasteAndFormat (wdPasteDefault)
    
' Move in to table and convert to text
    Selection.MoveUp Unit:=wdLine, Count:=1
    Selection.Rows.ConvertToText Separator:=wdSeparateByParagraphs, _
        NestedTables:=True
    
' Reset Paragraph formtting
    Selection.ParagraphFormat.Reset
    
' update contents
    Selection.HomeKey Unit:=wdStory
    Selection.MoveDown Unit:=wdLine, Count:=4
    Selection.Fields.Update
    
'select title
    Selection.HomeKey Unit:=wdStory
    Selection.MoveDown Unit:=wdLine, Count:=1
    Selection.MoveRight Unit:=wdCharacter, Count:=5, Extend:=wdExtend
    
' user needs to type in the title
End Sub

