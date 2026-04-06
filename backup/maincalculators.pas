unit mainCalculators;

{$mode objfpc}{$H+}

interface

uses LazLogger,
     SysUtils, DateUtils, Forms, Controls, Dialogs, StdCtrls, Menus,
     Graphics, Classes, Crt, LCLType, ExtCtrls, Buttons, DateTimePicker, Math,
     baseConvert, MyCredits, Preferences, Help, DefaultTranslator, LCLTranslator,
     LocalizedForms, myResourceStrings, gettext, ErrorCatching, DateFunctions,
     FileUtil;

type
    { procedure ColourChange;
          background #45494A/697374
          foreground #4A4645/747069
    }
    { TfrmMyCalculators }

    TfrmMyCalculators = class(TLocalizedForm)
      btnACos: TButton;
      btnACosH: TButton;
      btnACot: TButton;
      BtnCalendarTo: TBitBtn;
      BtnCalendarFrom: TBitBtn;
      btnAdd: TButton;
      btnASin: TButton;
      btnASinH: TButton;
      btnATan: TButton;
      btnATanH: TButton;
      btnBackspace: TButton;
      btnClearEntry: TButton;
      btnCos: TButton;
      btnCosecant: TButton;
      btnCosH: TButton;
      btnCotH: TButton;
      btnCot: TButton;
      btnDecToBase: TButton;
      btnBinToBase: TButton;
      btnCelsius: TButton;
      btnClearEntry3: TButton;
      btnComma: TButton;
      btnDegreesGradians: TButton;
      btnDegreesRadians: TButton;
      btnGradiansDegrees: TButton;
      btnGradiansRadians: TButton;
      btnHypothenuse: TButton;
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
      btnRaisedTo: TButton;
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
      btnCyclesToRadians: TButton;
      btnRadiansToCycles: TButton;
      btnKgToLbs: TButton;
      btnLbsToKg: TButton;
      btnLToGal: TButton;
      btnGalToL: TButton;
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
      ppMnuMainSettings: TMenuItem;
      ppMnuMainHelp: TMenuItem;
      ppMnuMainCredits: TMenuItem;
      ppMnuMainExit: TMenuItem;
      ppMainMenu: TPopupMenu;
      ppMenuGregorian: TMenuItem;
      ppMenuJulian: TMenuItem;
      ppMenuFrench: TMenuItem;
      ppMenuHebrew: TMenuItem;
      ppMenuArab: TMenuItem;
      ppMenuChinese: TMenuItem;
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
      SpBtnMainMenu: TSpeedButton;
      StTxtCalendarConversion: TStaticText;
      StTxtDateCalculation: TStaticText;
      txtFieldResult: TEdit;
      procedure btnACosClick(Sender: TObject);
      procedure btnACosHClick(Sender: TObject);
      procedure btnACotClick(Sender: TObject);
      procedure BtnCalendarToClick(Sender: TObject);
      procedure btnAddClick(Sender: TObject);
      procedure btnASinClick(Sender: TObject);
      procedure btnASinHClick(Sender: TObject);
      procedure btnATanClick(Sender: TObject);
      procedure btnATanHClick(Sender: TObject);
      procedure btnBackspaceClick(Sender: TObject);
      procedure btnBinToBaseClick(Sender: TObject);
      procedure btnCelsiusClick(Sender: TObject);
      procedure btnCosecantClick(Sender: TObject);
      procedure btnCosHClick(Sender: TObject);
      procedure btnCotHClick(Sender: TObject);
      procedure btnCotClick(Sender: TObject);
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
      procedure btnGalToLClick(Sender: TObject);
      procedure btnGradiansDegreesClick(Sender: TObject);
      procedure btnGradiansRadiansClick(Sender: TObject);
      procedure btnHexToBaseClick(Sender: TObject);
      procedure btnHypothenuseClick(Sender: TObject);
      procedure btnKgToLbsClick(Sender: TObject);
      procedure btnLbsToKgClick(Sender: TObject);
      procedure btnLogClick(Sender: TObject);
      procedure btnLToGalClick(Sender: TObject);
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
      procedure btnRaisedToClick(Sender: TObject);
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
      procedure btnCyclesToRadiansClick(Sender: TObject);
      procedure btnRadiansToCyclesClick(Sender: TObject);
      procedure DTPickerEndDateChange(Sender: TObject);
      procedure DTPickerStartDateChange(Sender: TObject);
      procedure mnuCreditsClick(Sender: TObject);
      procedure mnuExitClick(Sender: TObject);
      procedure mnuHelpClick(Sender: TObject);
      procedure mnuPrefLangClick(Sender: TObject);
      procedure ppMainMenuPopup(Sender: TObject);
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
      procedure InitializeCalculatorTypePanelCaptions;
      procedure InitializeSimplePanelCaptions;
      procedure InitializeFunctionsCaptions;
      procedure InitializeTrigonometryCaptions;
      procedure InitializeDateCaptions;
      procedure InitializeCaptions;
      procedure FormCreate(Sender: TObject);
      function ConvertWDayToStr(Day : Integer) : String;
      function ConvertNDayToStr(NumberOfDay : Integer) : String;
      function ConvertMonthToStr(Month : Integer) : String;
      procedure SpBtnMainMenuClick(Sender: TObject);
  private
      Num1, Num2, Result, Operators : String;
      Memory : extended;

      function GetSystemLanguage : String;
      procedure InitLanguagesMenu;                      // wp: Added
      procedure LanguageClick(Sender: TObject);         // wp: Added

      procedure ReturnToSimplePanel;

  public
      function CalendarConversion(Date : TDate; CalendarFrom, CalendarTo : Char) : String;
      function DateDifference(firstDate, secondDate : TDate) : String;
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
     DTPickerPresent.Date := Now();
     DTPickerStartDate.Date := Now();
     DTPickerEndDate.Date := Now();
     UpdateTranslation(GetSystemLanguage);     // Default to system language
     CurrentLang := GetSystemLanguage;
     InitializeCaptions;                       // Avoid button captions in translation .po files
     ReturnToSimplePanel;
     StTxtCalendarConversion.Caption := CalendarConversion(Now(), 'G', 'G');

     InitLanguagesMenu;            // wp: Added
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
    ReturnToSimplePanel;
