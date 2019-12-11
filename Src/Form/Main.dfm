object Frm_Main: TFrm_Main
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Base64'#36716#25442#23567#24037#20855
  ClientHeight = 270
  ClientWidth = 385
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object pgMain: TPageControl
    Left = 8
    Top = 8
    Width = 369
    Height = 223
    ActivePage = tbStrB64
    TabOrder = 0
    object tbStrB64: TTabSheet
      Caption = #23383#31526#20018#36716#25442
      object lblPlain: TLabel
        Left = 0
        Top = 5
        Width = 36
        Height = 13
        Caption = #23383#31526#20018
      end
      object lblBase64: TLabel
        Left = 3
        Top = 85
        Width = 47
        Height = 13
        Caption = 'Base64'#20018
      end
      object mmString: TMemo
        Left = 3
        Top = 24
        Width = 350
        Height = 49
        ScrollBars = ssVertical
        TabOrder = 0
      end
      object mmBase64: TMemo
        Left = 3
        Top = 104
        Width = 350
        Height = 49
        ScrollBars = ssVertical
        TabOrder = 1
      end
    end
    object tbFileB64: TTabSheet
      Caption = #25991#20214#36716#25442
      ImageIndex = 1
      object edtFile: TEdit
        Left = 16
        Top = 14
        Width = 289
        Height = 21
        ReadOnly = True
        TabOrder = 0
      end
      object btnFile: TButton
        Left = 311
        Top = 12
        Width = 33
        Height = 25
        Caption = #183#183#183
        TabOrder = 1
        OnClick = btnFileClick
      end
      object mm: TMemo
        Left = 16
        Top = 51
        Width = 328
        Height = 94
        ScrollBars = ssVertical
        TabOrder = 2
      end
      object Button1: TButton
        Left = 269
        Top = 153
        Width = 75
        Height = 25
        Caption = #22797#21046
        TabOrder = 3
        OnClick = Button1Click
      end
      object ChkOption: TCheckBox
        Left = 16
        Top = 159
        Width = 97
        Height = 17
        Caption = #25991#20214#36716'Base64'
        TabOrder = 4
      end
    end
  end
  object btnConvert: TButton
    Left = 302
    Top = 237
    Width = 75
    Height = 25
    Caption = #36716#25442
    TabOrder = 1
    OnClick = btnConvertClick
  end
  object btnHelp: TButton
    Left = 206
    Top = 237
    Width = 75
    Height = 25
    Caption = #24110#21161
    TabOrder = 2
    OnClick = btnHelpClick
  end
  object Dlg: TOpenDialog
    Left = 256
    Top = 32
  end
  object SavDlg: TSaveDialog
    Left = 192
    Top = 40
  end
end
