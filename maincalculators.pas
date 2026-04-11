unit mainCalculators;

{$mode objfpc}{$H+}

interface

uses LazLogger, SysUtils, DateUtils, Forms, Controls, Dialogs, StdCtrls, Menus,
    Graphics, Classes, Crt, LCLType, ExtCtrls, Buttons, Math,
    baseConvert, MyCredits, Preferences, Help, DefaultTranslator, LCLTranslator,
    EditBtn, LocalizedForms, myResourceStrings, gettext, ErrorCatching,
    mydatefunctions, FileUtil, Dos, LCLIntF, ComCtrls, Windows;

type
    { procedure ColourChange;
          background #45494A/697374
          foreground #4A4645/747069
    }
    { TfrmMyCalculators }

    TfrmMyCalculators = class(TLocalizedForm)
      // INVISIBLE COMPONENTS
      SpBtnMainMenu: TSpeedButton;
      Timer1: TTimer;
      ImageList: TImageList;
      // MAIN MENU *************************************************************
      ppMainMenu: TPopupMenu;
      ppMnuMainSettings: TMenuItem;
      ppMnuMainHelp: TMenuItem;
      ppMnuMainCredits: TMenuItem;
      ppMnuMainExit: TMenuItem;
      // POPUP CALENDAR FROM ***************************************************
      ppMenuCalFrom: TPopupMenu;
      ppMenuGregorian: TMenuItem;
      ppMenuJulian: TMenuItem;
      ppMenuFrench: TMenuItem;
      ppMenuHebrew: TMenuItem;
      ppMenuChinese: TMenuItem;
      ppMenuArab: TMenuItem;
      // POPUP CALENDAR TO *****************************************************
      ppMenuCalTo: TPopupMenu;
      ppMenuGregorian1: TMenuItem;
      ppMenuJulian1: TMenuItem;
      ppMenuFrench1: TMenuItem;
      ppMenuHebrew1: TMenuItem;
      ppMenuChinese1: TMenuItem;
      ppMenuArab1: TMenuItem;
      // MAIN FORM *************************************************************
      stTxtBreadcrumbs: TStaticText;
      txtFieldResult: TEdit;
      // RADIO BUTTONS *********************************************************
      pnlCalculatorType: TPanel;
      rdBtnDateCalculator: TRadioButton;
      rdBtnTrigonometry: TRadioButton;
      rdBtnFunctions: TRadioButton;
      rdBtnSimpleCalculator: TRadioButton;
      // SIMPLE PANEL **********************************************************
      pnlSimple: TPanel;
      btnMemoryClear: TButton;               // First Simple button line
      btnMemoryPlus: TButton;
      btnMemoryMinus: TButton;
      btnClearAll: TButton;                  // Second Simple button line
      btnClearLastEntry: TButton;
      btnBackspace: TButton;                 // Third Simple button line
      btnPlusMinus: TButton;
      btnRemainder: TButton;
      btnAdd: TButton;
      btnSeven: TButton;                     // Fourth Simple button line
      btnEight: TButton;
      btnNine: TButton;
      btnMinus: TButton;
      btnFour: TButton;                      // Fifth Simple button line
      btnFive: TButton;
      btnSix: TButton;
      btnMultiply: TButton;
      btnOne: TButton;                       // Sixth Simple button line
      btnTwo: TButton;
      btnThree: TButton;
      btnDivide: TButton;
      btnZero: TButton;                      // Seventh Simple button line
      btnComma: TButton;
      btnCalculatorEquals: TButton;
      // FUNCTIONS PANEL *******************************************************
      pnlFunctions: TPanel;
      btnPercent: TButton;                   // First Functions button line
      btnPermilage: TButton;
      btnRaisedTo: TButton;
      btnDecToBase: TButton;
      btnXRoot: TButton;                     // Second Functions button line
      btnFactorial: TButton;
      btnFraction: TButton;
      btnBinToBase: TButton;
      btnPI: TButton;                        // Third Functions button line
      btnEulerConstant: TButton;
      btnTAU: TButton;
      btnOctToBase: TButton;
      btnExponential: TButton;               // Fourth Functions button line
      btnLog: TButton;
      btnHexToBase: TButton;
      btnCelsius: TButton;                   // Fifth Functions button line
      btnKgToLbs: TButton;
      btnLToGal: TButton;
      btnFahrenheit: TButton;                // Sixth Functions button line
      btnLbsToKg: TButton;
      btnGalToL: TButton;
      // TRIGONOMETRY PANEL ****************************************************
      pnlTrigonometry: TPanel;
      btnSin: TButton;                       // First Trig button line
      btnSinH: TButton;
      btnASin: TButton;
      btnASinH: TButton;
      btnCos: TButton;                       // Second Trig button line
      btnCosH: TButton;
      btnACos: TButton;
      btnACosH: TButton;
      btnTan: TButton;                       // Third Trig button line
      btnTanH: TButton;
      btnATan: TButton;
      btnATanH: TButton;
      btnCot: TButton;                       // Fourth Trig button line
      btnCotH: TButton;
      btnACot: TButton;
      btnHypothenuse: TButton;
      btnSecant: TButton;                    // Fifth Trig line of buttons
      btnCosecant: TButton;
      btnCyclesToRadians: TButton;           // Sixth Trig line of buttons
      btnDegreesRadians: TButton;
      btnDegreesGradians: TButton;
      btnGradiansRadians: TButton;
      btnRadiansToCycles: TButton;           // Seventh Trig line of buttons
      btnRadiansGradians: TButton;
      btnRadiansDegrees: TButton;
      btnGradiansDegrees: TButton;
      // DATE PANEL ************************************************************
      pnlDatulator: TPanel;
      dtEditPresent: TDateEdit;              // First Date button line
      lblConvertTo: TLabel;
      btnFromCalendar: TBitBtn;
      lblToCalendar: TLabel;
      btnToCalendar: TBitBtn;
      StTxtCalendarInput: TStaticText;       // Second Date button line
      btnConvertDate: TButton;               // Third Date button line
      StTxtCalendarOutput: TStaticText;      // Fourth Date button line
      lblStartDate: TLabel;                  // Fifth Date button line
      dtEditStartDate: TDateEdit;
      lblEndDate: TLabel;                    // Sixth Date button line
      dtEditEndDate: TDateEdit;
      StTxtDateCalculation: TStaticText;     // Seventh Date button line
      // STATUS BAR ************************************************************
      pnlStatusBar: TPanel;
      lblDate: TLabel;
      lblClock: TLabel;
      // SIMPLE PANEL **********************************************************
      procedure rdBtnSimpleCalculatorClick(Sender: TObject);
      procedure btnMemoryClearClick(Sender: TObject);      // First line
      procedure btnMemoryPlusClick(Sender: TObject);
      procedure btnMemoryMinusClick(Sender: TObject);
      procedure btnClearAllClick(Sender: TObject);         // Second line
      procedure btnClearLastEntryClick(Sender: TObject);
      procedure btnBackspaceClick(Sender: TObject);        // Third line
      procedure btnPlusMinusClick(Sender: TObject);
      procedure btnRemainderClick(Sender: TObject);
      procedure btnAddClick(Sender: TObject);
      procedure btnSevenClick(Sender: TObject);            // Fourth line
      procedure btnEightClick(Sender: TObject);
      procedure btnNineClick(Sender: TObject);
      procedure btnMinusClick(Sender: TObject);
      procedure btnFourClick(Sender: TObject);             // Fifth line
      procedure btnFiveClick(Sender: TObject);
      procedure btnSixClick(Sender: TObject);
      procedure btnMultiplyClick(Sender: TObject);
      procedure btnOneClick(Sender: TObject);              // Sixth line
      procedure btnTwoClick(Sender: TObject);
      procedure btnThreeClick(Sender: TObject);
      procedure btnDivideClick(Sender: TObject);
      procedure btnZeroClick(Sender: TObject);             // Seventh line
      procedure btnCommaClick(Sender: TObject);
      procedure btnCalculatorEqualsClick(Sender: TObject);
      // FUNCTIONS PANEL *******************************************************
      procedure rdBtnFunctionsClick(Sender: TObject);
      procedure btnPercentClick(Sender: TObject);          // First line
      procedure btnPermilageClick(Sender: TObject);
      procedure btnRaisedToClick(Sender: TObject);
      procedure btnDecToBaseClick(Sender: TObject);
      procedure btnXRootClick(Sender: TObject);            // Second line
      procedure btnFactorialClick(Sender: TObject);
      procedure btnFractionClick(Sender: TObject);
      procedure btnBinToBaseClick(Sender: TObject);
      procedure btnPIClick(Sender: TObject);               // Third line
      procedure btnEulerConstantClick(Sender: TObject);
      procedure btnTAUClick(Sender: TObject);
      procedure btnOctToBaseClick(Sender: TObject);
      procedure btnExponentialClick(Sender: TObject);      // Fourth line
      procedure btnLogClick(Sender: TObject);
      procedure btnHexToBaseClick(Sender: TObject);
                                                           // Fifth line
      procedure btnCelsiusClick(Sender: TObject);          // Sixth line
      procedure btnKgToLbsClick(Sender: TObject);
      procedure btnLToGalClick(Sender: TObject);
      procedure btnFahrenheitClick(Sender: TObject);       // Seventh line
      procedure btnLbsToKgClick(Sender: TObject);
      procedure btnGalToLClick(Sender: TObject);
      // TRIGONOMETRY PANEL ****************************************************
      procedure rdBtnTrigonometryClick(Sender: TObject);
      procedure btnSinClick(Sender: TObject);              // First line
      procedure btnSinHClick(Sender: TObject);
      procedure btnASinClick(Sender: TObject);
      procedure btnASinHClick(Sender: TObject);
      procedure btnCosClick(Sender: TObject);              // Second line
      procedure btnCosHClick(Sender: TObject);
      procedure btnACosClick(Sender: TObject);
      procedure btnACosHClick(Sender: TObject);
      procedure btnTanClick(Sender: TObject);              // Third line
      procedure btnTanHClick(Sender: TObject);
      procedure btnATanClick(Sender: TObject);
      procedure btnATanHClick(Sender: TObject);
      procedure btnCotClick(Sender: TObject);              // Fourth line
      procedure btnCotHClick(Sender: TObject);
      procedure btnACotClick(Sender: TObject);
      procedure btnHypothenuseClick(Sender: TObject);
      procedure btnSecantClick(Sender: TObject);           // Fifth line
      procedure btnCosecantClick(Sender: TObject);
      procedure btnCyclesToRadiansClick(Sender: TObject);  // Sixth line
      procedure btnDegreesRadiansClick(Sender: TObject);
      procedure btnDegreesGradiansClick(Sender: TObject);
      procedure btnRadiansGradiansClick(Sender: TObject);
      procedure btnRadiansToCyclesClick(Sender: TObject);  // Seventh line
      procedure btnRadiansDegreesClick(Sender: TObject);
      procedure btnGradiansDegreesClick(Sender: TObject);
      procedure btnGradiansRadiansClick(Sender: TObject);
      // DATE PANEL ************************************************************
      procedure rdBtnDateCalculatorClick(Sender: TObject);
      procedure btnFromCalendarClick(Sender: TObject);
      procedure btnToCalendarClick(Sender: TObject);
      procedure btnConvertDateClick(Sender: TObject);
      procedure dtEditStartDateChange(Sender: TObject);
      procedure dtEditEndDateChange(Sender: TObject);
      // MENUS *****************************************************************
      // Main menu
      procedure SpBtnMainMenuClick(Sender: TObject);
      procedure ppMainMenuPopup(Sender: TObject);
      procedure mnuCreditsClick(Sender: TObject);
      procedure mnuExitClick(Sender: TObject);
      procedure mnuHelpClick(Sender: TObject);
      procedure mnuPrefLangClick(Sender: TObject);
      // Popup Calendar from
      procedure ppMenuCalFromPopup(Sender: TObject);
      procedure ppMenuGregorianClick(Sender: TObject);
      procedure ppMenuJulianClick(Sender: TObject);
      procedure ppMenuFrenchClick(Sender: TObject);
      procedure ppMenuHebrewClick(Sender: TObject);
      procedure ppMenuChineseClick(Sender: TObject);
      procedure ppMenuArabClick(Sender: TObject);
      // Popup Calendar to
      procedure ppMenuCalToPopup(Sender: TObject);
      procedure ppMenuGregorian1Click(Sender: TObject);
      procedure ppMenuJulian1Click(Sender: TObject);
      procedure ppMenuFrench1Click(Sender: TObject);
      procedure ppMenuHebrew1Click(Sender: TObject);
      procedure ppMenuChinese1Click(Sender: TObject);
      procedure ppMenuArab1Click(Sender: TObject);
      // INITIALIZATIONS *******************************************************
      procedure FormCreate(Sender: TObject);
      procedure InitializeCalculatorTypePanelCaptions;
      procedure InitializeSimplePanelCaptions;
      procedure InitializeFunctionsCaptions;
      procedure InitializeTrigonometryCaptions;
      procedure InitializeDateCaptions;
      procedure InitializeCaptions;
      // OTHERS ****************************************************************
      procedure Timer1Timer(Sender: TObject);
      procedure FormKeyPress(Sender: TObject; var Key: word);
      procedure KeypadInput(Key: Word);
      procedure txtFieldResultChange(Sender: TObject);
  private
      const FINALCALC = true;
      var Num1, Num2, Operators, CurrentLang : String;
          CalculatorEquals : Double;
          Memory : extended;

      function GetSystemLanguage : String;
      procedure InitLanguagesMenu;                      // wp: Added
      procedure LanguageClick(Sender: TObject);         // wp: Added
      procedure ReturnToSimplePanel;
      procedure CleanUp(Final : boolean);

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
var KeyState: TKeyboardState;
begin
     dTEditPresent.Date := Now();
     dtEditPresent.Text := DateToStr(dtEditPresent.Date);
     dtEditStartDate.Date := Now();
     dtEditStartDate.Text := DateToStr(dtEditStartDate.Date);
     dtEditEndDate.Date := Now();
     dtEditEndDate.Text := DateToStr(dtEditEndDate.Date);
     UpdateTranslation(GetSystemLanguage);     // Default to system language
     CurrentLang := GetSystemLanguage;
     InitializeCaptions;                       // Avoid button captions in translation .po files
     ReturnToSimplePanel;
     StTxtCalendarOutput.Caption := '';        // Clear the final string field

     InitLanguagesMenu;            // wp: Added

    {$IFDEF WINDOWS}
    GetKeyboardState(KeyState);
    if KeyState[VK_NUMLOCK] = 0 then          // Check current NumLock state and toggle it on
    begin
        KeyState[VK_NUMLOCK] := 1;
        SetKeyboardState(KeyState);
        // Simulate key press and release to physically toggle the LED/state
        keybd_event(VK_NUMLOCK, $45, KEYEVENTF_EXTENDEDKEY, 0);
        keybd_event(VK_NUMLOCK, $45, KEYEVENTF_EXTENDEDKEY or KEYEVENTF_KEYUP, 0);
    end;
    {$ENDIF}