end;

procedure TfrmMyCalculators.btnSinHClick(Sender: TObject);
begin
    txtFieldResult.Text := FloatToStr(SinH(StrToFloat(txtFieldResult.Text)));
    ReturnToSimplePanel;
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
    ReturnToSimplePanel;
end;

procedure TfrmMyCalculators.btnTanHClick(Sender: TObject);
begin
    txtFieldResult.Text := FloatToStr(TanH(StrToFloat(txtFieldResult.Text)));
    ReturnToSimplePanel;
end;

procedure TfrmMyCalculators.btnTAUClick(Sender: TObject);
begin
     txtFieldResult.Text := FloatToStr(TAU);
     ReturnToSimplePanel;
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
     ReturnToSimplePanel;
end;

procedure TfrmMyCalculators.btnZeroClick(Sender: TObject);
begin
    if txtFieldResult.Text = '' then txtFieldResult.Text := '0'
    else txtFieldResult.Text := txtFieldResult.Text + '0';
end;

procedure TfrmMyCalculators.btnCyclesToRadiansClick(Sender: TObject);
begin
    txtFieldResult.Text := FloatToStr(CycleToRad(StrToFloat(txtFieldResult.Text)));
    ReturnToSimplePanel;
end;

procedure TfrmMyCalculators.btnRadiansToCyclesClick(Sender: TObject);
begin
    txtFieldResult.Text := FloatToStr(RadToCycle(StrToFloat(txtFieldResult.Text)));
    ReturnToSimplePanel;
end;

procedure TfrmMyCalculators.DTPickerEndDateChange(Sender: TObject);
begin
    StTxtDateCalculation.Caption := DateDifference(DTPickerStartDate.Date, DTPickerEndDate.Date);
end;

procedure TfrmMyCalculators.DTPickerStartDateChange(Sender: TObject);
begin
    StTxtDateCalculation.Caption := DateDifference(DTPickerStartDate.Date, DTPickerEndDate.Date);
end;

procedure TfrmMyCalculators.mnuCreditsClick(Sender: TObject);
begin
  frmCredits.ShowModal;
end;

