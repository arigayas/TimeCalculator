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
    procedure MinuteLabeledEditChange(Sender: TObject);
    procedure MultipleLabelEditChange(Sender: TObject);
    procedure TLabelEditChange(Sender: TObject);
  private
    { Private 宣言 }
  public
    { Public 宣言 }
  end;

var
  Form1: TForm1;

implementation

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
  end;

  if (TmpHour = 0) and (TmpMin = 0)then
  begin
    StrMin := '';
  end
  else
  begin
    StrMin := IntToStr(TmpMin) + '分';
  end;

  AnswerLabel.Caption := StrHour + StrMin + IntToStr(TmpSec) + '秒';
end;


procedure TForm1.MinuteLabeledEditChange(Sender: TObject);
begin
  if MinuteLabeledEdit.GetTextLen > MinuteLabeledEdit.MaxLength - 1 then
    begin
      MinuteLabeledEdit.Color := clYellow;
      Form1.Caption := '倍速時間計算機 - 入力は'+ MinuteLabeledEdit.MaxLength.ToString +'桁まで';
    end
  else
  begin
    MinuteLabeledEdit.Color := clWindow;
    Form1.Caption := '倍速時間計算機';
  end;
end;

procedure TForm1.MultipleLabelEditChange(Sender: TObject);
begin
  if MultipleLabelEdit.GetTextLen > MultipleLabelEdit.MaxLength - 1 then
  begin
    MultipleLabelEdit.Color := clYellow;
    Form1.Caption := '倍速時間計算機 - 入力は'+ MinuteLabeledEdit.MaxLength.ToString +'桁まで';
  end
  else
  begin
    MultipleLabelEdit.Color := clWindow;
    Form1.Caption := '倍速時間計算機';
  end;
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

procedure TForm1.TLabelEditChange(Sender: TObject);
begin
  if Sender is TLabeledEdit then
  begin  // 9文字入力すると色とウィンドウタイトルが変化する
      if TLabeledEdit(Sender).GetTextLen > TLabeledEdit(Sender).MaxLength - 1 then
      begin
        TLabeledEdit(Sender).Color := clYellow;
        Form1.Caption := '倍速時間計算機 - 入力は'+ TLabeledEdit(Sender).MaxLength.ToString +'桁まで';
      end
      else
      begin
        TLabeledEdit(Sender).Color := clWindow;
        Form1.Caption := '倍速時間計算機';
      end;
  end;
end;

end.