end;

// SIMPLE PANEL ****************************************************************
procedure TfrmMyCalculators.rdBtnSimpleCalculatorClick(Sender: TObject);
begin
    pnlSimple.Visible := true;
    rdBtnSimpleCalculator.Checked := true;
    pnlFunctions.Visible := false;
    pnlTrigonometry.Visible := false;
    pnlDatulator.Visible := false;
end;
// First line
procedure TfrmMyCalculators.btnMemoryClearClick(Sender: TObject);
begin
    Memory := 0;
end;
procedure TfrmMyCalculators.btnMemoryMinusClick(Sender: TObject);
begin
     if ((Memory <> 0) and (txtFieldResult.Text = '')) then
            txtFieldResult.Text := FloatToStr(Memory)
     else if txtFieldResult.Text <> '' then
            Memory := Memory - StrToFloat(txtFieldResult.Text);
end;
procedure TfrmMyCalculators.btnMemoryPlusClick(Sender: TObject);
begin
     if ((Memory <> 0) and (txtFieldResult.Text = '')) then
            txtFieldResult.Text := FloatToStr(Memory)
     else if txtFieldResult.Text <> '' then
            Memory := Memory + StrToFloat(txtFieldResult.Text);
end;
// Second line
procedure TfrmMyCalculators.btnClearAllClick(Sender: TObject);
begin
     CleanUp(not FINALCALC);