procedure TfrmMyCalculators.mnuExitClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmMyCalculators.mnuHelpClick(Sender: TObject);
begin
  frmHelp.ShowModal;
end;

procedure TfrmMyCalculators.mnuPrefLangClick(Sender: TObject);
begin
  frmPreferences.ShowModal;
end;

procedure TfrmMyCalculators.ppMainMenuPopup(Sender: TObject);
begin
     ppMainMenu.Items[0].ImageIndex := 8;
     ppMainMenu.Items[0].Caption := rsStrSettingsDialog;
     ppMainMenu.Items[1].ImageIndex := 9;
     ppMainMenu.Items[1].Caption := rsStrHelpDialog;
     ppMainMenu.Items[2].ImageIndex := 7;
     ppMainMenu.Items[2].Caption := rsStrCreditsDialog;
     ppMainMenu.Items[3].ImageIndex := 12;
     ppMainMenu.Items[3].Caption := rsStrBtnExit;
end;

procedure TfrmMyCalculators.ppMenuArabClick(Sender: TObject);
begin
    BtnCalendarTo.ImageIndex := 5;
end;

procedure TfrmMyCalculators.ppMenuChineseClick(Sender: TObject);
begin
    BtnCalendarTo.ImageIndex := 4;
end;

procedure TfrmMyCalculators.ppMenuFrenchClick(Sender: TObject);
begin
    BtnCalendarTo.ImageIndex := 2;
end;

procedure TfrmMyCalculators.ppMenuGregorianClick(Sender: TObject);
begin
    BtnCalendarTo.ImageIndex := 0;
end;

procedure TfrmMyCalculators.ppMenuHebrewClick(Sender: TObject);
begin
    BtnCalendarTo.ImageIndex := 3;
end;

procedure TfrmMyCalculators.ppMenuJulianClick(Sender: TObject);
begin
    BtnCalendarTo.ImageIndex := 1;
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
    ReturnToSimplePanel;
end;

procedure TfrmMyCalculators.btnCelsiusClick(Sender: TObject);
begin
     txtFieldResult.Text := FloatToStr(StrToFloat(txtFieldResult.Text) * 1.8 + 32);
     ReturnToSimplePanel;
end;

procedure TfrmMyCalculators.btnCosecantClick(Sender: TObject);
begin
    txtFieldResult.Text := FloatToStr(coSecant(StrToFloat(txtFieldResult.Text)));
    ReturnToSimplePanel;
end;

procedure TfrmMyCalculators.btnCosHClick(Sender: TObject);
begin
    txtFieldResult.Text := FloatToStr(CosH(StrToFloat(txtFieldResult.Text)));
    ReturnToSimplePanel;
end;

procedure TfrmMyCalculators.btnCotHClick(Sender: TObject);
begin
     txtFieldResult.Text := FloatToStr((Math.Power(E, 2) + 1)/(Power(E, 2) - 1));
     ReturnToSimplePanel;
end;

procedure TfrmMyCalculators.btnCotClick(Sender: TObject);
begin
    txtFieldResult.Text := FloatToStr(CoTan(StrToFloat(txtFieldResult.Text)));
    ReturnToSimplePanel;
end;

procedure TfrmMyCalculators.btnDecToBaseClick(Sender: TObject);
begin
    Num1 := txtFieldResult.Text;
    Operators := 'D>N';
    txtFieldResult.Text := '';
    ReturnToSimplePanel;
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
    ReturnToSimplePanel;
end;

procedure TfrmMyCalculators.btnASinHClick(Sender: TObject);
begin
    txtFieldResult.Text := FloatToStr(arcSinH(StrToFloat(txtFieldResult.Text)));
    ReturnToSimplePanel;
end;

procedure TfrmMyCalculators.btnATanClick(Sender: TObject);
begin
    txtFieldResult.Text := FloatToStr(ArcTan(StrToFloat(txtFieldResult.Text)));
    ReturnToSimplePanel;
end;

procedure TfrmMyCalculators.btnATanHClick(Sender: TObject);
begin
    txtFieldResult.Text := FloatToStr(ArcTanH(StrToFloat(txtFieldResult.Text)));
    ReturnToSimplePanel;
end;

