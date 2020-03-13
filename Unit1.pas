unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TForm1 = class(TForm)
    ResetButton: TButton;
    SeveralTimesLabel: TLabel;
    HourLabeledEdit: TLabeledEdit;
    MinuteLabeledEdit: TLabeledEdit;
    SecondLabeledEdit: TLabeledEdit;
    CalculationButton: TButton;
    SeveralTimesComboBox: TComboBox;
    AnswerLabel: TLabel;
    MultipleLabelEdit: TLabeledEdit;
    procedure ResetButtonClick(Sender: TObject);
    procedure CalculationButtonClick(Sender: TObject);
    procedure AnswerLabelMouseEnter(Sender: TObject);
    procedure TLabelEditChange(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
  private
    { Private 宣言 }
  public
    { Public 宣言 }
  end;

var
  Form1: TForm1;

implementation

resourcestring
  Str_Days = '日';
  Str_Hour = '時間';
  Str_Min = '分';
  Str_Sec = '秒';
  Str_AppName = '倍速時間計算機';

{$R *.dfm}


// マウスカーソルをラベル上に乗せたらAnswerLabel.Captionの値を表示する
procedure TForm1.AnswerLabelMouseEnter(Sender: TObject);
begin
  AnswerLabel.ShowHint := True;
  AnswerLabel.Hint := AnswerLabel.Caption;
end;

procedure TForm1.CalculationButtonClick(Sender: TObject);
var
  TmpDay, InHour, InMin, InSec, InMultiple: UInt64;
  TmpHour, TmpMin, TmpSec: UInt64;
  InSeveralTimes: UInt32;
  StrHour, StrMin: String;
  n: string;
begin
// -- 代入部----------------------------------
  if HourLabeledEdit.Text = '' then
  begin
    InHour := 0;
  end
  else
  begin
    InHour := StrToInt(HourLabeledEdit.Text);
  end;

  if MinuteLabeledEdit.Text = '' then
  begin
    InMin := 0;
  end
  else
  begin
    InMin := StrToInt(MinuteLabeledEdit.Text);
  end;

  if SecondLabeledEdit.Text = '' then
  begin
    InSec := 0;
  end
  else
  begin
    InSec := StrToInt(SecondLabeledEdit.Text);
  end;

  if MultipleLabelEdit.Text = '' then // 話数欄
  begin
    InMultiple := 1;
  end
  else
  begin
    InMultiple := StrToInt(MultipleLabelEdit.Text);
  end;
// -- 代入部終わり----------------------------


// -- 計算部----------------------------------
  TmpMin := InHour * 60 + InMin;
  TmpSec := TmpMin * 60 + InSec;
  TmpSec := TmpSec * InMultiple;

  if SeveralTimesComboBox.ItemIndex <> -1 then
  begin
    n := SeveralTimesComboBox.Text;
    InSeveralTimes := Trunc(StrToFloat(n) * 100);
    TmpSec :=  (TmpSec * 100) div InSeveralTimes ;
  end;

  TmpHour := TmpSec div 3600;
  TmpMin := (TmpSec - (TmpHour * 3600)) div 60;
  TmpSec := (TmpSec - (TmpHour * 3600)) mod 60;
// -- 計算部終わり----------------------------


// -- 出力部----------------------------------
  if TmpHour = 0 then
  begin
    StrHour := '';
  end
  else
  begin
    if TmpHour > 23 then
    begin
      TmpDay := TmpHour div 24;
      TmpHour := (TmpHour - (TmpDay * 24)) mod 24;
      StrHour := IntToStr(TmpDay) + Str_Days + IntToStr(TmpHour) + Str_Hour;
    end
  else
    begin
      StrHour := IntToStr(TmpHour) + Str_Hour;
    end;
  end;

  if (TmpHour = 0) and (TmpMin = 0)then
  begin
    StrMin := '';
  end
  else
  begin
    StrMin := IntToStr(TmpMin) + Str_Min;
  end;

  AnswerLabel.Caption := StrHour + StrMin + IntToStr(TmpSec) + Str_Sec;
  AnswerLabelMouseEnter(Sender);
end;


procedure TForm1.FormCreate(Sender: TObject);
begin
  {$IFDEF DEBUG}
    Color := clOlive;
  {$ENDIF}
end;

procedure TForm1.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_RETURN) then
    CalculationButtonClick(Sender);
end;

procedure TForm1.ResetButtonClick(Sender: TObject);
begin
  HourLabeledEdit.Text := '';
  MinuteLabeledEdit.Text := '';
  SecondLabeledEdit.Text := '';
  MultipleLabelEdit.Text := '';
  AnswerLabel.Caption := '0' + Str_Hour + '0' + Str_Min + '0' + Str_Sec;
  SeveralTimesComboBox.ItemIndex := -1;
  MinuteLabeledEdit.SetFocus;
end;

procedure TForm1.TLabelEditChange(Sender: TObject);
begin
  if Sender is TLabeledEdit then
  begin  // 9文字入力すると色とウィンドウタイトルが変化する
      if TLabeledEdit(Sender).GetTextLen > TLabeledEdit(Sender).MaxLength - 1 then
      begin
        TLabeledEdit(Sender).Color := clYellow;
        Form1.Caption := Str_AppName +' - 入力は'+ TLabeledEdit(Sender).MaxLength.ToString +'桁まで';
      end
      else
      begin
        TLabeledEdit(Sender).Color := clWindow;
        Form1.Caption := Str_AppName;
      end;
  end;
end;

end.
