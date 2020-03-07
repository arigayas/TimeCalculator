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
  private
    { Private 宣言 }
  public
    { Public 宣言 }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.CalculationButtonClick(Sender: TObject);
var
  TmpDay, InHour, InMin, InSec, InMultiple: Int64;
  TmpHour, TmpMin, TmpSec: Int64;
  InSeveralTimes: Integer;
  StrHour: String;
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
  if TmpHour > 24 then
    begin
      TmpDay := TmpHour div 24;
      TmpHour := (TmpHour - (TmpDay * 24)) mod 24;
      StrHour := IntToStr(TmpDay) + '日' + IntToStr(TmpHour) + '時間';
    end
  else
    begin
      StrHour := IntToStr(TmpHour) + '時間';
    end;

  AnswerLabel.Caption := StrHour + IntToStr(TmpMin) + '分' + IntToStr(TmpSec) + '秒';
end;


procedure TForm1.ResetButtonClick(Sender: TObject);
begin
  HourLabeledEdit.Text := '';
  MinuteLabeledEdit.Text := '';
  SecondLabeledEdit.Text := '';
  MultipleLabelEdit.Text := '';
  AnswerLabel.Caption := '0時間0分0秒';
  SeveralTimesComboBox.ItemIndex := -1;
  MinuteLabeledEdit.SetFocus;
end;

end.