procedure TfrmMyCalculators.BtnCalendarToClick(Sender: TObject);
begin
    ppMenuCalendars.PopUp;
end;

procedure TfrmMyCalculators.btnACosClick(Sender: TObject);
begin
    txtFieldResult.Text := FloatToStr(ArcCos(StrToFloat(txtFieldResult.Text)));
    ReturnToSimplePanel;
end;

procedure TfrmMyCalculators.btnACosHClick(Sender: TObject);
begin
    txtFieldResult.Text := FloatToStr(ArcosH(StrToFloat(txtFieldResult.Text)));
    ReturnToSimplePanel;
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
  ReturnToSimplePanel;
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
    ReturnToSimplePanel;
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
     ReturnToSimplePanel;
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
     ReturnToSimplePanel;
end;

procedure TfrmMyCalculators.btnFactorialClick(Sender: TObject);
var factorial, temp : Integer;
begin
     factorial := StrToInt(txtFieldResult.Text);
     temp := factorial;
     repeat
       factorial := factorial * (temp - 1);
       Dec(temp);
     until temp = 1;
     txtFieldResult.Text := IntToStr(factorial);
     ReturnToSimplePanel;
end;

procedure TfrmMyCalculators.btnFahrenheitClick(Sender: TObject);
begin
     txtFieldResult.Text := FloatToStr((StrToFloat(txtFieldResult.Text) - 32) / 1.8);
     ReturnToSimplePanel;
end;

procedure TfrmMyCalculators.btnFractionClick(Sender: TObject);
begin
    txtFieldResult.Text := FloatToStr(1 / StrToInt(txtFieldResult.Text));
    ReturnToSimplePanel;
end;

procedure TfrmMyCalculators.btnGalToLClick(Sender: TObject);
begin
     txtFieldResult.Text := FloatToStr((StrToFloat(txtFieldResult.Text) * 4.54609));
     ReturnToSimplePanel;
end;

procedure TfrmMyCalculators.btnGradiansDegreesClick(Sender: TObject);
begin
     txtFieldResult.Text := FloatToStr(GradToDeg(StrToFloat(txtFieldResult.Text)));
     ReturnToSimplePanel;
end;

procedure TfrmMyCalculators.btnGradiansRadiansClick(Sender: TObject);
begin
     txtFieldResult.Text := FloatToStr(GradToRad(StrToFloat(txtFieldResult.Text)));
     ReturnToSimplePanel;
end;

procedure TfrmMyCalculators.btnHexToBaseClick(Sender: TObject);
begin
    Num1 := txtFieldResult.Text;
    Operators := 'H>N';
    txtFieldResult.Text := '';
    ReturnToSimplePanel;
end;

procedure TfrmMyCalculators.btnHypothenuseClick(Sender: TObject);
begin
    Num1 := txtFieldResult.Text;
    Operators := 'Hypo';
    txtFieldResult.Text := '';
    ReturnToSimplePanel;
end;

procedure TfrmMyCalculators.btnKgToLbsClick(Sender: TObject);
begin
     txtFieldResult.Text := FloatToStr(StrToFloat(txtFieldResult.Text) * 2.2046226218);
     ReturnToSimplePanel;
end;

procedure TfrmMyCalculators.btnLbsToKgClick(Sender: TObject);
begin
    txtFieldResult.Text := FloatToStr(StrToFloat(txtFieldResult.Text) * 0.45359237);
    ReturnToSimplePanel;
end;

procedure TfrmMyCalculators.btnLogClick(Sender: TObject);
begin
    Num1 := txtFieldResult.Text;
    Operators := 'Log';
    txtFieldResult.Text := '';
    ReturnToSimplePanel;
end;

procedure TfrmMyCalculators.btnLToGalClick(Sender: TObject);
begin
    txtFieldResult.Text := FloatToStr(StrToFloat(txtFieldResult.Text) * 0.219969248299);
    ReturnToSimplePanel;
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
    ReturnToSimplePanel;
end;

procedure TfrmMyCalculators.btnPIClick(Sender: TObject);
begin
    txtFieldResult.Text := FloatToStr(Pi);
    ReturnToSimplePanel;
end;

