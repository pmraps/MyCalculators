unit mainCalculators;

{$mode objfpc}{$H+}

interface

uses
    SysUtils, Forms, Controls, Dialogs, StdCtrls, Menus,
    ExtCtrls, Buttons, DateTimePicker, Math, MyCredits, baseConvert, Classes;

type

    { TfrmMyCalculators }

    TfrmMyCalculators = class(TForm)
      BtnActualCalendar: TBitBtn;
      btnACos: TButton;
      btnACosH: TButton;
      btnACot: TButton;
      btnAdd1: TButton;
      btnASin: TButton;
      btnASinH: TButton;
      btnATan: TButton;
      btnATanH: TButton;
      btnBackspace1: TButton;
      btnDecToBase: TButton;
      btnBinToBase: TButton;
      btnCelsius: TButton;
      btnClearEntry1: TButton;
      btnClearEntry2: TButton;
      btnClearEntry3: TButton;
      btnClearEntry4: TButton;
      btnComma1: TButton;
      btnCos: TButton;
      btnCoSecant: TButton;
      btnCosH: TButton;
      btnCotH: TButton;
      btnCTan: TButton;
      btnOctToBase: TButton;
      btnDegreesGradians: TButton;
      btnDegreesRadians: TButton;
      btnDivide1: TButton;
      btnEight1: TButton;
      btnEulerConstant: TButton;
      btnExponential: TButton;
      btnFactorial: TButton;
      btnFahrenheit: TButton;
      btnFive1: TButton;
      btnFour1: TButton;
      btnFraction: TButton;
      btnGradiansDegrees: TButton;
      btnGradiansRadians: TButton;
      btnHypotenuse: TButton;
      btnLog: TButton;
      btnMemoryClear1: TButton;
      btnMemoryClear2: TButton;
      btnMemoryClear3: TButton;
      btnMemoryClear4: TButton;
      btnMemoryMinus1: TButton;
      btnMemoryMinus2: TButton;
      btnMemoryMinus3: TButton;
      btnMemoryMinus4: TButton;
      btnMemoryPlus1: TButton;
      btnMemoryPlus2: TButton;
      btnMemoryPlus3: TButton;
      btnMemoryPlus4: TButton;
      btnMinus1: TButton;
      btnMultiply1: TButton;
      btnNine1: TButton;
      btnHexToBase: TButton;
      btnOne1: TButton;
      btnPercent: TButton;
      btnPermilage: TButton;
      btnPI: TButton;
      btnPlusMinus1: TButton;
      btnRadiansDegrees: TButton;
      btnRadiansGradians: TButton;
      btnRemainder1: TButton;
      btnResult1: TButton;
      btnRisedTo: TButton;
      btnSecant: TButton;
      btnSeven1: TButton;
      btnSin: TButton;
      btnSinH: TButton;
      btnSix1: TButton;
      btnTan: TButton;
      btnTanH: TButton;
      btnTAU: TButton;
      btnThree1: TButton;
      btnTwo1: TButton;
      btnXRoot: TButton;
      btnZero1: TButton;
      cBoxCalendarList: TComboBox;
      DtTPickerEndDate: TDateTimePicker;
      DTPickerPresent: TDateTimePicker;
      DTPickerToCalendar: TDateTimePicker;
      DTPickerStartDate: TDateTimePicker;
      ImageList: TImageList;
      lblAgeDifference: TLabel;
      lblConvertTo: TLabel;
      lblStartDate: TLabel;
      lblEndDate: TLabel;
      mnuEditSettings: TMenuItem;
      ppMenuGregorian: TMenuItem;
      ppMenuJulian: TMenuItem;
      ppMenuFrench: TMenuItem;
      ppMenuHebrew: TMenuItem;
      ppMenuArab: TMenuItem;
      ppMenuChinese: TMenuItem;
      mnuHelpHelp: TMenuItem;
      mnuCredits: TMenuItem;
      pnlDatulator: TPanel;
    pnlCalculatorType: TPanel;
    pnlFunctions: TPanel;
    pnlSimple: TPanel;
    pnlTrigonometry: TPanel;
    ppMenuCalendars: TPopupMenu;
    rdBtnDateCalculator: TRadioButton;
    rdBtnTrigonometry: TRadioButton;
    rdBtnFunctions: TRadioButton;
    rdBtnSimpleCalculator: TRadioButton;
    txtFieldResult: TEdit;
    mainMenu: TMainMenu;
    mnuMainFile: TMenuItem;
    mnuMainEdit: TMenuItem;
    mnuMainHelp: TMenuItem;
    procedure BtnActualCalendarClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnBackspaceClick(Sender: TObject);
    procedure btnBinToBaseClick(Sender: TObject);
    procedure btnCelsiusClick(Sender: TObject);
    procedure btnDecToBaseClick(Sender: TObject);
    procedure btnClearEntryClick(Sender: TObject);
    procedure btnCommaClick(Sender: TObject);
    procedure btnCosClick(Sender: TObject);
    procedure btnCubeNum1Click(Sender: TObject);
    procedure btnEulerConstantClick(Sender: TObject);
    procedure btnDecHexClick(Sender: TObject);
    procedure btnExponentialClick(Sender: TObject);
    procedure btnFactorialClick(Sender: TObject);
    procedure btnFahrenheitClick(Sender: TObject);
    procedure btnFractionClick(Sender: TObject);
    procedure btnHexToBaseClick(Sender: TObject);
    procedure btnLogClick(Sender: TObject);
    procedure btnMemoryClear2Click(Sender: TObject);
    procedure btnMemoryMinus3Click(Sender: TObject);
    procedure btnMemoryPlus2Click(Sender: TObject);
    procedure btnOctToBaseClick(Sender: TObject);
    procedure btnPIClick(Sender: TObject);
    procedure btnRadiansGradiansClick(Sender: TObject);
    procedure btnDivideClick(Sender: TObject);
    procedure btnEightClick(Sender: TObject);
    procedure btnFiveClick(Sender: TObject);
    procedure btnFourClick(Sender: TObject);
    procedure btnDegreesGradiansClick(Sender: TObject);
    procedure btnMinusClick(Sender: TObject);
    procedure btnMultiplyClick(Sender: TObject);
    procedure btnNineClick(Sender: TObject);
    procedure btnOneClick(Sender: TObject);
    procedure btnPercentClick(Sender: TObject);
    procedure btnPermilageClick(Sender: TObject);
    procedure btnPlusMinusClick(Sender: TObject);
    procedure btnDegreesRadiansClick(Sender: TObject);
    procedure btnRemainderClick(Sender: TObject);
    procedure btnResultClick(Sender: TObject);
    procedure btnRisedToClick(Sender: TObject);
    procedure btnSevenClick(Sender: TObject);
    procedure btnSinClick(Sender: TObject);
    procedure btnSixClick(Sender: TObject);
    procedure btnSqrNum1Click(Sender: TObject);
    procedure btnSqrtClick(Sender: TObject);
    procedure btnTAUClick(Sender: TObject);
    procedure btnTenRaisedTo1Click(Sender: TObject);
    procedure btnThreeClick(Sender: TObject);
    procedure btnTwoClick(Sender: TObject);
    procedure btnXRootClick(Sender: TObject);
    procedure btnZeroClick(Sender: TObject);
    procedure mnuHelpCreditsClick(Sender: TObject);
    procedure ppMenuArabClick(Sender: TObject);
    procedure ppMenuChineseClick(Sender: TObject);
    procedure ppMenuFrenchClick(Sender: TObject);
    procedure ppMenuGregorianClick(Sender: TObject);
    procedure ppMenuHebrewClick(Sender: TObject);
    procedure ppMenuJulianClick(Sender: TObject);
    procedure rdBtnDateCalculatorClick(Sender: TObject);
    procedure rdBtnFunctionsClick(Sender: TObject);
    procedure rdBtnSimpleCalculatorClick(Sender: TObject);
    procedure rdBtnTrigonometryClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
      Num1, Num2, Result, Operators : String;
      Memory : extended;
  public

  end;