end;
procedure TfrmMyCalculators.btnClearLastEntryClick(Sender: TObject);
begin
    txtFieldResult.Text := '';
end;
// Third line
procedure TfrmMyCalculators.btnBackspaceClick(Sender: TObject);
begin
    txtFieldResult.Text := copy(txtFieldResult.Text, 0, length(txtFieldResult.Text) - 1);
end;
procedure TfrmMyCalculators.btnPlusMinusClick(Sender: TObject);
begin
    txtFieldResult.Text := FloatToStr(StrToFloat(txtFieldResult.Text) * -1);
end;
procedure TfrmMyCalculators.btnRemainderClick(Sender: TObject);
begin
    Num1 := txtFieldResult.Text;
    Operators := 'mod';
    stTxtBreadcrumbs.Caption := stTxtBreadcrumbs.Caption + ' ' + Operators + ' ';
    txtFieldResult.Text := '';
    ReturnToSimplePanel;
end;
procedure TfrmMyCalculators.btnAddClick(Sender: TObject);
begin
    Num1 := txtFieldResult.Text;
    Operators := '+';stTxtBreadcrumbs.Caption := stTxtBreadcrumbs.Caption + ' ' + Operators + ' ';
    txtFieldResult.Text := '';
    ReturnToSimplePanel;