procedure TfrmMyCalculators.btnRadiansDegreesClick(Sender: TObject);
begin
    txtFieldResult.Text := FloatToStr(RadToDeg(StrToFloat(txtFieldResult.Text)));
    ReturnToSimplePanel;
end;

procedure TfrmMyCalculators.btnRadiansGradiansClick(Sender: TObject);
begin
    txtFieldResult.Text := FloatToStr(RadToGrad(StrToFloat(txtFieldResult.Text)));
    ReturnToSimplePanel;
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
    ReturnToSimplePanel;
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
     ReturnToSimplePanel;
end;

procedure TfrmMyCalculators.btnPermilageClick(Sender: TObject);
begin
     txtFieldResult.Text := FloatToStr(StrToFloat(txtFieldResult.Text) / 1000);
     ReturnToSimplePanel;
end;

procedure TfrmMyCalculators.btnPlusMinusClick(Sender: TObject);
begin
    txtFieldResult.Text := FloatToStr(StrToFloat(txtFieldResult.Text) * -1);
end;

procedure TfrmMyCalculators.btnDegreesRadiansClick(Sender: TObject);
begin
    txtFieldResult.Text := FloatToStr(DegToRad(StrToFloat(txtFieldResult.Text)));
    ReturnToSimplePanel;
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
               MessageDlg(rsInvalidOperator, mtInformation, [mbYes], 0);
               txtFieldResult.Text := '';
               ReturnToSimplePanel;
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

procedure TfrmMyCalculators.btnRaisedToClick(Sender: TObject);
begin
     Num1 := txtFieldResult.Text;
     Operators := 'x^y';
     txtFieldResult.Text := '';
     ReturnToSimplePanel;
end;

procedure TfrmMyCalculators.btnSecantClick(Sender: TObject);
begin
    txtFieldResult.Text := FloatToStr(Secant(StrToFloat(txtFieldResult.Text)));
    ReturnToSimplePanel;
end;

function TfrmMyCalculators.CalendarConversion(Date : TDate; CalendarFrom, CalendarTo : Char) : String;
var SWDay, SDay, SMonth, SYear : String;
    CalendarChar : Char;
    NDay, NMonth, NYear : Word;
begin
     StTxtCalendarConversion.Caption := '';
     // Choose calendar from
     case BtnCalendarFrom.ImageIndex of
               0 : begin
                    if BtnCalendarTo.ImageIndex = 1 then
                       begin
                         CalendarChar := 'J';
                         DecodeDate(GregorianConversion(Date, CalendarChar), NYear, NMonth, NDay);
                       end;
               end;
               1 : ;
               2 : ;
               3 : ;
               4 : ;
               5 : ;
     end;

     // Final string

     SWDay := ConvertWDayToStr(DayOfWeek(Date));
     SDay := ConvertNDayToStr(NDay);
     SMonth := ConvertMonthToStr(NMonth);
     SYear := IntToStr(NYear);

     { Is this needed?
          If 'FormatDateTime' works AND DTPickerPresent uses the chosen language format
          only one string should be needed!
          How to do it?
     }
     case CurrentLang of
          'de' : CalendarConversion := SWDay + ', ' + SDay + ' ' + SMonth + ' ' + SYear;
          'en' : CalendarConversion := SWDay + ', ' + SMonth + ', ' + SDay + ', ' + SYear;
          'es' : CalendarConversion := SWDay + ', el ' + SDay + rsOf + SMonth + rsOf + SYear;
          'fr' : CalendarConversion := 'Le ' + SWDay + ' ' + SDay + SMonth + SYear;
          'it' : CalendarConversion := SWDay + ', il ' + SDay + rsOf + SMonth + rsOf + SYear;
          'pt' : CalendarConversion := SWDay + ', ' + FormatDateTime(DefaultFormatSettings.LongDateFormat, DTPickerPresent.Date);
     end;

end;

function TfrmMyCalculators.DateDifference(firstDate, secondDate : TDate) : String;
var firstDay, firstMonth, firstYear : Word;
    years, months, days : String;