var
    frmMyCalculators: TfrmMyCalculators;

const
  E   = 2.718281828459045235360287471352;
  TAU = 6.283185307179586476925286766559;

implementation

{$R *.lfm}
procedure TfrmMyCalculators.FormCreate(Sender: TObject);
begin
    pnlSimple.Visible := true;
    rdBtnSimpleCalculator.Checked := true;
    pnlFunctions.Visible := false;
    pnlTrigonometry.Visible := false;
    pnlDatulator.Visible := false;
end;

procedure TfrmMyCalculators.btnSevenClick(Sender: TObject);
begin
    if txtFieldResult.Text = '' then txtFieldResult.Text := '7'
    else txtFieldResult.Text := txtFieldResult.Text + '7';
end;

procedure TfrmMyCalculators.btnSinClick(Sender: TObject);
var Angle, Sine, Cosine : Double;
begin
    Angle := StrToFloat(txtFieldResult.Text);
    SinCos(DegToRad(Angle), Sine, Cosine);
    txtFieldResult.Text := FloatToStr(Sine);
end;

procedure TfrmMyCalculators.btnSixClick(Sender: TObject);
begin
    if txtFieldResult.Text = '' then txtFieldResult.Text := '6'
    else txtFieldResult.Text := txtFieldResult.Text + '6';