end;
// Fourth line
procedure TfrmMyCalculators.btnSevenClick(Sender: TObject);
begin
    if txtFieldResult.Text = '' then txtFieldResult.Text := '7'
    else txtFieldResult.Text := txtFieldResult.Text + '7';
    stTxtBreadcrumbs.Caption := stTxtBreadcrumbs.Caption + ' ' + Operators + ' ';
end;
procedure TfrmMyCalculators.btnEightClick(Sender: TObject);
begin
    if txtFieldResult.Text = '' then txtFieldResult.Text := '8'
    else txtFieldResult.Text := txtFieldResult.Text + '8';
    stTxtBreadcrumbs.Caption := stTxtBreadcrumbs.Caption + txtFieldResult.Text;
end;
procedure TfrmMyCalculators.btnNineClick(Sender: TObject);
begin
    if txtFieldResult.Text = '' then txtFieldResult.Text := '9'
    else txtFieldResult.Text := txtFieldResult.Text + '9';
    stTxtBreadcrumbs.Caption := stTxtBreadcrumbs.Caption + txtFieldResult.Text;
end;
procedure TfrmMyCalculators.btnMinusClick(Sender: TObject);
begin
    Num1 := txtFieldResult.Text;
    Operators := '-';
    stTxtBreadcrumbs.Caption := stTxtBreadcrumbs.Caption + ' ' + Operators + ' ';
    txtFieldResult.Text := '';
    ReturnToSimplePanel;
end;
// Fifth line
procedure TfrmMyCalculators.btnFourClick(Sender: TObject);
begin
    if txtFieldResult.Text = '' then txtFieldResult.Text := '4'
    else txtFieldResult.Text := txtFieldResult.Text + '4';
    stTxtBreadcrumbs.Caption := stTxtBreadcrumbs.Caption + txtFieldResult.Text;
end;
procedure TfrmMyCalculators.btnFiveClick(Sender: TObject);
begin
    if txtFieldResult.Text = '' then txtFieldResult.Text := '5'
    else txtFieldResult.Text := txtFieldResult.Text + '5';
    stTxtBreadcrumbs.Caption := stTxtBreadcrumbs.Caption + txtFieldResult.Text;
end;
procedure TfrmMyCalculators.btnSixClick(Sender: TObject);
begin
    if txtFieldResult.Text = '' then txtFieldResult.Text := '6'
    else txtFieldResult.Text := txtFieldResult.Text + '6';
    stTxtBreadcrumbs.Caption := stTxtBreadcrumbs.Caption + txtFieldResult.Text;
end;
procedure TfrmMyCalculators.btnMultiplyClick(Sender: TObject);
begin
    Num1 := txtFieldResult.Text;
    Operators := '*';
    stTxtBreadcrumbs.Caption := stTxtBreadcrumbs.Caption + ' ' + Operators + ' ';
    txtFieldResult.Text := '';
    ReturnToSimplePanel;
end;
// Sixth line
procedure TfrmMyCalculators.btnOneClick(Sender: TObject);
begin
    if txtFieldResult.Text = '' then txtFieldResult.Text := '1'
    else txtFieldResult.Text := txtFieldResult.Text + '1';
    stTxtBreadcrumbs.Caption := stTxtBreadcrumbs.Caption + txtFieldResult.Text;
end;
procedure TfrmMyCalculators.btnTwoClick(Sender: TObject);
begin
    if txtFieldResult.Text = '' then txtFieldResult.Text := '2'
    else txtFieldResult.Text := txtFieldResult.Text + '2';
    stTxtBreadcrumbs.Caption := stTxtBreadcrumbs.Caption + txtFieldResult.Text;
end;
procedure TfrmMyCalculators.btnThreeClick(Sender: TObject);
begin
    if txtFieldResult.Text = '' then txtFieldResult.Text := '3'
    else txtFieldResult.Text := txtFieldResult.Text + '3';
    stTxtBreadcrumbs.Caption := stTxtBreadcrumbs.Caption + txtFieldResult.Text;
end;
procedure TfrmMyCalculators.btnDivideClick(Sender: TObject);
begin
    Num1 := txtFieldResult.Text;
    Operators := '/';
    stTxtBreadcrumbs.Caption := stTxtBreadcrumbs.Caption + ' ' + Operators + ' ';
    txtFieldResult.Text := '';
    ReturnToSimplePanel;