begin
     if firstDate > secondDate then
         begin
              lblStartDate.Caption := rsStrDateEndDate;         // Flag the inversion of order
              lblStartDate.Font.Color := clRed;                 // with a red label
              lblEndDate.Caption := rsStrDateStartDate;
         end
     else
         begin
              lblStartDate.Font.Color := clDefault;             // Return labels to default colour
              lblStartDate.Caption := rsStrDateStartDate;
              lblEndDate.Caption := rsStrDateEndDate;
         end;
     PeriodBetween(firstDate, secondDate, firstYear, firstMonth, firstDay);
     days := IntToStr(firstDay);
     months := IntToStr(firstMonth);
     years := IntToStr(firstYear);
     if (days = '0') and (months = '0') and (years = '0') then DateDifference := years + rsDatesAreEqual
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

function TfrmMyCalculators.GetSystemLanguage : String;
var
  Lang, FallbackLang: String;
begin
     Lang := '';
     FallbackLang := '';
     GetLanguageIDs(Lang, FallbackLang);
     Result := FallbackLang;
end;

procedure TfrmMyCalculators.ReturnToSimplePanel;
begin
     frmMyCalculators.rdBtnSimpleCalculator.Checked := true;
     frmMyCalculators.pnlSimple.Visible := true;
     frmMyCalculators.pnlFunctions.Visible := false;
     frmMyCalculators.pnlTrigonometry.Visible := false;
     frmMyCalculators.pnlDatulator.Visible := false;;
end;

{ wp: Added }
procedure TfrmMyCalculators.LanguageClick(Sender: TObject);
var
  mnu: TMenuItem;
  po: String;
begin
  if not (Sender is TMenuItem) then
    exit;
  mnu := TMenuItem(Sender);
  mnu.Checked := true;
  po := mnu.Caption;
  if po[1] = '.' then Delete(po, 1, 1);
  SetDefaultLang(po);       // Translate resource strings and insert them into the current form
  UpdateTranslation(po);    // Inserts translated strings into the other forms
  CurrentLang := po;
end;

{ wp: This is the compare function needed by the po file stringlist for sorting by
  language codes. }
function CompareLang(List: TStringList; Index1, Index2: Integer): Integer;
var
  lang1, lang2: String;
begin
  lang1 := ExtractFileExt(ChangeFileExt(List[Index1], ''));
  lang2 := ExtractFileExt(ChangeFileExt(List[Index2], ''));
  Result := CompareText(lang1, lang2);
end;

{ wp: Iterate over all po files and add a sub-menu item for each language to the
  ppMnuMainSettings menu item. }
procedure TfrmMyCalculators.InitLanguagesMenu;
var
  L: TStringList;
  fn: String;
  po: String;
  mnu: TMenuItem;
begin
  L := TStringList.Create;
  try
    fn := ChangeFileExt(ExtractFileName(Application.ExeName), '');

    FindAllFiles(L, Application.Location + 'languages', fn + '.*.po', false);
    L.CustomSort(@CompareLang);   // Sort items by language
    for fn in L do
    begin
      po := ExtractFileExt(ChangeFileExt(fn, ''));
      if po <> '' then
      begin
        if po[1] = '.' then Delete(po, 1, 1);
        // Create a submenu item for this language
        mnu := TMenuItem.Create(ppMainMenu);
        mnu.Caption := po;
        mnu.RadioItem := true;
        mnu.OnClick := @LanguageClick;
        // Add the item as a submenu to the mnuPrefLang item.
        ppMnuMainSettings.Add(mnu);
      end;
    end;
  finally
    L. Free;
  end;
end;

function TfrmMyCalculators.ConvertWDayToStr(Day : Integer) : String;
begin
  case Day of
          1 : Result := rsSunday;
          2 : Result := rsMonday;
          3 : Result := rsTuesday;
          4 : Result := rsWednesday;
          5 : Result := rsThursday;
          6 : Result := rsFriday;
          7 : Result := rsSaturday;
          else Result := '';
     end;
end;