end;

procedure TfrmMyCalculators.btnSqrNum1Click(Sender: TObject);
begin
     txtFieldResult.Text := FloatToStr(Sqr(StrToFloat(txtFieldResult.Text)));
end;

procedure TfrmMyCalculators.btnSqrtClick(Sender: TObject);
begin
    txtFieldResult.Text := FloatToStr(Sqrt(StrToFloat(txtFieldResult.Text)));
end;

procedure TfrmMyCalculators.btnTAUClick(Sender: TObject);
begin
     txtFieldResult.Text := FloatToStr(TAU);
end;

procedure TfrmMyCalculators.btnTenRaisedTo1Click(Sender: TObject);
begin
     txtFieldResult.Text := FloatToStr(Power(10, (StrToFloat(txtFieldResult.Text))));
end;

procedure TfrmMyCalculators.btnThreeClick(Sender: TObject);
begin
    if txtFieldResult.Text = '' then txtFieldResult.Text := '3'
    else txtFieldResult.Text := txtFieldResult.Text + '3';
end;

procedure TfrmMyCalculators.btnTwoClick(Sender: TObject);
begin
    if txtFieldResult.Text = '' then txtFieldResult.Text := '2'
    else txtFieldResult.Text := txtFieldResult.Text + '2';
end;

procedure TfrmMyCalculators.btnXRootClick(Sender: TObject);
begin
    Num1 := txtFieldResult.Text;
     Operators := 'NRoot';
     txtFieldResult.Text := '';
     pnlDatulator.Visible := false;
     pnlFunctions.Visible := false;
     pnlTrigonometry.Visible := false;
     pnlSimple.Visible := true;
     rdBtnSimpleCalculator.Checked := true;
end;

procedure TfrmMyCalculators.btnZeroClick(Sender: TObject);
begin
    if txtFieldResult.Text = '' then txtFieldResult.Text := '0'
    else txtFieldResult.Text := txtFieldResult.Text + '0';
end;

procedure TfrmMyCalculators.mnuHelpCreditsClick(Sender: TObject);
begin
    frmCredits.ShowModal;
end;

procedure TfrmMyCalculators.ppMenuArabClick(Sender: TObject);
begin
    BtnActualCalendar.ImageIndex := 5;
