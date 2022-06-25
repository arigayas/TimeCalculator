object Form1: TForm1
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #20493#36895#26178#38291#35336#31639#27231
  ClientHeight = 171
  ClientWidth = 214
  Color = clBtnFace
  Constraints.MaxHeight = 200
  Constraints.MaxWidth = 220
  Constraints.MinHeight = 200
  Constraints.MinWidth = 220
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnMouseWheel = FormMouseWheel
  DesignSize = (
    214
    171)
  PixelsPerInch = 96
  TextHeight = 13
  object SeveralTimesLabel: TLabel
    Left = 161
    Top = 76
    Width = 32
    Height = 18
    Caption = #20493#36895
    Font.Charset = SHIFTJIS_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'UD '#12487#12472#12479#12523' '#25945#31185#26360#20307' NP-B'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object AnswerLabel: TLabel
    Left = 13
    Top = 106
    Width = 183
    Height = 20
    Alignment = taCenter
    Anchors = [akLeft, akTop, akRight, akBottom]
    Caption = '0'#26178#38291'0'#20998'0'#31186
    Constraints.MaxHeight = 20
    Constraints.MaxWidth = 183
    Constraints.MinHeight = 20
    Constraints.MinWidth = 183
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    OnMouseEnter = AnswerLabelMouseEnter
  end
  object ResetButton: TButton
    Left = 13
    Top = 133
    Width = 89
    Height = 30
    Caption = 'Reset'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
    OnClick = ResetButtonClick
  end
  object HourLabeledEdit: TLabeledEdit
    Left = 13
    Top = 21
    Width = 60
    Height = 27
    Hint = '9'#26689#12414#12391#12391#12377
    Alignment = taRightJustify
    EditLabel.Width = 24
    EditLabel.Height = 13
    EditLabel.Caption = #26178#38291
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ImeMode = imDisable
    MaxLength = 9
    NumbersOnly = True
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    TextHint = '0'
    OnChange = TLabelEditChange
    OnKeyDown = FormKeyDown
    OnKeyUp = HourLabeledEditKeyUp
  end
  object MinuteLabeledEdit: TLabeledEdit
    Left = 79
    Top = 21
    Width = 60
    Height = 27
    Hint = '9'#26689#12414#12391#12391#12377
    Alignment = taRightJustify
    EditLabel.Width = 12
    EditLabel.Height = 13
    EditLabel.Caption = #20998
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ImeMode = imDisable
    MaxLength = 9
    NumbersOnly = True
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    TextHint = '0'
    OnChange = TLabelEditChange
    OnKeyDown = FormKeyDown
    OnKeyUp = HourLabeledEditKeyUp
  end
  object SecondLabeledEdit: TLabeledEdit
    Left = 144
    Top = 21
    Width = 60
    Height = 27
    Hint = '9'#26689#12414#12391#12391#12377
    Alignment = taRightJustify
    EditLabel.Width = 12
    EditLabel.Height = 13
    EditLabel.Caption = #31186
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ImeMode = imDisable
    MaxLength = 9
    NumbersOnly = True
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    TextHint = '0'
    OnChange = TLabelEditChange
    OnKeyDown = FormKeyDown
    OnKeyUp = HourLabeledEditKeyUp
  end
  object CalculationButton: TButton
    Left = 122
    Top = 132
    Width = 82
    Height = 30
    Caption = #35336#31639
    Font.Charset = SHIFTJIS_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'UD '#12487#12472#12479#12523' '#25945#31185#26360#20307' NK-B'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
    OnClick = CalculationButtonClick
  end
  object SeveralTimesComboBox: TComboBox
    Left = 100
    Top = 74
    Width = 55
    Height = 21
    Style = csDropDownList
    ImeMode = imDisable
    TabOrder = 4
    OnKeyDown = FormKeyDown
    Items.Strings = (
      '0.25'
      '0.5'
      '0.7'
      '0.75'
      '1.0'
      '1.25'
      '1.3'
      '1.5'
      '1.7'
      '1.75'
      '2.0')
  end
  object MultipleLabelEdit: TLabeledEdit
    Left = 13
    Top = 73
    Width = 60
    Height = 27
    Hint = '9'#26689#12414#12391#12391#12377
    Alignment = taRightJustify
    EditLabel.Width = 48
    EditLabel.Height = 13
    EditLabel.Caption = #20309#35441#20998#65311
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ImeMode = imDisable
    MaxLength = 9
    NumbersOnly = True
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    TextHint = '0'
    OnChange = TLabelEditChange
    OnKeyDown = FormKeyDown
    OnKeyUp = HourLabeledEditKeyUp
  end
end