function TfrmMyCalculators.ConvertNDayToStr(NumberOfDay : Integer) : String;
begin
  case NumberOfDay of
           1  : Result := rsOne;
           2  : Result := rsTwo;
           3  : Result := rsThree;
           4  : Result := rsFour;
           5  : Result := rsFive;
           6  : Result := rsSix;
           7  : Result := rsSeven;
           8  : Result := rsEight;
           9  : Result := rsNine;
           10 : Result := rsTen;
           11 : Result := rsEleven;
           12 : Result := rsTwelve;
           13 : Result := rsThirteen;
           14 : Result := rsFourteen;
           15 : Result := rsFifteen;
           16 : Result := rsSixteen;
           17 : Result := rsSeventeen;
           18 : Result := rsEighteen;
           19 : Result := rsNineteen;
           20 : Result := rsTwenty;
           21 : Result := rsTwentyOne;
           22 : Result := rsTwentyTwo;
           23 : Result := rsTwentyThree;
           24 : Result := rsTwentyFour;
           25 : Result := rsTwentyFive;
           26 : Result := rsTwentySix;
           27 : Result := rsTwentySeven;
           28 : Result := rsTwentyEight;
           29 : Result := rsTwentyNine;
           30 : Result := rsThirty;
           31 : Result := rsThirtyOne;
           else Result := '';
     end;
end;

function TfrmMyCalculators.ConvertMonthToStr(Month : Integer) : String;
begin
     case Month of
            1  : Result := rsJanuary;
            2  : Result := rsFebruary;
            3  : Result := rsMarch;
            4  : Result := rsApril;
            5  : Result := rsMay;
            6  : Result := rsJune;
            7  : Result := rsJuly;
            8  : Result := rsAugust;
            9  : Result := rsSeptember;
            10 : Result := rsOctober;
            11 : Result := rsNovember;
            12 : Result := rsDecember;
            else Result := '';
     end;
end;

procedure TfrmMyCalculators.SpBtnMainMenuClick(Sender: TObject);
begin
     ppMainMenu.PopUp;
end;

procedure TfrmMyCalculators.InitializeCaptions;
begin
     frmMyCalculators.InitializeCalculatorTypePanelCaptions;
     frmMyCalculators.InitializeSimplePanelCaptions;
     frmMyCalculators.InitializeFunctionsCaptions;
     frmMyCalculators.InitializeTrigonometryCaptions;
     frmMyCalculators.InitializeDateCaptions;
end;

procedure TfrmMyCalculators.InitializeCalculatorTypePanelCaptions;
begin
     frmMyCalculators.rdBtnSimpleCalculator.Caption := rsStrSimpleCaption;
     frmMyCalculators.rdBtnSimpleCalculator.Hint := rsStrSimpleHint;
     frmMyCalculators.rdBtnFunctions.Caption := 'f(x)';
     frmMyCalculators.rdBtnFunctions.Hint := rsStrMiscHint;
     frmMyCalculators.rdBtnTrigonometry.Caption := 'Trig';
     frmMyCalculators.rdBtnTrigonometry.Hint := rsStrTrigonometricHint;
     frmMyCalculators.rdBtnDateCalculator.Caption := rsStrDateCalcCaption;
     frmMyCalculators.rdBtnDateCalculator.Hint := rsStrDateCalcHint;
end;

procedure TfrmMyCalculators.InitializeSimplePanelCaptions;
begin
     frmMyCalculators.btnResult.Caption := '=';
     frmMyCalculators.btnMemoryClear.Caption := 'MC';
     frmMyCalculators.btnMemoryPlus.Caption := 'M+';
     frmMyCalculators.btnMemoryMinus.Caption := 'M-';
     frmMyCalculators.btnClearEntry.Caption := 'CA';
     frmMyCalculators.btnBackspace.Caption := '';
     frmMyCalculators.btnPlusMinus.Caption := '±';
     frmMyCalculators.btnRemainder.Caption := rsStrRemainder;
     frmMyCalculators.btnMinus.Caption := '-';
     frmMyCalculators.btnAdd.Caption := '+';
     frmMyCalculators.btnMultiply.Caption := '*';
     frmMyCalculators.btnDivide.Caption := '/';
     frmMyCalculators.btnComma.Caption := '.';
     frmMyCalculators.btnNine.Caption := '9';
     frmMyCalculators.btnEight.Caption := '8';
     frmMyCalculators.btnSeven.Caption := '7';
     frmMyCalculators.btnSix.Caption := '6';
     frmMyCalculators.btnFive.Caption := '5';
     frmMyCalculators.btnFour.Caption := '4';
     frmMyCalculators.btnThree.Caption := '3';
     frmMyCalculators.btnTwo.Caption := '2';
     frmMyCalculators.btnOne.Caption := '1';
     frmMyCalculators.btnZero.Caption := '0';