end;

procedure TfrmMyCalculators.ppMenuChineseClick(Sender: TObject);
begin
    BtnActualCalendar.ImageIndex := 4;
end;

procedure TfrmMyCalculators.ppMenuFrenchClick(Sender: TObject);
begin
    BtnActualCalendar.ImageIndex := 2;
end;

procedure TfrmMyCalculators.ppMenuGregorianClick(Sender: TObject);
begin
    BtnActualCalendar.ImageIndex := 0;
end;

procedure TfrmMyCalculators.ppMenuHebrewClick(Sender: TObject);
begin
    BtnActualCalendar.ImageIndex := 3;
end;

procedure TfrmMyCalculators.ppMenuJulianClick(Sender: TObject);
begin
    BtnActualCalendar.ImageIndex := 1;
end;

procedure TfrmMyCalculators.rdBtnDateCalculatorClick(Sender: TObject);
begin
    pnlSimple.Visible := false;
    pnlFunctions.Visible := false;
    pnlTrigonometry.Visible := false;
    pnlDatulator.Visible := true;
    rdBtnDateCalculator.Checked := true;
end;

procedure TfrmMyCalculators.rdBtnSimpleCalculatorClick(Sender: TObject);
begin
    pnlSimple.Visible := true;
    rdBtnSimpleCalculator.Checked := true;
    pnlFunctions.Visible := false;
    pnlTrigonometry.Visible := false;
    pnlDatulator.Visible := false;
end;

procedure TfrmMyCalculators.rdBtnFunctionsClick(Sender: TObject);
begin
    pnlSimple.Visible := false;
    pnlFunctions.Visible := true;
    rdBtnFunctions.Checked := true;
    pnlTrigonometry.Visible := false;
    pnlDatulator.Visible := false;
end;

procedure TfrmMyCalculators.rdBtnTrigonometryClick(Sender: TObject);
begin
    pnlSimple.Visible := false;
    pnlFunctions.Visible := false;
    pnlTrigonometry.Visible := true;
    rdBtnTrigonometry.Checked := true;
    pnlDatulator.Visible := false;
end;

procedure TfrmMyCalculators.btnEightClick(Sender: TObject);
begin
    if txtFieldResult.Text = '' then txtFieldResult.Text := '8'
    else txtFieldResult.Text := txtFieldResult.Text + '8';
end;

procedure TfrmMyCalculators.btnBackspaceClick(Sender: TObject);
begin
    txtFieldResult.Text := copy(txtFieldResult.Text, 0, length(txtFieldResult.Text) - 1);
end;

procedure TfrmMyCalculators.btnBinToBaseClick(Sender: TObject);
begin
    Num1 := txtFieldResult.Text;
    Operators := 'B>N';
    txtFieldResult.Text := '';
    pnlDatulator.Visible := false;
    pnlFunctions.Visible := false;
    pnlTrigonometry.Visible := false;
    pnlSimple.Visible := true;
    rdBtnSimpleCalculator.Checked := true;
end;

procedure TfrmMyCalculators.btnCelsiusClick(Sender: TObject);
begin
     txtFieldResult.Text := FloatToStr(StrToFloat(txtFieldResult.Text) * 1.8 + 32);
end;

procedure TfrmMyCalculators.btnDecToBaseClick(Sender: TObject);
begin
    Num1 := txtFieldResult.Text;
    Operators := 'D>N';
    txtFieldResult.Text := '';
    pnlDatulator.Visible := false;
    pnlFunctions.Visible := false;
    pnlTrigonometry.Visible := false;
    pnlSimple.Visible := true;
    rdBtnSimpleCalculator.Checked := true;
end;

procedure TfrmMyCalculators.btnAddClick(Sender: TObject);
begin
    Num1 := txtFieldResult.Text;
    Operators := '+';
    txtFieldResult.Text := '0';
