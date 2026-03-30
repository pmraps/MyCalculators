unit mainCalculators;

{$mode objfpc}{$H+}

interface

uses
    SysUtils, DateUtils, Forms, Controls, Dialogs, StdCtrls, Menus, Graphics, Classes,
    Crt, LCLType, ExtCtrls, Buttons, DateTimePicker, Math, baseConvert,
    MyCredits, Preferences, Help, DefaultTranslator, LCLTranslator, LocalizedForms,
    myResourceStrings;

type

    { TfrmMyCalculators }

    TfrmMyCalculators = class(TLocalizedForm)
      btnACos: TButton;
      btnACosH: TButton;
      btnACot: TButton;
      BtnActualCalendar: TBitBtn;
      BtnActualCalendar1: TBitBtn;
      btnAdd: TButton;
      btnASin: TButton;
      btnASinH: TButton;
      btnATan: TButton;
      btnATanH: TButton;
      btnBackspace: TButton;
      btnClearEntry: TButton;
      btnCos: TButton;
      btnCoSecant: TButton;
      btnCosH: TButton;
      btnCotH: TButton;
      btnCTan: TButton;
      btnDecToBase: TButton;
      btnBinToBase: TButton;
      btnCelsius: TButton;
      btnClearEntry3: TButton;
      btnComma: TButton;
      btnDegreesGradians: TButton;
      btnDegreesRadians: TButton;
      btnGradiansDegrees: TButton;
      btnGradiansRadians: TButton;
      btnHypotenuse: TButton;
      btnMemoryMinus: TButton;
      btnOctToBase: TButton;
      btnDivide: TButton;
      btnEight: TButton;
      btnEulerConstant: TButton;
      btnExponential: TButton;
      btnFactorial: TButton;
      btnFahrenheit: TButton;
      btnFive: TButton;
      btnFour: TButton;
      btnFraction: TButton;
      btnLog: TButton;
      btnMemoryClear: TButton;
      btnMemoryMinus3: TButton;
      btnMemoryPlus: TButton;
      btnMinus: TButton;
      btnMultiply: TButton;
      btnNine: TButton;
      btnHexToBase: TButton;
      btnOne: TButton;
      btnPercent: TButton;
      btnPermilage: TButton;
      btnPI: TButton;
      btnPlusMinus: TButton;
      btnRadiansDegrees: TButton;
      btnRadiansGradians: TButton;
      btnRemainder: TButton;
      btnResult: TButton;
      btnResult1: TButton;
      btnRisedTo: TButton;
      btnSecant: TButton;
      btnSeven: TButton;
      btnSin: TButton;
      btnSinH: TButton;
      btnSix: TButton;
      btnTan: TButton;
      btnTanH: TButton;
      btnTAU: TButton;
      btnThree: TButton;
      btnTwo: TButton;
      btnXRoot: TButton;
      btnZero: TButton;
      btnCycleToRad: TButton;
      btnRadiansToCycles: TButton;
      DTPickerStartDate: TDateTimePicker;
      DTPickerEndDate: TDateTimePicker;
      DtTPickerEndDate: TDateTimePicker;
      DTPickerPresent: TDateTimePicker;
      DTPickerToCalendar: TDateTimePicker;
      ImageList: TImageList;
      lblToCalendar: TLabel;
      lblConvertTo: TLabel;
      lblStartDate: TLabel;
      lblEndDate: TLabel;
      MenuItem1: TMenuItem;
      mnuTodoList: TMenuItem;
      mnuEditSettings: TMenuItem;
      mnuHelpCredits: TMenuItem;
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
      StTxtCalendarConversion: TStaticText;
      StTxtDateCalculation: TStaticText;
      txtFieldResult: TEdit;
      mainMenu: TMainMenu;
      mnuMainFile: TMenuItem;
      mnuMainEdit: TMenuItem;
      mnuMainHelp: TMenuItem;
      procedure btnACosClick(Sender: TObject);
      procedure btnACosHClick(Sender: TObject);
      procedure btnACotClick(Sender: TObject);
      procedure BtnActualCalendarClick(Sender: TObject);
      procedure btnAddClick(Sender: TObject);
      procedure btnASinClick(Sender: TObject);
      procedure btnASinHClick(Sender: TObject);
      procedure btnATanClick(Sender: TObject);
      procedure btnATanHClick(Sender: TObject);
      procedure btnBackspaceClick(Sender: TObject);
      procedure btnBinToBaseClick(Sender: TObject);
      procedure btnCelsiusClick(Sender: TObject);
      procedure btnCoSecantClick(Sender: TObject);
      procedure btnCosHClick(Sender: TObject);
      procedure btnCotHClick(Sender: TObject);
      procedure btnCTanClick(Sender: TObject);
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
      procedure btnGradiansDegreesClick(Sender: TObject);
      procedure btnGradiansRadiansClick(Sender: TObject);
      procedure btnHexToBaseClick(Sender: TObject);
      procedure btnHypotenuseClick(Sender: TObject);
      procedure btnLogClick(Sender: TObject);
      procedure btnMemoryClear2Click(Sender: TObject);
      procedure btnMemoryMinus3Click(Sender: TObject);
      procedure btnMemoryPlus2Click(Sender: TObject);
      procedure btnOctToBaseClick(Sender: TObject);
      procedure btnPIClick(Sender: TObject);
      procedure btnRadiansDegreesClick(Sender: TObject);
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
      procedure btnSecantClick(Sender: TObject);
      procedure btnSevenClick(Sender: TObject);
      procedure btnSinClick(Sender: TObject);
      procedure btnSinHClick(Sender: TObject);
      procedure btnSixClick(Sender: TObject);
      procedure btnSqrNum1Click(Sender: TObject);
      procedure btnSqrtClick(Sender: TObject);
      procedure btnTanClick(Sender: TObject);
      procedure btnTanHClick(Sender: TObject);
      procedure btnTAUClick(Sender: TObject);
      procedure btnTenRaisedTo1Click(Sender: TObject);
      procedure btnThreeClick(Sender: TObject);
      procedure btnTwoClick(Sender: TObject);
      procedure btnXRootClick(Sender: TObject);
      procedure btnZeroClick(Sender: TObject);
      procedure btnCycleToRadClick(Sender: TObject);
      procedure btnRadiansToCyclesClick(Sender: TObject);
      procedure DTPickerEndDateChange(Sender: TObject);
      procedure DTPickerStartDateChange(Sender: TObject);
      procedure MenuItem1Click(Sender: TObject);
      procedure mnuEditSettingsClick(Sender: TObject);
      procedure mnuHelpCreditsClick(Sender: TObject);
      procedure mnuHelpHelpClick(Sender: TObject);
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

  protected

  public
      function CalendarConversion(Date : TDate; CalendarFrom, CalendarTo : Char) : String;
      function DateDifference(firstDate, secondDate : TDate) : String;
  end;