end;

procedure TfrmMyCalculators.InitializeFunctionsCaptions;
begin
     frmMyCalculators.btnPercent.Caption := '%';
     frmMyCalculators.btnXRoot.Caption := '';
     frmMyCalculators.btnFactorial.Caption := 'n!';
     frmMyCalculators.btnPI.Caption := 'π';
     frmMyCalculators.btnFraction.Caption := '1 / x';
     frmMyCalculators.btnPermilage.Caption := '‰';
     frmMyCalculators.btnRaisedTo.Caption := 'x^y';
     frmMyCalculators.btnEulerConstant.Caption := 'e';
     frmMyCalculators.btnDecToBase.Caption := 'Dec > N';
     frmMyCalculators.btnBinToBase.Caption := 'Bin > N';
     frmMyCalculators.btnOctToBase.Caption := 'Oct > N';
     frmMyCalculators.btnHexToBase.Caption := 'Hex > N';
     frmMyCalculators.btnCelsius.Caption := 'Cº';
     frmMyCalculators.btnFahrenheit.Caption := 'Fº';
     frmMyCalculators.btnTAU.Caption := '𝛕';
     frmMyCalculators.btnExponential.Caption := 'Exp';
     frmMyCalculators.btnLog.Caption := 'Log';
     frmMyCalculators.btnCyclesToRadians.Caption := rsStrCycToRad;
     frmMyCalculators.btnRadiansToCycles.Caption := rsStrRadToCyc;
     frmMyCalculators.btnKgToLbs.Caption := 'Kg - Lbs';
     frmMyCalculators.btnLbsToKg.Caption := 'Lbs - Kg';
     frmMyCalculators.btnLToGal.Caption := 'L - Gal';
     frmMyCalculators.btnGalToL.Caption := 'Gal - L';
end;

procedure TfrmMyCalculators.InitializeTrigonometryCaptions;
begin
     frmMyCalculators.btnSin.Caption := rsStrSin;
     frmMyCalculators.btnSinH.Caption := rsStrSinH;
     frmMyCalculators.btnASin.Caption := rsStrASin;
     frmMyCalculators.btnASinH.Caption := rsStrASinH;
     frmMyCalculators.btnCos.Caption := 'Cos';
     frmMyCalculators.btnCosH.Caption := 'CosH';
     frmMyCalculators.btnACos.Caption := 'ACos';
     frmMyCalculators.btnACosH.Caption := 'ACosH';
     frmMyCalculators.btnTan.Caption := 'Tan';
     frmMyCalculators.btnTanH.Caption := 'TanH';
     frmMyCalculators.btnATan.Caption := 'ATan';
     frmMyCalculators.btnATanH.Caption := 'ATanH';
     frmMyCalculators.btnCot.Caption := 'Cot';
     frmMyCalculators.btnCotH.Caption := 'CotH';
     frmMyCalculators.btnACot.Caption := 'ACot';
     frmMyCalculators.btnSecant.Caption := 'Sec';
     frmMyCalculators.btnCosecant.Caption := 'CSec';
     frmMyCalculators.btnHypothenuse.Caption := rsStrHypothenuse;
     frmMyCalculators.btnDegreesRadians.Caption := rsStrDegToRad;
     frmMyCalculators.btnDegreesGradians.Caption := rsStrDegToGrad;
     frmMyCalculators.btnRadiansDegrees.Caption := rsStrRadToDeg;
     frmMyCalculators.btnRadiansGradians.Caption := 'Rad-Grad';
     frmMyCalculators.btnGradiansDegrees.Caption := rsStrGradToDeg;
     frmMyCalculators.btnGradiansRadians.Caption := 'Grad-Rad';

end;

procedure TfrmMyCalculators.InitializeDateCaptions;
begin
     frmMyCalculators.lblStartDate.Caption := rsStrDateStartDate;
     frmMyCalculators.lblEndDate.Caption := rsStrDateEndDate;
     frmMyCalculators.lblConvertTo.Caption := rsStrDateConvert;
     frmMyCalculators.lblToCalendar.Caption := rsStrDateTo;
end;

end.