end;
// Seventh line
procedure TfrmMyCalculators.btnZeroClick(Sender: TObject);
begin
    if txtFieldResult.Text = '' then txtFieldResult.Text := '0'
    else txtFieldResult.Text := txtFieldResult.Text + '0';
    stTxtBreadcrumbs.Caption := stTxtBreadcrumbs.Caption + txtFieldResult.Text;
end;
procedure TfrmMyCalculators.btnCommaClick(Sender: TObject);
begin
    if txtFieldResult.Text = '' then
            txtFieldResult.Text := '0,'
    else if (Pos(',', txtFieldResult.Text) <> 0) then Exit
         else txtFieldResult.Text := txtFieldResult.Text + ',';
    stTxtBreadcrumbs.Caption := stTxtBreadcrumbs.Caption + txtFieldResult.Text;
end;
procedure TfrmMyCalculators.btnCalculatorEqualsClick(Sender: TObject);
var Number1, Number2 : extended;
begin
     if rdBtnSimpleCalculator.Checked then
        begin
            Num2 := txtFieldResult.Text;             // Second operand DO NOT TOUCH
            if Operators = 'x^y' then
               stTxtBreadcrumbs.Caption := Num1 + ' ^ ' + Num2 + ' ='
            else stTxtBreadcrumbs.Caption := Num1 + ' ' + Operators + ' ' + Num2 + ' =';
            txtFieldResult.Text := '';
            if not (IsNan(StrToFloat(Num1))) then
               Number1 := StrToFloat(Num1)
            else ErrMsg(emNotANumber, [Num1]);
            if (not IsNan(StrToFloat(Num2))) then
               Number2 := StrToFloat(Num2)
            else ErrMsg(emNotANumber, [Num2]);

            Num1 := FloatToStrF(Number1, ffNumber, 4, 2);
            Num2 := FloatToStrF(Number2, ffNumber, 4, 2);
            case Operators of
                      '+'     : CalculatorEquals := Number1 + Number2;
                      '-'     : CalculatorEquals := Number1 - Number2;
                      '*'     : CalculatorEquals := Number1 * Number2;
                      '/'     : if Number2 <> 0 then CalculatorEquals := Number1 / Number2
                                else
                                  begin
                                      ErrMsg(emDivisionByZero);
                                      CleanUp(not FINALCALC);
                                  end;
                      'mod'   : CalculatorEquals := Number1 mod Number2;
                      'x^y'   : CalculatorEquals := Power(Number1, Number2);
                      'D>N'   : CalculatorEquals := StrToFloat(baseToBase(Num1, 10, StrToInt(Num2)));
                      'B>N'   : CalculatorEquals := StrToFloat(baseToBase(Num1, 2, StrToInt(Num2)));
                      'O>N'   : CalculatorEquals := StrToFloat(baseToBase(Num1, 8, StrToInt(Num2)));
                      'H>N'   : CalculatorEquals := StrToFloat(baseToBase(Num1, 16, StrToInt(Num2)));
                      'NRoot' : CalculatorEquals := Power(Number1, (1 / Number2));
                      'Log'   : CalculatorEquals := LogN(Number2, Number1);
                      'Exp'   : if Number1 >= 0 then CalculatorEquals := Power(Number1, Number2)
                                else
                                  begin
                                      ErrMsg(emNegativePower);
                                      CleanUp(not FINALCALC);
                                  end;
                      'Hypo'  : CalculatorEquals := Hypot(Number2, Number1);
            else
              begin
                   MessageDlg(rsInvalidOperator, mtInformation, [mbYes], 1);
                   CleanUp(not FINALCALC);
                   ReturnToSimplePanel;
              end;
            end;
            txtFieldResult.Text := FloatToStrF(CalculatorEquals, ffNumber, 4, 2);
            CleanUp(FINALCALC);
            ReturnToSimplePanel;
        end;
end;

procedure TfrmMyCalculators.CleanUp(Final : boolean);
begin
   frmMyCalculators.CalculatorEquals := 0;
   frmMyCalculators.Operators := '';
   frmMyCalculators.Num1 := '0';
   frmMyCalculators.Num2 := '0';
   if not Final then
      begin
          stTxtBreadcrumbs.Caption := '';
          frmMyCalculators.txtFieldResult.Text := '';
      end;
end;
procedure TfrmMyCalculators.ReturnToSimplePanel;
begin
     frmMyCalculators.rdBtnSimpleCalculator.Checked := true;
     frmMyCalculators.pnlSimple.Visible := true;
     frmMyCalculators.pnlFunctions.Visible := false;
     frmMyCalculators.pnlTrigonometry.Visible := false;
     frmMyCalculators.pnlDatulator.Visible := false;;
end;
// FUNCTIONS PANEL *************************************************************
procedure TfrmMyCalculators.rdBtnFunctionsClick(Sender: TObject);
begin
    pnlSimple.Visible := false;
    pnlFunctions.Visible := true;
    rdBtnFunctions.Checked := true;
    pnlTrigonometry.Visible := false;
    pnlDatulator.Visible := false;
end;
// First line
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
procedure TfrmMyCalculators.btnRaisedToClick(Sender: TObject);
begin
     Num1 := txtFieldResult.Text;
     Operators := 'x^y';
     stTxtBreadcrumbs.Caption := stTxtBreadcrumbs.Caption + ' ' + '^ ';
     txtFieldResult.Text := '';
     ReturnToSimplePanel;
