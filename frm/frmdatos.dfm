object DM: TDM
  OldCreateOrder = False
  Height = 123
  Width = 983
  object Conexion: TFXConnection
    ConnectionName = 'FBConnection'
    Params.Strings = (
      'DriverID=FB'
      'User_Name=sysdba'
      'Password=masterkey')
    FetchOptions.AssignedValues = [evMode, evItems, evAutoClose, evRecordCountMode]
    FetchOptions.Mode = fmAll
    FetchOptions.AutoClose = False
    FetchOptions.RecordCountMode = cmFetched
    FormatOptions.AssignedValues = [fvMapRules, fvSE2Null, fvDataSnapCompatibility, fvStrsTrim2Len]
    FormatOptions.OwnMapRules = True
    FormatOptions.MapRules = <
      item
        SourceDataType = dtDateTime
        TargetDataType = dtDateTimeStamp
      end>
    ResourceOptions.AssignedValues = [rvParamCreate, rvMacroCreate, rvMacroExpand, rvParamExpand, rvKeepConnection]
    ResourceOptions.MacroCreate = False
    ResourceOptions.MacroExpand = False
    UpdateOptions.AssignedValues = [uvCheckReadOnly]
    UpdateOptions.CheckReadOnly = False
    LoginPrompt = False
    Left = 872
    Top = 16
  end
end