var
    frmMyCalculators: TfrmMyCalculators;
    Language : String;

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
     StTxtCalendarConversion.Caption := CalendarConversion(Now, 'G', 'G');
     DTPickerEndDate.Date := Now();
     DTPickerStartDate.Date := Now();
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

procedure TfrmMyCalculators.btnSinHClick(Sender: TObject);
begin
    txtFieldResult.Text := FloatToStr(SinH(StrToFloat(txtFieldResult.Text)));
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

procedure TfrmMyCalculators.btnTanClick(Sender: TObject);
begin
    txtFieldResult.Text := FloatToStr(Tan(StrToFloat(txtFieldResult.Text)));
end;

procedure TfrmMyCalculators.btnTanHClick(Sender: TObject);
begin
    txtFieldResult.Text := FloatToStr(TanH(StrToFloat(txtFieldResult.Text)));
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

procedure TfrmMyCalculators.btnCycleToRadClick(Sender: TObject);
begin
    txtFieldResult.Text := FloatToStr(CycleToRad(StrToFloat(txtFieldResult.Text)));
end;

procedure TfrmMyCalculators.btnRadiansToCyclesClick(Sender: TObject);
begin
    txtFieldResult.Text := FloatToStr(RadToCycle(StrToFloat(txtFieldResult.Text)));
end;

procedure TfrmMyCalculators.DTPickerEndDateChange(Sender: TObject);
begin
    StTxtDateCalculation.Caption := DateDifference(DTPickerStartDate.Date, DTPickerEndDate.Date);
end;

procedure TfrmMyCalculators.DTPickerStartDateChange(Sender: TObject);
begin
    StTxtDateCalculation.Caption := DateDifference(DTPickerStartDate.Date, DTPickerEndDate.Date);