end;
procedure TfrmMyCalculators.btnDecToBaseClick(Sender: TObject);
begin
    Num1 := txtFieldResult.Text;
    Operators := 'D>N';
    txtFieldResult.Text := '';
    ReturnToSimplePanel;
end;
//Second line
procedure TfrmMyCalculators.btnXRootClick(Sender: TObject);
begin
    Num1 := txtFieldResult.Text;
     Operators := 'NRoot';
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
procedure TfrmMyCalculators.btnFractionClick(Sender: TObject);
begin
    txtFieldResult.Text := FloatToStr(1 / StrToInt(txtFieldResult.Text));
    ReturnToSimplePanel;
end;
procedure TfrmMyCalculators.btnBinToBaseClick(Sender: TObject);
begin
    Num1 := txtFieldResult.Text;
    Operators := 'B>N';
    txtFieldResult.Text := '';
    ReturnToSimplePanel;
end;
// Third line
procedure TfrmMyCalculators.btnPIClick(Sender: TObject);
begin
    txtFieldResult.Text := FloatToStr(Pi);
    ReturnToSimplePanel;
end;
procedure TfrmMyCalculators.btnEulerConstantClick(Sender: TObject);
begin
     txtFieldResult.Text := FloatToStr(E);
     ReturnToSimplePanel;
end;
procedure TfrmMyCalculators.btnTAUClick(Sender: TObject);
begin
     txtFieldResult.Text := FloatToStr(TAU);
     ReturnToSimplePanel;
end;
procedure TfrmMyCalculators.btnOctToBaseClick(Sender: TObject);
begin
    Num1 := txtFieldResult.Text;
    Operators := 'O>N';
    txtFieldResult.Text := '';
    ReturnToSimplePanel;
end;

// Fourth line
procedure TfrmMyCalculators.btnExponentialClick(Sender: TObject);
begin
     Num1 := txtFieldResult.Text;
     Operators := 'Exp';
     stTxtBreadcrumbs.Caption := stTxtBreadcrumbs.Caption + ' ' + Operators + ' ';
     txtFieldResult.Text := '';
     ReturnToSimplePanel;
end;
procedure TfrmMyCalculators.btnLogClick(Sender: TObject);
begin
    Num1 := txtFieldResult.Text;
    Operators := 'Log';
    stTxtBreadcrumbs.Caption := stTxtBreadcrumbs.Caption + ' ' + Operators + ' ';
    txtFieldResult.Text := '';
    ReturnToSimplePanel;
end;

procedure TfrmMyCalculators.btnHexToBaseClick(Sender: TObject);
begin
    Num1 := txtFieldResult.Text;
    Operators := 'H>N';
    txtFieldResult.Text := '';
    ReturnToSimplePanel;
end;
// Fifth line




// Sixth line
procedure TfrmMyCalculators.btnCelsiusClick(Sender: TObject);
begin
     txtFieldResult.Text := FloatToStr(StrToFloat(txtFieldResult.Text) * 1.8 + 32);
     ReturnToSimplePanel;
end;
procedure TfrmMyCalculators.btnKgToLbsClick(Sender: TObject);
begin
     txtFieldResult.Text := FloatToStr(StrToFloat(txtFieldResult.Text) * 2.2046226218);
     ReturnToSimplePanel;
end;
procedure TfrmMyCalculators.btnLToGalClick(Sender: TObject);
begin
    txtFieldResult.Text := FloatToStr(StrToFloat(txtFieldResult.Text) * 0.219969248299);
    ReturnToSimplePanel;
end;

// Seventh line
procedure TfrmMyCalculators.btnFahrenheitClick(Sender: TObject);
begin
     txtFieldResult.Text := FloatToStr((StrToFloat(txtFieldResult.Text) - 32) / 1.8);
     ReturnToSimplePanel;
end;
procedure TfrmMyCalculators.btnLbsToKgClick(Sender: TObject);
begin
    txtFieldResult.Text := FloatToStr(StrToFloat(txtFieldResult.Text) * 0.45359237);
    ReturnToSimplePanel;
end;
procedure TfrmMyCalculators.btnGalToLClick(Sender: TObject);
begin
     txtFieldResult.Text := FloatToStr((StrToFloat(txtFieldResult.Text) * 4.54609));
     ReturnToSimplePanel;
end;


// TRIGONOMETRY PANEL **********************************************************
procedure TfrmMyCalculators.rdBtnTrigonometryClick(Sender: TObject);
begin
    pnlSimple.Visible := false;
    pnlFunctions.Visible := false;
    pnlTrigonometry.Visible := true;
    rdBtnTrigonometry.Checked := true;
    pnlDatulator.Visible := false;
end;
// First line
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
// Second line
// Second line
procedure TfrmMyCalculators.btnCosClick(Sender: TObject);
var Angle, Sine, Cosine : Double;
begin
    Angle := StrToFloat(txtFieldResult.Text);
    SinCos(DegToRad(Angle), Sine, Cosine);
    txtFieldResult.Text := FloatToStr(Cosine);
    ReturnToSimplePanel;
end;
procedure TfrmMyCalculators.btnCosHClick(Sender: TObject);
begin
    txtFieldResult.Text := FloatToStr(CosH(StrToFloat(txtFieldResult.Text)));
    ReturnToSimplePanel;
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
// Third line
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
// Fourth line
procedure TfrmMyCalculators.btnCotClick(Sender: TObject);
begin
    txtFieldResult.Text := FloatToStr(CoTan(StrToFloat(txtFieldResult.Text)));
    ReturnToSimplePanel;
