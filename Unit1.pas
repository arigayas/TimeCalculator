<<<<<<< HEAD
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
    { Private êÈåæ }
  public
    { Public êÈåæ }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.CalculationButtonClick(Sender: TObject);
var
  TmpDay, InHour, InMin, InSec, InMultiple: Int64;
  TmpHour, TmpMin, TmpSec,TmpSeveralTimes: Int64;
  InSeveralTimes: Integer;
  StrHour: String;
  n: string;
begin
// -- ë„ì¸ïî----------------------------------
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

  if MultipleLabelEdit.Text = '' then // òbêîóì
  begin
    InMultiple := 1;
  end
  else
  begin
    InMultiple := StrToInt(MultipleLabelEdit.Text);
  end;
// -- ë„ì¸ïîèIÇÌÇË----------------------------


// -- åvéZïî----------------------------------
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
// -- åvéZïîèIÇÌÇË----------------------------


// -- èoóÕïî----------------------------------
  if TmpHour > 24 then
    begin
      TmpDay := TmpHour div 24;
      TmpHour := (TmpHour - (TmpDay * 24)) mod 24;
      StrHour := IntToStr(TmpDay) + 'ì˙' + IntToStr(TmpHour) + 'éûä‘';
    end
  else
    begin
      StrHour := IntToStr(TmpHour) + 'éûä‘';
    end;

  AnswerLabel.Caption := StrHour + IntToStr(TmpMin) + 'ï™' + IntToStr(TmpSec) + 'ïb';
end;


procedure TForm1.ResetButtonClick(Sender: TObject);
begin
  HourLabeledEdit.Text := '';
  MinuteLabeledEdit.Text := '';
  SecondLabeledEdit.Text := '';
  MultipleLabelEdit.Text := '';
  AnswerLabel.Caption := '0éûä‘0ï™0ïb';
  SeveralTimesComboBox.ItemIndex := -1;
  MinuteLabeledEdit.SetFocus;
end;

end.
=======
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
    { Private êÈåæ }
  public
    { Public êÈåæ }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.CalculationButtonClick(Sender: TObject);
var
  TmpDay, InHour, InMin, InSec, InMultiple: Int64;
  TmpHour, TmpMin, TmpSec,TmpSeveralTimes: Int64;
  InSeveralTimes: Integer;
  StrHour: String;
  n: string;
begin
// -- ë„ì¸ïî----------------------------------
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

  if MultipleLabelEdit.Text = '' then // òbêîóì
  begin
    InMultiple := 1;
  end
  else
  begin
    InMultiple := StrToInt(MultipleLabelEdit.Text);
  end;
// -- ë„ì¸ïîèIÇÌÇË----------------------------


// -- åvéZïî----------------------------------
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
// -- åvéZïîèIÇÌÇË----------------------------


// -- èoóÕïî----------------------------------
  if TmpHour > 24 then
    begin
      TmpDay := TmpHour div 24;
      TmpHour := (TmpHour - (TmpDay * 24)) mod 24;
      StrHour := IntToStr(TmpDay) + 'ì˙' + IntToStr(TmpHour) + 'éûä‘';
    end
  else
    begin
      StrHour := IntToStr(TmpHour) + 'éûä‘';
    end;

  AnswerLabel.Caption := StrHour + IntToStr(TmpMin) + 'ï™' + IntToStr(TmpSec) + 'ïb';
end;


procedure TForm1.ResetButtonClick(Sender: TObject);
begin
  HourLabeledEdit.Text := '';
  MinuteLabeledEdit.Text := '';
  SecondLabeledEdit.Text := '';
  MultipleLabelEdit.Text := '';
  AnswerLabel.Caption := '0éûä‘0ï™0ïb';
  SeveralTimesComboBox.ItemIndex := -1;
  MinuteLabeledEdit.SetFocus;
end;

end.
>>>>>>> dda96ccedea90781c4c33c18dd91c2950be9600a