end;

procedure TfrmMyCalculators.MenuItem1Click(Sender: TObject);
begin
    Application.Terminate;
end;

procedure TfrmMyCalculators.mnuEditSettingsClick(Sender: TObject);
begin
    frmPreferences.ShowModal;
end;

procedure TfrmMyCalculators.mnuHelpCreditsClick(Sender: TObject);
begin
    frmCredits.ShowModal;
end;

procedure TfrmMyCalculators.mnuHelpHelpClick(Sender: TObject);
begin
    frmHelp.ShowModal;
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
    StTxtCalendarConversion.Caption := CalendarConversion(DTPickerPresent.Date, 'G', 'J');
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

procedure TfrmMyCalculators.btnCoSecantClick(Sender: TObject);
begin
    txtFieldResult.Text := FloatToStr(coSecant(StrToFloat(txtFieldResult.Text)));
end;

procedure TfrmMyCalculators.btnCosHClick(Sender: TObject);
begin
    txtFieldResult.Text := FloatToStr(CosH(StrToFloat(txtFieldResult.Text)));
end;

procedure TfrmMyCalculators.btnCotHClick(Sender: TObject);
begin

end;

procedure TfrmMyCalculators.btnCTanClick(Sender: TObject);
begin
    txtFieldResult.Text := FloatToStr(CoTan(StrToFloat(txtFieldResult.Text)));
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

procedure TfrmMyCalculators.btnASinClick(Sender: TObject);
begin
    txtFieldResult.Text := FloatToStr(arcSin(StrToFloat(txtFieldResult.Text)));
end;

procedure TfrmMyCalculators.btnASinHClick(Sender: TObject);
begin
    txtFieldResult.Text := FloatToStr(arcSinH(StrToFloat(txtFieldResult.Text)));
end;

procedure TfrmMyCalculators.btnATanClick(Sender: TObject);
begin
    txtFieldResult.Text := FloatToStr(ArcTan(StrToFloat(txtFieldResult.Text)));
end;

procedure TfrmMyCalculators.btnATanHClick(Sender: TObject);
begin
    txtFieldResult.Text := FloatToStr(ArcTanH(StrToFloat(txtFieldResult.Text)));
end;

procedure TfrmMyCalculators.BtnActualCalendarClick(Sender: TObject);
begin
    ppMenuCalendars.PopUp;
end;

procedure TfrmMyCalculators.btnACosClick(Sender: TObject);
begin
    txtFieldResult.Text := FloatToStr(ArcCos(StrToFloat(txtFieldResult.Text)));
end;

procedure TfrmMyCalculators.btnACosHClick(Sender: TObject);
begin
    txtFieldResult.Text := FloatToStr(ArcosH(StrToFloat(txtFieldResult.Text)));
end;

procedure TfrmMyCalculators.btnACotClick(Sender: TObject);
var ArcCot : Float;
begin
     if StrToFloat(txtFieldResult.Text) > 0 then
    ArcCot := ArcTan(1 / StrToFloat(txtFieldResult.Text))
  else if StrToFloat(txtFieldResult.Text) < 0 then
    ArcCot:=pi + ArcTan(1 / StrToFloat(txtFieldResult.Text))
  else
    ArcCot := pi/2;
  txtFieldResult.Text := FloatToStr(ArcCot);
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
     Operators := 'Exp';
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

procedure TfrmMyCalculators.btnGradiansDegreesClick(Sender: TObject);
begin
     txtFieldResult.Text := FloatToStr(GradToDeg(StrToFloat(txtFieldResult.Text)));
end;

procedure TfrmMyCalculators.btnGradiansRadiansClick(Sender: TObject);
begin
     txtFieldResult.Text := FloatToStr(GradToRad(StrToFloat(txtFieldResult.Text)));
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

procedure TfrmMyCalculators.btnHypotenuseClick(Sender: TObject);
begin
    Num1 := txtFieldResult.Text;
    Operators := 'Hypo';
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

procedure TfrmMyCalculators.btnRadiansDegreesClick(Sender: TObject);
begin
    txtFieldResult.Text := FloatToStr(RadToDeg(StrToFloat(txtFieldResult.Text)));
end;