end;
procedure TfrmMyCalculators.btnCotHClick(Sender: TObject);
begin
     txtFieldResult.Text := FloatToStr((Math.Power(E, 2) + 1)/(Power(E, 2) - 1));
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
procedure TfrmMyCalculators.btnHypothenuseClick(Sender: TObject);
begin
    Num1 := txtFieldResult.Text;
    Operators := 'Hypo';
    txtFieldResult.Text := '';
    ReturnToSimplePanel;
end;
// Fifth line
procedure TfrmMyCalculators.btnSecantClick(Sender: TObject);
begin
    txtFieldResult.Text := FloatToStr(Secant(StrToFloat(txtFieldResult.Text)));
    ReturnToSimplePanel;
end;
procedure TfrmMyCalculators.btnCosecantClick(Sender: TObject);
begin
    txtFieldResult.Text := FloatToStr(coSecant(StrToFloat(txtFieldResult.Text)));
    ReturnToSimplePanel;
end;


// Sixth line
procedure TfrmMyCalculators.btnCyclesToRadiansClick(Sender: TObject);
begin
    txtFieldResult.Text := FloatToStr(CycleToRad(StrToFloat(txtFieldResult.Text)));
    ReturnToSimplePanel;
end;
procedure TfrmMyCalculators.btnDegreesRadiansClick(Sender: TObject);
begin
    txtFieldResult.Text := FloatToStr(DegToRad(StrToFloat(txtFieldResult.Text)));
    ReturnToSimplePanel;
end;
procedure TfrmMyCalculators.btnDegreesGradiansClick(Sender: TObject);
begin
    txtFieldResult.Text := FloatToStr(DegToGrad(StrToFloat(txtFieldResult.Text)));
    ReturnToSimplePanel;
end;
procedure TfrmMyCalculators.btnRadiansGradiansClick(Sender: TObject);
begin
    txtFieldResult.Text := FloatToStr(RadToGrad(StrToFloat(txtFieldResult.Text)));
    ReturnToSimplePanel;
end;
// Seveth line
procedure TfrmMyCalculators.btnRadiansToCyclesClick(Sender: TObject);
begin
    txtFieldResult.Text := FloatToStr(RadToCycle(StrToFloat(txtFieldResult.Text)));
    ReturnToSimplePanel;
end;
procedure TfrmMyCalculators.btnRadiansDegreesClick(Sender: TObject);
begin
    txtFieldResult.Text := FloatToStr(RadToDeg(StrToFloat(txtFieldResult.Text)));
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
// DATE PANEL ******************************************************************
procedure TfrmMyCalculators.rdBtnDateCalculatorClick(Sender: TObject);
begin
    pnlSimple.Visible := false;
    pnlFunctions.Visible := false;
    pnlTrigonometry.Visible := false;
    pnlDatulator.Visible := true;
    rdBtnDateCalculator.Checked := true;
end;
// First line
procedure TfrmMyCalculators.btnFromCalendarClick(Sender: TObject);
begin
    ppMenuCalFrom.PopUp;
end;
procedure TfrmMyCalculators.btnToCalendarClick(Sender: TObject);
begin
    ppMenuCalTo.PopUp;
end;
// Third line
procedure TfrmMyCalculators.btnConvertDateClick(Sender: TObject);
begin
     StTxtCalendarOutput.Caption := CalendarConversion(DTEditPresent.Date,
                                                           btnFromCalendar.ImageIndex,
                                                           btnToCalendar.ImageIndex,
                                                           CurrentLang);
end;
// Fifth line
procedure TfrmMyCalculators.dtEditStartDateChange(Sender: TObject);
begin
    StTxtDateCalculation.Caption := DateDifference(dtEditStartDate.Date, dtEditEndDate.Date);
end;
procedure TfrmMyCalculators.dtEditEndDateChange(Sender: TObject);
begin
    StTxtDateCalculation.Caption := DateDifference(dtEditStartDate.Date, dtEditEndDate.Date);
end;
// MENUS ***********************************************************************
// Main menu
procedure TfrmMyCalculators.SpBtnMainMenuClick(Sender: TObject);
begin
     ppMainMenu.PopUp;
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
procedure TfrmMyCalculators.mnuPrefLangClick(Sender: TObject);
begin
  frmPreferences.ShowModal;
end;
procedure TfrmMyCalculators.mnuHelpClick(Sender: TObject);
begin
  frmHelp.ShowModal;
end;
procedure TfrmMyCalculators.mnuCreditsClick(Sender: TObject);
begin
  frmCredits.ShowModal;
end;
procedure TfrmMyCalculators.mnuExitClick(Sender: TObject);
begin
  Close;
end;
// Menu Calendar from
procedure TfrmMyCalculators.ppMenuCalFromPopup(Sender: TObject);
begin
    ppMenuGregorian.Caption := rsStrGregorian;
    ppMenuJulian.Caption := rsStrJulian;
    ppMenuFrench.Caption := rsStrFrench;
    ppMenuHebrew.Caption := rsStrHebrew;
    ppMenuChinese.Caption := rsStrChinese;
    ppMenuArab.Caption := rsStrArab;
end;
procedure TfrmMyCalculators.ppMenuGregorianClick(Sender: TObject);
begin
     btnToCalendar.ImageIndex := 0;
end;
procedure TfrmMyCalculators.ppMenuJulianClick(Sender: TObject);
begin
     btnToCalendar.ImageIndex := 1;
end;
procedure TfrmMyCalculators.ppMenuFrenchClick(Sender: TObject);
begin
     btnToCalendar.ImageIndex := 2;