end;

procedure TfrmMyCalculators.BtnActualCalendarClick(Sender: TObject);
begin
    ppMenuCalendars.PopUp;
end;

procedure TfrmMyCalculators.btnClearEntryClick(Sender: TObject);
{ To clear only the latest entry, another button should be added }
begin
    txtFieldResult.Text := '';
    Num1 := '0';
    Num2 := '0';
    Result := '0';
end;

procedure TfrmMyCalculators.btnCommaClick(Sender: TObject);
begin
    if txtFieldResult.Text = '' then txtFieldResult.Text := '0,'
    else if (Pos(',', txtFieldResult.Text) <> 0) then Exit
         else txtFieldResult.Text := txtFieldResult.Text + ',';
end;

procedure TfrmMyCalculators.btnCosClick(Sender: TObject);
var Angle, Sine, Cosine : Double;
begin
    Angle := StrToFloat(txtFieldResult.Text);
    SinCos(DegToRad(Angle), Sine, Cosine);
    txtFieldResult.Text := FloatToStr(Cosine);
end;

procedure TfrmMyCalculators.btnCubeNum1Click(Sender: TObject);
var cube : extended;
  CounterVar : Integer;
begin
    cube := StrToFloat(txtFieldResult.Text);
    for CounterVar := 0 to 2 do
    begin
        cube := cube * StrToFloat(txtFieldResult.Text);
    end;
    txtFieldResult.Text := FloatToStr(cube);
end;

procedure TfrmMyCalculators.btnEulerConstantClick(Sender: TObject);
begin
     txtFieldResult.Text := FloatToStr(E);
end;

procedure TfrmMyCalculators.btnDecHexClick(Sender: TObject);
var value : LongInt;
begin
     value := StrToInt(txtFieldResult.Text);
     txtFieldResult.Text := IntToHex(value, 5);
end;

procedure TfrmMyCalculators.btnExponentialClick(Sender: TObject);
begin
     Num1 := txtFieldResult.Text;
     Operators := 'Expo';
     txtFieldResult.Text := '';
     pnlDatulator.Visible := false;
     pnlFunctions.Visible := false;
     pnlTrigonometry.Visible := false;
     pnlSimple.Visible := true;
     rdBtnSimpleCalculator.Checked := true;
end;

procedure TfrmMyCalculators.btnFactorialClick(Sender: TObject);
var factorial, temp : Integer;
begin
     factorial := StrToInt(txtFieldResult.Text);
     temp := factorial;
     repeat
       factorial := factorial * (temp - 1);
       Dec(temp);
     until temp = 1;;
     pnlDatulator.Visible := false;
     pnlFunctions.Visible := false;
     pnlTrigonometry.Visible := false;
     pnlSimple.Visible := true;
     rdBtnSimpleCalculator.Checked := true;
     txtFieldResult.Text := IntToStr(factorial);
end;

procedure TfrmMyCalculators.btnFahrenheitClick(Sender: TObject);
begin
     txtFieldResult.Text := FloatToStr((StrToFloat(txtFieldResult.Text) - 32) / 1.8);
end;

procedure TfrmMyCalculators.btnFractionClick(Sender: TObject);
begin
    txtFieldResult.Text := FloatToStr(1 / StrToInt(txtFieldResult.Text));
end;

procedure TfrmMyCalculators.btnHexToBaseClick(Sender: TObject);
begin
    Num1 := txtFieldResult.Text;
    Operators := 'H>N';
    txtFieldResult.Text := '';
    pnlDatulator.Visible := false;
    pnlFunctions.Visible := false;
    pnlTrigonometry.Visible := false;
    pnlSimple.Visible := true;
    rdBtnSimpleCalculator.Checked := true;
end;