procedure TfrmMyCalculators.btnRadiansGradiansClick(Sender: TObject);
var temp : Float;
begin
    temp := StrToFloat(txtFieldResult.Text);
    txtFieldResult.Text := FloatToStr(RadToGrad(temp));
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
                  'Hypo'  : begin
                              Number1 := StrToFloat(Num1);
                              Number2 := StrToFloat(Num2);
                              Result := FloatToStr(Hypot(Number2, Number1));
                            end
        else
          begin
               Result := '';
               MessageDlg(rsInvalidOpera, mtInformation, [mbYes], 0);
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

procedure TfrmMyCalculators.btnSecantClick(Sender: TObject);
begin
    txtFieldResult.Text := FloatToStr(Secant(StrToFloat(txtFieldResult.Text)));
end;

function TfrmMyCalculators.CalendarConversion(Date : TDate; CalendarFrom, CalendarTo : Char) : String;
var SWDay, SDay, SMonth, SYear : String;
  WDay, NDay, NMonth, NYear : Word;
begin
     DecodeDate(Date, NYear, NMonth, NDay);
     if (CalendarFrom = 'G') and (CalendarTo = 'J') then                  // Gregorian to Julian
        begin
            if NDay > 13 then NDay := NDay - 13
            else begin
                   if NMonth = 2 then
                        if IsLeapYear(NYear) then NDay := NDay + 16
                        else NDay := NDay + 15
                   else NDay := NDay + 18;
                   NMonth := NMonth - 1;
                 end;
        end;

     if (CalendarFrom = 'J') and (CalendarTo = 'G') then                  // Julian to Gregorian
        begin
            if NDay <= 13 then NDay := NDay + 13
            else begin
                   if NMonth = 2 then
                        if IsLeapYear(NYear) then NDay := NDay + 15
                        else NDay := NDay + 14
                   else NDay := NDay + 17;
                   NMonth := NMonth - 1;
                 end;
        end;

     // Final string
     Date := EncodeDate(NYear, NMonth, NDay);
     WDay := DayOfWeek(Date);
     SWDay := IntToStr(WDay);
     case WDay of
          1 : SWDay := rsSunday;
          2 : SWDay := rsMonday;
          3 : SWDay := rsTuesday;
          4 : SWDay := rsWednesday;
          5 : SWDay := rsThursday;
          6 : SWDay := rsFriday;
          7 : SWDay := rsSaturday;
     end;
     case NDay of
           1  : SDay := rsOne;
           2  : SDay := rsTwo;
           3  : SDay := rsThree;
           4  : SDay := rsFour;
           5  : SDay := rsFive;
           6  : SDay := rsSix;
           7  : SDay := rsSeven;
           8  : SDay := rsEight;
           9  : SDay := rsNine;
           10 : SDay := rsTen;
           11 : SDay := rsEleven;
           12 : SDay := rsTwelve;
           13 : SDay := rsThirteen;
           14 : SDay := rsFourteen;
           15 : SDay := rsFifteen;
           16 : SDay := rsSixteen;
           17 : SDay := rsSeventeen;
           18 : SDay := rsEighteen;
           19 : SDay := rsNineteen;
           20 : SDay := rsTwenty;
           21 : SDay := rsTwentyOne;
           22 : SDay := rsTwentyTwo;
           23 : SDay := rsTwentyThree;
           24 : SDay := rsTwentyFour;
           25 : SDay := rsTwentyFive;
           26 : SDay := rsTwentySix;
           27 : SDay := rsTwentySeven;
           28 : SDay := rsTwentyEight;
           29 : SDay := rsTwentyNine;
           30 : SDay := rsThirty;
           31 : SDay := rsThirtyOne;
     end;
     case NMonth of
            1  : SMonth := rsJanuary;
            2  : SMonth := rsFebruary;
            3  : SMonth := rsMarch;
            4  : SMonth := rsApril;
            5  : SMonth := rsMay;
            6  : SMonth := rsJune;
            7  : SMonth := rsJuly;
            8  : SMonth := rsAugust;
            9  : SMonth := rsSeptember;
            10 : SMonth := rsOctober;
            11 : SMonth := rsNovember;
            12 : SMonth := rsDecember;
     end;
     SYear := IntToStr(NYear);

     CalendarConversion := SWDay + ', ' + SDay + rsOf + SMonth + rsOf + SYear;
end;

function TfrmMyCalculators.DateDifference(firstDate, secondDate : TDate) : String;
var firstDay, firstMonth, firstYear : Word;
    years, months, days : String;
