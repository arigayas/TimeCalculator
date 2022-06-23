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
    function NumValUp(NumVal:string):string;
    function NumValDown(NumVal:string):string;
    procedure FormMouseWheel(Sender: TObject; Shift: TShiftState;
      WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
    function BlankCheck(Val:string): Integer;
    procedure NumericalValueUp(Sender: TObject);
    procedure NumericalValueDown(Sender: TObject);
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
  InHour := BlankCheck(HourLabeledEdit.Text);
  InMin := BlankCheck(MinuteLabeledEdit.Text);
  InSec := BlankCheck(SecondLabeledEdit.Text);

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
  SeveralTimesComboBox.ItemIndex := 4;  // 1.0 倍速を選択した状態で起動する
  ActiveControl := MinuteLabeledEdit;   // 分欄にカーソルがある状態で起動する
end;

procedure TForm1.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_RETURN) then
    CalculationButtonClick(Sender);

  if (Key = VK_UP) then
    NumericalValueUp(Sender);

  if (Key = VK_DOWN) then
    NumericalValueDown(Sender);

end;

procedure TForm1.FormMouseWheel(Sender: TObject; Shift: TShiftState;
  WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
begin
  Handled := True; // このイベントが複数回呼ばれなくなるために必要
  if WheelDelta > 0 then
    NumericalValueUp(Sender)
  else
    NumericalValueDown(Sender);
end;


procedure TForm1.NumericalValueDown(Sender: TObject);
var
  NumVal: string;
begin
  begin
    if HourLabeledEdit.Focused then
    begin
      NumVal := HourLabeledEdit.Text;
      HourLabeledEdit.Text := NumValDown(NumVal);
    end;

  if MinuteLabeledEdit.Focused then
    begin
      NumVal := MinuteLabeledEdit.Text;
      MinuteLabeledEdit.Text := NumValDown(NumVal);
    end;

  if SecondLabeledEdit.Focused then
    begin
      NumVal := SecondLabeledEdit.Text;
      SecondLabeledEdit.Text := NumValDown(NumVal);
    end;

  if MultipleLabelEdit.Focused then
    begin
      NumVal := MultipleLabelEdit.Text;
      MultipleLabelEdit.Text := NumValDown(NumVal);
    end;
  end;
end;

procedure TForm1.NumericalValueUp(Sender: TObject);
var
  NumVal: string;
begin
if HourLabeledEdit.Focused then
    begin
      NumVal := HourLabeledEdit.Text;
      HourLabeledEdit.Text := NumValUp(NumVal);
    end;

  if MinuteLabeledEdit.Focused then
    begin
      NumVal := MinuteLabeledEdit.Text;
      MinuteLabeledEdit.Text := NumValUp(NumVal);
    end;

  if SecondLabeledEdit.Focused then
    begin
      NumVal := SecondLabeledEdit.Text;
      SecondLabeledEdit.Text := NumValUp(NumVal);
    end;

  if MultipleLabelEdit.Focused then
    begin
      NumVal := MultipleLabelEdit.Text;
      MultipleLabelEdit.Text := NumValUp(NumVal);
    end;
end;

function TForm1.NumValDown(NumVal:string):string;
var
  num:Integer;
begin
  num := BlankCheck(NumVal);

  if Num > 0 then
    begin
      dec(Num);
       // Shift or Control キー押下時-5で減らすが4未満の時は1ずつ減らす
      if ((GetKeyState( VK_SHIFT ) < 0) or (GetKeyState( VK_CONTROL ) < 0)) and (num > 3) then
        num := num - 4 ;
      Result := Num.ToString;
    end
   else
     Result := '0';
end;

function TForm1.NumValUp(NumVal:string):string;
var
  num:Integer;
begin
  num := BlankCheck(NumVal);

  if Num < 999999999 then
    begin
      Inc(Num);
      // Shift or Control キー押下時+5で増やす
      if (GetKeyState( VK_SHIFT ) < 0) or (GetKeyState( VK_CONTROL ) < 0) then
        num := num + 4 ;
      Result := Num.ToString;
    end;
end;

function TForm1.BlankCheck(Val:string): Integer;
begin
  if Val = '' then
    Result := 0
  else
    Result := Val.ToInteger;
end;

procedure TForm1.ResetButtonClick(Sender: TObject);
begin
  HourLabeledEdit.Text := '';
  MinuteLabeledEdit.Text := '';
  SecondLabeledEdit.Text := '';
  MultipleLabelEdit.Text := '';
  AnswerLabel.Caption := '0' + Str_Hour + '0' + Str_Min + '0' + Str_Sec;
  SeveralTimesComboBox.ItemIndex := 4;
  MinuteLabeledEdit.SetFocus;
end;

procedure TForm1.TLabelEditChange(Sender: TObject);
begin
  if Sender is TLabeledEdit then
  begin
    // 7文字入力するとヒントに入力値を表示する
    if TLabeledEdit(Sender).GetTextLen > 6 then
      begin
        TLabeledEdit(Sender).hint := TLabeledEdit(Sender).text;
      end
    else
      begin
        TLabeledEdit(Sender).hint := TLabeledEdit(Sender).MaxLength.ToString +'桁までです';
      end;

    // 9文字入力すると色とウィンドウタイトルが変化する
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

    // 入力欄のカーソルを一番右に維持する
    TLabeledEdit(Sender).SelStart := Length(TLabeledEdit(Sender).Text) + 1;
  end;
end;

end.