end;
procedure TfrmMyCalculators.ppMenuHebrewClick(Sender: TObject);
begin
     btnToCalendar.ImageIndex := 3;
end;
procedure TfrmMyCalculators.ppMenuChineseClick(Sender: TObject);
begin
     btnToCalendar.ImageIndex := 4;
end;
procedure TfrmMyCalculators.ppMenuArabClick(Sender: TObject);
begin
     btnToCalendar.ImageIndex := 5;
end;
// Menu Calendar to
procedure TfrmMyCalculators.ppMenuCalToPopup(Sender: TObject);
begin
    ppMenuGregorian1.Caption := rsStrGregorian;
    ppMenuJulian1.Caption := rsStrJulian;
    ppMenuFrench1.Caption := rsStrFrench;
    ppMenuHebrew1.Caption := rsStrHebrew;
    ppMenuChinese1.Caption := rsStrChinese;
    ppMenuArab1.Caption := rsStrArab;
end;
procedure TfrmMyCalculators.ppMenuGregorian1Click(Sender: TObject);
begin
    btnFromCalendar.ImageIndex := 0;
end;
procedure TfrmMyCalculators.ppMenuJulian1Click(Sender: TObject);
begin
    btnFromCalendar.ImageIndex := 1;
end;
procedure TfrmMyCalculators.ppMenuFrench1Click(Sender: TObject);
begin
    btnFromCalendar.ImageIndex := 2;
end;
procedure TfrmMyCalculators.ppMenuHebrew1Click(Sender: TObject);
begin
    btnFromCalendar.ImageIndex := 3;
end;
procedure TfrmMyCalculators.ppMenuChinese1Click(Sender: TObject);
begin
    btnFromCalendar.ImageIndex := 4;
end;
procedure TfrmMyCalculators.ppMenuArab1Click(Sender: TObject);
begin
    btnFromCalendar.ImageIndex := 5;
end;
// OTHERS **********************************************************************
procedure TfrmMyCalculators.Timer1Timer(Sender: TObject);
begin
    lblClock.Caption := FormatDateTime('hh:mm:ss', Time);
    lblDate.Caption := FormatDateTime('DDD, DD/MM/YY', Now());
end;
procedure TfrmMyCalculators.FormKeyPress(Sender: TObject; var Key: word);
begin
     KeypadInput(Key);
end;
procedure TfrmMyCalculators.KeypadInput(Key: Word);
begin
  case Key of
    48 : btnZero.Click;          // VK_NUMPAD0   Why doesn't it work?
    49 : btnOne.Click;           // VK_NUMPAD1   Why doesn't it work?
    50 : btnTwo.Click;           // VK_NUMPAD2   Why doesn't it work?
    51 : btnThree.Click;         // VK_NUMPAD3   Why doesn't it work?
    52 : btnFour.Click;          // VK_NUMPAD4   Why doesn't it work?
    53 : btnFive.Click;          // VK_NUMPAD5   Why doesn't it work?
    54 : btnSix.Click;           // VK_NUMPAD6   Why doesn't it work?
    55 : btnSeven.Click;         // VK_NUMPAD7   Why doesn't it work?
    56 : btnEight.Click;         // VK_NUMPAD8   Why doesn't it work?
    57 : btnNine.Click;          // VK_NUMPAD9   Why doesn't it work?
    43 : btnAdd.Click;           // VK_ADD       Why doesn't it work?
    VK_SEPARATOR : ;             // VK_SEPARATOR
    45 : btnMinus.Click;         // VK_SUBTRACT  Why doesn't it work?
    42 : btnMultiply.Click;      // VK_MULTIPLY  Why doesn't it work?
    47 : btnDivide.Click;        // VK_DIVIDE    Why doesn't it work?
    46 : btnComma.Click;         // VK_DECIMAL   Why doesn't it work?
    13 : btnCalculatorEquals.Click;        // VK_RETURN    Why doesn't it work?
    27 : btnClearAll.Click;
     8 : btnBackspace.Click;
  end;
end;

procedure TfrmMyCalculators.txtFieldResultChange(Sender: TObject);
begin
    if rdBtnDateCalculator.Checked then txtFieldResult.Text := '';
end;

// INITIALIZATIONS *************************************************************
function TfrmMyCalculators.GetSystemLanguage : String;
var
  Lang, FallbackLang: String;
begin
     Lang := '';
     FallbackLang := '';
     GetLanguageIDs(Lang, FallbackLang);
     Result := FallbackLang;
end;
procedure TfrmMyCalculators.LanguageClick(Sender: TObject);    { wp: Added }
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
  LanguageList: TStringList;
  FileName: String;
  po: String;
  mnu: TMenuItem;
begin
  LanguageList := TStringList.Create;
  try
    FileName := ChangeFileExt(ExtractFileName(Application.ExeName), '');

    FindAllFiles(LanguageList, Application.Location + 'languages', FileName + '.*.po', false);
    LanguageList.CustomSort(@CompareLang);   // Sort items by language
    for FileName in LanguageList do
    begin
      po := ExtractFileExt(ChangeFileExt(FileName, ''));
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
    LanguageList. Free;
  end;
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
     frmMyCalculators.btnCalculatorEquals.Caption := '=';
     frmMyCalculators.btnMemoryClear.Caption := 'MC';
     frmMyCalculators.btnMemoryPlus.Caption := 'M+';
     frmMyCalculators.btnMemoryMinus.Caption := 'M-';
     frmMyCalculators.btnClearAll.Caption := 'CA';
     frmMyCalculators.btnClearLastEntry.Caption := 'CE';
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