procedure TfrmMyCalculators.btnLogClick(Sender: TObject);
begin
    Num1 := txtFieldResult.Text;
    Operators := 'Log';
    txtFieldResult.Text := '';
    pnlDatulator.Visible := false;
    pnlFunctions.Visible := false;
    pnlTrigonometry.Visible := false;
    pnlSimple.Visible := true;
    rdBtnSimpleCalculator.Checked := true;
end;

procedure TfrmMyCalculators.btnMemoryClear2Click(Sender: TObject);
begin
    Memory := 0;
end;

procedure TfrmMyCalculators.btnMemoryMinus3Click(Sender: TObject);
begin
     if ((Memory <> 0) and (txtFieldResult.Text = '')) then
            txtFieldResult.Text := FloatToStr(Memory)
     else if txtFieldResult.Text <> '' then
            Memory := Memory - StrToFloat(txtFieldResult.Text);
end;

procedure TfrmMyCalculators.btnMemoryPlus2Click(Sender: TObject);
begin
     if ((Memory <> 0) and (txtFieldResult.Text = '')) then
            txtFieldResult.Text := FloatToStr(Memory)
     else if txtFieldResult.Text <> '' then
            Memory := Memory + StrToFloat(txtFieldResult.Text);
end;

procedure TfrmMyCalculators.btnOctToBaseClick(Sender: TObject);
begin
    Num1 := txtFieldResult.Text;
    Operators := 'O>N';
    txtFieldResult.Text := '';
    pnlDatulator.Visible := false;
    pnlFunctions.Visible := false;
    pnlTrigonometry.Visible := false;
    pnlSimple.Visible := true;
    rdBtnSimpleCalculator.Checked := true;
end;

procedure TfrmMyCalculators.btnPIClick(Sender: TObject);
begin
    txtFieldResult.Text := FloatToStr(Pi);
end;

procedure TfrmMyCalculators.btnRadiansGradiansClick(Sender: TObject);
var temp : Float;
begin
    temp := StrToFloat(txtFieldResult.Text);
    txtFieldResult.Text := FloatToStr(RadToDeg(temp));
end;

procedure TfrmMyCalculators.btnDivideClick(Sender: TObject);
begin
    Num1 := txtFieldResult.Text;
    Operators := '/';
    txtFieldResult.Text := '';
end;

procedure TfrmMyCalculators.btnFiveClick(Sender: TObject);
begin
    if txtFieldResult.Text = '' then txtFieldResult.Text := '5'
    else txtFieldResult.Text := txtFieldResult.Text + '5';
end;

procedure TfrmMyCalculators.btnFourClick(Sender: TObject);
begin
    if txtFieldResult.Text = '' then txtFieldResult.Text := '4'
    else txtFieldResult.Text := txtFieldResult.Text + '4';
end;

procedure TfrmMyCalculators.btnDegreesGradiansClick(Sender: TObject);
begin
    txtFieldResult.Text := FloatToStr(DegToGrad(StrToFloat(txtFieldResult.Text)));
end;

procedure TfrmMyCalculators.btnMinusClick(Sender: TObject);
begin
    Num1 := txtFieldResult.Text;
    Operators := '-';
    txtFieldResult.Text := '';
end;

procedure TfrmMyCalculators.btnMultiplyClick(Sender: TObject);
begin
    Num1 := txtFieldResult.Text;
    Operators := '*';
    txtFieldResult.Text := '';
end;

procedure TfrmMyCalculators.btnNineClick(Sender: TObject);
begin
    if txtFieldResult.Text = '' then txtFieldResult.Text := '9'
    else txtFieldResult.Text := txtFieldResult.Text + '9';
end;

procedure TfrmMyCalculators.btnOneClick(Sender: TObject);
begin
    if txtFieldResult.Text = '' then txtFieldResult.Text := '1'
    else txtFieldResult.Text := txtFieldResult.Text + '1';
end;

procedure TfrmMyCalculators.btnPercentClick(Sender: TObject);
begin
     txtFieldResult.Text := FloatToStr(StrToFloat(txtFieldResult.Text) / 100);