begin
     if firstDate > secondDate then
         begin
              lblStartDate.Caption := rsEndDate;
                                        // Flag the inversion of order
              lblStartDate.Font.Color := clRed;                        // with a red label
              lblEndDate.Caption := rsStartDate;
         end
     else
         begin
              lblStartDate.Font.Color := clDefault;                    // Return labels to default colour
              lblStartDate.Caption := rsStartDate;
              lblEndDate.Caption := rsEndDate;
         end;
     PeriodBetween(firstDate, secondDate, firstYear, firstMonth, firstDay);
     years := IntToStr(firstYear);
     months := IntToStr(firstMonth);
     days := IntToStr(firstDay);
     if (days = '0') and (months = '0') and (years = '0') then DateDifference
         := years + rsDatesAreTheS
     else if (days = '0') and (months = '0') and (years = '1')
         then DateDifference := years + rsYear
          else if (days = '0') and (months = '0') and (years > '1')
              then DateDifference := years + rsYears
               else if (days = '0') and (months = '1') and (years = '0')
                   then DateDifference := months + ' '+ rsMonth
                    else if (days = '0') and (months = '1') and (years = '1')
                        then DateDifference := months + rsMonthAnd + years + rsYear
                         else if (days = '0') and (months = '1') and (years > '1') then DateDifference := months + rsMonthAnd + years + rsYears
                              else if (days = '0') and (months > '1') and (years = '0') then DateDifference := months + rsMonthAnd + years + rsYear
                                   else if (days = '0') and (months > '1') and (years = '1') then DateDifference := months + rsMonthAnd + years + rsYear
                                        else if (days = '0') and (months > '1') and (years > '1') then DateDifference := months + rsMonthAnd + years + rsYears
                                             else if (days = '1') and (months = '0') and (years = '0') then DateDifference := days + rsDay
                                                  else if (days = '1') and (months = '0') and (years = '1') then DateDifference := days + rsDayAnd + years + rsYear
                                                       else if (days = '1') and (months = '0') and (years > '1') then DateDifference := days + rsDayAnd + years + rsYears
                                                            else if (days = '1') and (months = '1') and (years = '0') then DateDifference := days + rsDayAnd + months + rsMonth
                                                                 else if (days = '1') and (months = '1') and (years = '1') then DateDifference := days + rsDay2 + months + rsMonthAnd + years + rsYear
                                                                      else if (days = '1') and (months = '1') and (years > '1') then DateDifference := days + rsDay2 + months + rsMonthAnd + years + rsYears
                                                                           else if (days = '1') and (months > '1') and (years = '0') then DateDifference := days + rsDayAnd +  months + rsMonths
                                                                                else if (days = '1') and (months > '1') and (years = '1') then DateDifference := days + rsDay2 + months + rsMonthAnd + years + rsYear
                                                                                     else if (days = '1') and (months > '1') and (years > '1') then DateDifference := days + rsDay2 + months + rsMonthAnd + years + rsYears
                                                                                          else if (days > '1') and (months = '0') and (years = '0') then DateDifference := days + rsDays2                                                                                               else if (days > '1') and (months = '0') and (years = '1') then DateDifference :=  days + rsDaysAnd + years  + rsYear
                                                                                                    else if (days > '1') and (months = '0') and (years > '1') then DateDifference := days + rsDaysAnd + years + rsYears
                                                                                                         else if (days > '1') and (months = '1') and (years = '0') then DateDifference := days + rsDaysAnd + months + rsMonth
                                                                                                              else if (days > '1') and (months = '1') and (years = '1') then DateDifference := days + rsDays + months + rsMonthAnd + years + rsYear
                                                                                                                   else if (days > '1') and (months = '1') and (years > '1') then DateDifference := days + rsDays + months + rsMonthAnd + years + rsYears
                                                                                                                        else if (days > '1') and (months > '1') and (years = '0') then DateDifference := days + rsDaysAnd + months + rsMonths
                                                                                                                             else if (days > '1') and (months > '1') and (years = '1') then DateDifference := days + rsDays + months + rsMonthAnd + years + rsYear
                                                                                                                                  else if (days > '1') and (months > '1') and (years > '1') then DateDifference := days + rsDays + months + rsMonthAnd + years + rsYears
end;

end.