end;

procedure TfrmMyCalculators.btnPermilageClick(Sender: TObject);
begin
     txtFieldResult.Text := FloatToStr(StrToFloat(txtFieldResult.Text) / 1000);
end;

procedure TfrmMyCalculators.btnPlusMinusClick(Sender: TObject);
begin
    txtFieldResult.Text := FloatToStr(StrToFloat(txtFieldResult.Text) * -1);
end;

procedure TfrmMyCalculators.btnDegreesRadiansClick(Sender: TObject);
begin
    txtFieldResult.Text := FloatToStr(DegToRad(StrToFloat(txtFieldResult.Text)));
end;

procedure TfrmMyCalculators.btnRemainderClick(Sender: TObject);
begin
    Num1 := txtFieldResult.Text;
    Operators := 'mod';
    txtFieldResult.Text := '';
end;

procedure TfrmMyCalculators.btnResultClick(Sender: TObject);
var Number1, Number2 : extended;
  begin
    Num2 := txtFieldResult.Text;
    try
        case Operators of
                  '+'   : Result := FloatToStr(StrToFloat(Num1) + StrToFloat(Num2));
                  '-'   : Result := FloatToStr(StrToFloat(Num1) - StrToFloat(Num2));
                  '*'   : Result := FloatToStr(StrToFloat(Num1) * StrToFloat(Num2));
                  '/'   : Result := FloatToStr(StrToFloat(Num1) / StrToFloat(Num2));
                  'mod' : Result := IntToStr(StrToInt(Num1) mod StrToInt(Num2));
                  'x^y' :   begin
                              Number1 := StrToFloat(Num1);
                              Number2 := StrToFloat(Num2);
                              Result := FloatToStr(Power(Number1, Number2));
                            end;
                  'D>N'   : Result := baseToBase(Num1, 10, StrToInt(Num2));
                  'B>N'   : Result := baseToBase(Num1, 2, StrToInt(Num2));
                  'O>N'   : Result := baseToBase(Num1, 8, StrToInt(Num2));
                  'H>N'   : Result := baseToBase(Num1, 16, StrToInt(Num2));
                  'NRoot' : begin
                              Number1 := StrToFloat(Num1);
                              Number2 := StrToFloat(Num2);
                              Result := FloatToStr(Power(Number1, (1 / Number2)));
                            end;
                  'Log'   : begin
                              Number1 := StrToFloat(Num1);
                              Number2 := StrToFloat(Num2);
                              Result := FloatToStr(LogN(Number2, Number1));
                            end;
                  'Exp'   : begin
                              Number1 := StrToFloat(Num1);
                              if Number1 > 0 then
                                     begin
                                       Number2 := StrToFloat(Num2);
                                       Result := FloatToStr(Power(Number1, Number2));
                                     end;
                            end;
        else
          begin
               Result := '';
               MessageDlg('Operador inválido', mtInformation, [mbYes], 0);
               txtFieldResult.Text := '';
               pnlDatulator.Visible := false;
               pnlFunctions.Visible := false;
               pnlTrigonometry.Visible := false;
               pnlSimple.Visible := true;
               rdBtnSimpleCalculator.Checked := true;
          end;
        end;
    except
      On E: EConvertError Do
         begin
              Num1 := '';
              Num2 := '';
              Result := '';
         end;
    end;
    txtFieldResult.Text := Result;
end;

procedure TfrmMyCalculators.btnRisedToClick(Sender: TObject);
begin
     Num1 := txtFieldResult.Text;
     Operators := 'x^y';
     txtFieldResult.Text := '';
     pnlDatulator.Visible := false;
     pnlFunctions.Visible := false;
     pnlTrigonometry.Visible := false;
     pnlSimple.Visible := true;
     rdBtnSimpleCalculator.Checked := true;
end;

end.

end.

