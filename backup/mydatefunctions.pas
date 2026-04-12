unit mydatefunctions;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Graphics, DateUtils, Dialogs,
  ErrorCatching, resourcestrings;

type
  TFrenchRepublicanDate = record
    Year: integer;
    Month: integer;  // 1-12 = regular months, 13 = complementary days
    Day: integer;
    MonthName: string;
    DayName: string;
  end;

  THebrewDate = record
    Year: integer;
    Month: integer;
    Day: integer;
  end;

function DaysInMonth(Month, Year: integer): integer;
function GregorianToDayNumber(Day, Month, Year: integer): integer;
function IsHebrewLeapYear(Year: integer): boolean;
function HebrewDaysInMonth(Month, Year: integer): integer;
function DayNumberToHebrew(DayNum: integer): THebrewDate;
function CalendarConversion(DateFrom: TDate; CalendarFrom, CalendarTo: byte;
  CurrentLang: string): string;
function DateDifference(FirstDate, SecondDate: TDate): string;
function FormatDateString(DateFrom: TDate; CurrentLang: string; Error: boolean): string;

function GregorianToRepublican(AYear, AMonth, ADay: integer): TFrenchRepublicanDate;
function RepublicanDateToStr(ADate: TFrenchRepublicanDate): string;
function GregorianToHebrew(DateFrom: TDate): THebrewDate;
function FormatHebrewDate(HebrewDate: THebrewDate; const DateFormat: string): string;
//******************************************************************************
function GregorianToArab(DateFrom: TDate): TDate;
function GregorianToChinese(DateFrom: TDate): TDate;

function JulianToHebrew(DateFrom: TDate): TDate;
function JulianToArab(DateFrom: TDate): TDate;
function JulianToChinese(DateFrom: TDate): TDate;

function FrenchToGregorian(DateFrom: TDate): TDate;
function FrenchToHebrew(DateFrom: TDate): TDate;
function FrenchToArab(DateFrom: TDate): TDate;
function FrenchToChinese(DateFrom: TDate): TDate;
function FindFrenchExtraDays(FYear: integer): integer;

function HebrewToGregorian(DateFrom: TDate): TDate;
function HebrewToJulian(DateFrom: TDate): TDate;
function HebrewToFrench(DateFrom: TDate): TDate;
function HebrewToArab(DateFrom: TDate): TDate;
function HebrewToChinese(DateFrom: TDate): TDate;

function ArabToGregorian(DateFrom: TDate): TDate;
function ArabToJulian(DateFrom: TDate): TDate;
function ArabToFrench(DateFrom: TDate): TDate;
function ArabToHebrew(DateFrom: TDate): TDate;
function ArabToChinese(DateFrom: TDate): TDate;

function ChineseToGregorian(DateFrom: TDate): TDate;
function ChineseToJulian(DateFrom: TDate): TDate;
function ChineseToFrench(DateFrom: TDate): TDate;
function ChineseToHebrew(DateFrom: TDate): TDate;
function ChineseToArab(DateFrom: TDate): TDate;

function ConvertWDayToStr(Day: integer): string;
function ConvertNDayToStr(NumberOfDay: integer): string;
function ConvertMonthToStr(Month: integer): string;

var
  WrongDate: boolean = False;

implementation

uses mainCalculators;

const
  REPUBLICAN_MONTHS: array[1..13] of string = (
    'Vendémiaire', 'Brumaire', 'Frimaire',
    'Nivôse', 'Pluviôse', 'Ventôse',
    'Germinal', 'Floréal', 'Prairial',
    'Messidor', 'Thermidor', 'Fructidor',
    'Jours complémentaires'
    );

  COMPLEMENTARY_DAYS: array[1..6] of string = (
    'Jour de la Vertu',
    'Jour du Génie',
    'Jour du Travail',
    'Jour de l''Opinion',
    'Jour des Récompenses',
    'Jour de la Révolution'  // Only in Sansculottides years
    );

  HEBREWMONTHNAMES: array[1..13] of string = (
    'Tishrei',
    'Cheshvan',
    'Kislev',
    'Tevet',
    'Shevat',
    'Adar',
    'Nisan',
    'Iyar',
    'Sivan',
    'Tammuz',
    'Av',
    'Elul',
    'Adar II'
    );

  HEBREWMONTHNAMESSHORT: array[1..13] of string = (
    'Tis',
    'Che',
    'Kis',
    'Tet',
    'She',
    'Ada',
    'Nis',
    'Iya',
    'Siv',
    'Tam',
    'Av',
    'Elu',
    'Ad2'
    );

function DaysInMonth(Month, Year: integer): integer;
const
  DaysPerMonth: array[1..12] of integer =
    (31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31);
begin
  Result := DaysPerMonth[Month];
  if (Month = 2) and IsLeapYear(Year) then
    Inc(Result);
end;

function GregorianToDayNumber(Day, Month, Year: integer): integer;
var
  i: integer;
begin
  Result := Day;
  for i := 1 to Month - 1 do
    Inc(Result, DaysInMonth(i, Year));                                        // Days in current year
  Inc(Result, (Year - 1) * 365);                                              // Days in previous years from 0
  Inc(Result, (Year - 1) div 4 - (Year - 1) div 100 + (Year - 1) div 400);
end;

function IsHebrewLeapYear(Year: integer): boolean;
begin
  Result := ((Year * 7 + 1) mod 19) < 7;
end;

function HebrewDaysInMonth(Month, Year: integer): integer;
begin
  case Month of
    1, 3, 5, 7, 10: Result := 30;
    2, 4, 6, 8, 9: Result := 29;
    11: Result := 30;
    12: if IsHebrewLeapYear(Year) then Result := 29 else Result := 29;
    13: Result := 29;
    else
      Result := 0;
  end;
end;

function DayNumberToHebrew(DayNum: integer): THebrewDate;
const
  HebrewEpoch = 347997; // Julian day number for Hebrew date 1/1/1
  RABIHALAFTACOUNT = 3761;
var
  JulianDay: integer;
  Year, Month, Day: integer;
  DaysInYear: integer;
begin
  JulianDay := DayNum + HebrewEpoch;

  // Estimate Hebrew year
  Year := (JulianDay * 19 - 7) div 6939;
  //Year := RABIHALAFTACOUNT + CurrentYear - 1;

  // Refine year calculation
  while True do
  begin
    DaysInYear := 0;
    for Month := 1 to 13 do
    begin
      if (Month = 13) and not IsHebrewLeapYear(Year) then
        Continue;
      Inc(DaysInYear, HebrewDaysInMonth(Month, Year));
    end;

    if JulianDay >= Year * 365 + (Year div 19) * 7 then
      Break;
    Dec(Year);
  end;

  // Calculate month and day
  Month := 1;
  Day := JulianDay;

  while Day > HebrewDaysInMonth(Month, Year) do
  begin
    Dec(Day, HebrewDaysInMonth(Month, Year));
    Inc(Month);
    if (Month = 13) and not IsHebrewLeapYear(Year) then
      Inc(Month);
  end;

  Result.Year := Year;
  Result.Month := Month;
  Result.Day := Day;
end;

function CalendarConversion(DateFrom: TDate; CalendarFrom, CalendarTo: byte;
  CurrentLang: string): string;
var
  NYear, NMonth, NDay: word;
begin
  frmMyCalculators.StTxtCalendarInput.Caption :=
    FormatDateString(DateFrom, CurrentLang, WrongDate);
  case CalendarFrom of
    0: begin
      if CalendarTo = 2 then
      begin
        DecodeDate(DateFrom, NYear, NMonth, NDay);
        Result := RepublicanDateToStr(GregorianToRepublican(NYear, NMonth, NDay));
      end
      else if CalendarTo = 3 then
        Result := FormatHebrewDate(GregorianToHebrew(DateFrom), '%d %B %Y')
      else if CalendarTo = 4 then
        Result := FormatDateString(GregorianToArab(DateFrom), CurrentLang, WrongDate)
      else
        Result := FormatDateString(GregorianToChinese(DateFrom), CurrentLang, WrongDate);
    end;
    1: if CalendarTo = 3 then
        Result := FormatDateString(JulianToHebrew(DateFrom), CurrentLang, WrongDate);
    2: if CalendarTo = 0 then
        Result := FormatDateString(FrenchToGregorian(DateFrom), CurrentLang, WrongDate);
    3: if CalendarTo = 0 then
        Result := FormatDateString(HebrewToGregorian(DateFrom), CurrentLang, WrongDate);
    4: if CalendarTo = 0 then
        Result := FormatDateString(ArabToGregorian(DateFrom), CurrentLang, WrongDate);
    5: if CalendarTo = 0 then
        Result := FormatDateString(ChineseToGregorian(DateFrom), CurrentLang, WrongDate);
    else
      ErrMsg(emCalendarUnavailable);
  end;
end;

function FormatDateString(DateFrom: TDate; CurrentLang: string; Error: boolean): string;
var
  SWDay, SDay, SMonth, SYear: string;
  NDay, NMonth, NYear: word;
begin
  if not Error then
  begin
    DecodeDate(DateFrom, NYear, NMonth, NDay);
    SWDay := ConvertWDayToStr(DayOfWeek(DateFrom));
    SDay := ConvertNDayToStr(NDay);
    SMonth := ConvertMonthToStr(NMonth);
    SYear := IntToStr(NYear);

             { Is this needed? If 'FormatDateTime' works AND DTPickerPresent uses the chosen language format
               only one string should be needed! How to do it? }
    case CurrentLang of
      'de': Result := SWDay + ', ' + SDay + ' ' + SMonth + ' ' + SYear;
      'en': Result := SWDay + ', ' + SMonth + ', ' + SDay + ', ' + SYear;
      'es': Result := SWDay + ', el ' + SDay + rsOf + SMonth + rsOf + SYear;
      'fr': Result := 'Le ' + SWDay + ' ' + SDay + SMonth + SYear;
      'it': Result := SWDay + ', il ' + SDay + rsOf + SMonth + rsOf + SYear;
      'pt': Result := SWDay + ', ' + SDay + rsOf + SMonth + rsOf + SYear
      else
        Result := 'Invalid date';
    end;
  end;
end;

function DateDifference(FirstDate, SecondDate: TDate): string;
var
  firstDay, firstMonth, firstYear: word;
  years, months, days: string;
begin
  if FirstDate > SecondDate then
  begin
    frmMyCalculators.lblStartDate.Caption := rsStrDateEndDate;
    // Flag the inversion of order
    frmMyCalculators.lblStartDate.Font.Color := clRed;
    // with a red label
    frmMyCalculators.lblEndDate.Caption := rsStrDateStartDate;
  end
  else
  begin
    frmMyCalculators.lblStartDate.Font.Color := clDefault;
    // Return labels to default colour
    frmMyCalculators.lblStartDate.Caption := rsStrDateStartDate;
    frmMyCalculators.lblEndDate.Caption := rsStrDateEndDate;
  end;
  frmMyCalculators.StTxtDateCalculation.Caption := '';
  PeriodBetween(FirstDate, SecondDate, firstYear, firstMonth, firstDay);
  days := IntToStr(firstDay);
  months := IntToStr(firstMonth);
  years := IntToStr(firstYear);
  if (days = '0') and (months = '0') and (years = '0') then
    Result := rsDatesAreEqual
  else if (days = '0') and (months = '0') and (years = '1') then
    Result := years + rsYearPeriod
  else if (days = '0') and (months = '0') and (years > '1') then
    Result := years + rsYearsPeriod
  else if (days = '0') and (months = '1') and (years = '0') then
    Result := months + rsMonthPeriod
  else if (days = '0') and (months = '1') and (years = '1') then
    Result := years + rsYearAnd + months + rsMonthPeriod
  else if (days = '0') and (months = '1') and (years > '1') then
    Result := years + rsYearsAnd + months + rsMonthPeriod
  else if (days = '0') and (months > '1') and (years = '0') then
    Result := months + rsMonthsPeriod
  else if (days = '0') and (months > '1') and (years = '1') then
    Result := years + rsYearAnd + months + rsMonthsPeriod
  else if (days = '0') and (months > '1') and (years > '1') then
    Result := years + rsYearsAnd + months + rsMonthsPeriod
  else if (days = '1') and (months = '0') and (years = '0') then
    Result := days + rsDayPeriod
  else if (days = '1') and (months = '0') and (years = '1') then
    Result := years + rsYearAnd + days + rsDayPeriod
  else if (days = '1') and (months = '0') and (years > '1') then
    Result := years + rsYearsAnd + days + rsDayPeriod
  else if (days = '1') and (months = '1') and (years = '0') then
    Result := months + rsMonthAnd + days + rsDayPeriod
  else if (days = '1') and (months = '1') and (years = '1') then
    Result := years + rsYearComma + months + rsMonthAnd + days + rsDayPeriod
  else if (days = '1') and (months = '1') and (years > '1') then
    Result := years + rsYearsComma + months + rsMonthAnd + days + rsDayPeriod
  else
  if (days = '1') and (months > '1') and (years = '0') then
    Result := months + rsMonthsAnd + days + rsDayPeriod
  else
  if (days = '1') and (months > '1') and (years = '1') then
    Result := years + rsYearComma + months + rsMonthsAnd + days + rsDayPeriod
  else
  if (days = '1') and (months > '1') and (years > '1') then
    Result := years + rsYearsComma + months + rsMonthsAnd + days + rsDayPeriod
  else
  if (days > '1') and (months = '0') and (years = '0') then Result := days + rsDaysPeriod
  else
  if (days > '1') and (months = '0') and (years = '1') then
    Result := years + rsYearAnd + days + rsDaysPeriod
  else
  if (days > '1') and (months = '0') and (years > '1') then
    Result := years + rsYearAnd + days + rsDaysPeriod
  else
  if (days > '1') and (months = '1') and (years = '0') then
    Result := months + rsMonthAnd + days + rsDaysPeriod
  else
  if (days > '1') and (months = '1') and (years = '1') then
    Result := years + rsYearComma + months + rsMonthAnd + days + rsDaysPeriod
  else
  if (days > '1') and (months = '1') and (years > '1') then
    Result := years + rsYearsComma + months + rsMonthAnd + days + rsDaysPeriod
  else
  if (days > '1') and (months > '1') and (years = '0') then
    Result := months + rsMonthsAnd + days + rsDaysPeriod
  else
  if (days > '1') and (months > '1') and (years = '1') then
    Result := years + rsYearComma + months + rsMonthsAnd + days + rsDaysPeriod
  else
  if (days > '1') and (months > '1') and (years > '1') then
    Result := years + rsYearsComma + months + rsMonthsAnd + days + rsDaysPeriod;
end;
// GREGORIAN TO OTHERS *********************************************************
function GregorianToJulian(DateFrom: TDate): TDate;
begin
  if DateFrom < StrToDate('15/10/1582', 'DD/MM/YYYY') then
  begin
    frmMyCalculators.StTxtCalendarInput.Caption := '';
    frmMyCalculators.StTxtCalendarOutput.Caption := '';
    ErrMsg(emWrongGregorianDate);
    WrongDate := True;
  end
  else
    Result := JulianDateToDateTime(DateTimeToJulianDate(DateFrom) - 13);
end;

// Compute Julian Day Number from Gregorian date
function GregorianToJDN(Y, M, D: integer): int64;
var
  A: int64;
begin
  A := (14 - M) div 12;
  Y := Y + 4800 - A;
  M := M + 12 * A - 3;
  Result := D + (153 * M + 2) div 5 + 365 * Y + Y div 4 - Y div
    100 + Y div 400 - 32045;
end;

function GregorianToRepublican(AYear, AMonth, ADay: integer): TFrenchRepublicanDate;
const
  // JDN of 1 Vendémiaire An I = September 22, 1792
  EPOCH_JDN = 2375840;
var
  JDN: int64;
  DaysSinceEpoch: int64;
  RepYear, DayOfYear: integer;
  RepMonth, RepDay: integer;
begin
  JDN := GregorianToJDN(AYear, AMonth, ADay);
  DaysSinceEpoch := JDN - EPOCH_JDN;

  if DaysSinceEpoch < 0 then
    ErrMsg(emWrongFrenchDate);

  // Each Republican year has 365 or 366 days.
  // Use an approximation then adjust.
  RepYear := DaysSinceEpoch div 365;

  // Adjust RepYear: find the actual start JDN of RepYear+1
  // We iterate to find the correct year
  while GregorianToJDN(1792 + RepYear + 1, 9, 22) - 1 < JDN do
    Inc(RepYear);
  while GregorianToJDN(1792 + RepYear, 9, 22) > JDN do
    Dec(RepYear);

  Inc(RepYear); // Republican years are 1-based

  // Day within the Republican year (0-based)
  DayOfYear := JDN - (GregorianToJDN(1792 + RepYear - 1, 9, 22));

  // Months 1-12 have 30 days each; remaining days are complementary
  RepMonth := DayOfYear div 30 + 1;
  RepDay := DayOfYear mod 30 + 1;

  if RepMonth > 12 then
  begin
    RepMonth := 13;
    RepDay := DayOfYear - 360 + 1;
  end;

  Result.Year := RepYear;
  Result.Month := RepMonth;
  Result.Day := RepDay;
  Result.MonthName := REPUBLICAN_MONTHS[RepMonth];

  if RepMonth = 13 then
    Result.DayName := COMPLEMENTARY_DAYS[RepDay]
  else
    Result.DayName := '';
end;

function RepublicanDateToStr(ADate: TFrenchRepublicanDate): string;
begin
  if ADate.Month = 13 then
    Result := Format('%s An %d (%s)', [ADate.DayName, ADate.Year, ADate.MonthName])
  else
    Result := Format('%d %s An %d', [ADate.Day, ADate.MonthName, ADate.Year]);
end;

function GregorianToHebrew(DateFrom: TDate): THebrewDate;
var
  Year, Month, Day: word;
  DayNum: integer;
begin
  DecodeDate(DateFrom, Year, Month, Day);
  DayNum := GregorianToDayNumber(Day, Month, Year);
  Result := DayNumberToHebrew(DayNum);
end;

function FormatHebrewDate(HebrewDate: THebrewDate; const DateFormat: string): string;
var
  i: integer;
  Output: string;
  Token: string;
begin
  Output := DateFormat;
  i := 1;

  while i <= Length(Output) do
  begin
    if Output[i] = '%' then
    begin
      if i < Length(Output) then
      begin
        case Output[i + 1] of
          'd': // Day (1-30)
          begin
            Token := IntToStr(HebrewDate.Day);
            Delete(Output, i, 2);
            Insert(Token, Output, i);
            Inc(i, Length(Token) - 1);
          end;
          'D': // Day zero-padded (01-30)
          begin
            Token := Format('%*d', [2, HebrewDate.Day]);
            Delete(Output, i, 2);
            Insert(Token, Output, i);
            Inc(i, Length(Token) - 1);
          end;
          'm': // Month (1-13)
          begin
            Token := IntToStr(HebrewDate.Month);
            Delete(Output, i, 2);
            Insert(Token, Output, i);
            Inc(i, Length(Token) - 1);
          end;
          'M': // Month zero-padded (01-13)
          begin
            Token := Format('%.*d', [2, HebrewDate.Month]);
            Delete(Output, i, 2);
            Insert(Token, Output, i);
            Inc(i, Length(Token) - 1);
          end;
          'B': // Full month name
          begin
            Token := HEBREWMONTHNAMES[HebrewDate.Month];
            Delete(Output, i, 2);
            Insert(Token, Output, i);
            Inc(i, Length(Token) - 1);
          end;
          'b': // Short month name
          begin
            Token := HEBREWMONTHNAMESSHORT[HebrewDate.Month];
            Delete(Output, i, 2);
            Insert(Token, Output, i);
            Inc(i, Length(Token) - 1);
          end;
          'y': // Year (2 digits)
          begin
            Token := Format('%.*d', [2, HebrewDate.Year mod 100]);
            Delete(Output, i, 2);
            Insert(Token, Output, i);
            Inc(i, Length(Token) - 1);
          end;
          'Y': // Year (4 digits)
          begin
            Token := IntToStr(HebrewDate.Year);
            Delete(Output, i, 2);
            Insert(Token, Output, i);
            Inc(i, Length(Token) - 1);
          end;
          '%': // Literal %
          begin
            Delete(Output, i, 2);
            Insert('%', Output, i);
          end;
          else
            Inc(i);
        end;
      end
      else
        Inc(i);
    end
    else
      Inc(i);
  end;

  Result := Output;
end;

function GregorianToArab(DateFrom: TDate): TDate;
begin
  Result := DateFrom;
end;

function GregorianToChinese(DateFrom: TDate): TDate;
begin
  Result := DateFrom;
end;
// JULIAN TO OTHERS ************************************************************
function JulianToGregorian(DateFrom: TDate): TDate;
begin
  // From 01 Jan -45 (MAGIC NUMBER 1704986.5) to 15 Oct 1582
  if (DateFrom < 1704986.5) or (DateFrom >= StrToDate('15/10/1582',
    'DD/MM/YYYY')) then
  begin
    frmMyCalculators.StTxtCalendarInput.Caption := '';
    frmMyCalculators.StTxtCalendarOutput.Caption := '';
    ErrMsg(emWrongJulianDate);
    WrongDate := True;
  end
  else
    Result := JulianDateToDateTime(DateFrom) + 13;
end;

function JulianToHebrew(DateFrom: TDate): TDate;
begin
  Result := DateFrom;
end;

function JulianToArab(DateFrom: TDate): TDate;
begin
  Result := DateFrom;
end;

function JulianToChinese(DateFrom: TDate): TDate;
begin
  Result := DateFrom;
end;
// FRENCH TO OTHERS ************************************************************
function FindFrenchExtraDays(FYear: integer): integer;
begin
  if FYear > 11 then Result := 3
  else if FYear > 7 then Result := 2
  else if FYear > 3 then Result := 1
  else
    Result := 0;
end;

function FrenchToGregorian(DateFrom: TDate): TDate;
const
  STARTDATE = '22/09/1792';
var
  FYear, FMonth, FDay: word;
  days: integer;
begin
  if (DateFrom < StrToDate('01/01/0001', 'DD/MM/YYYY')) or
    (DateFrom > StrToDate('30/12/0014', 'DD/MM/YYYY')) then
    ErrMsg(emWrongFrenchDate)
  else
  begin
    DecodeDate(DateFrom, FYear, FMonth, FDay);
    days := (FYear - 1) * 365 + FindFrenchExtraDays(FYear) +
      (FMonth - 1) * 30 + FDay - 1;
    Result := StrToDate(STARTDATE) + days;
  end;
end;

function FrenchToHebrew(DateFrom: TDate): TDate;
begin
  Result := DateFrom;
end;

function FrenchToArab(DateFrom: TDate): TDate;
begin
  Result := DateFrom;
end;

function FrenchToChinese(DateFrom: TDate): TDate;
begin
  Result := DateFrom;
end;
// HEBREW TO OTHERS ************************************************************

function HebrewToGregorian(DateFrom: TDate): TDate;
begin
  Result := DateFrom;
end;

function HebrewToJulian(DateFrom: TDate): TDate;
begin
  Result := DateFrom;
end;

function HebrewToFrench(DateFrom: TDate): TDate;
begin
  Result := DateFrom;
end;

function HebrewToArab(DateFrom: TDate): TDate;
begin
  Result := DateFrom;
end;

function HebrewToChinese(DateFrom: TDate): TDate;
begin
  Result := DateFrom;
end;
// ARAB TO OTHERS **************************************************************
function ArabToGregorian(DateFrom: TDate): TDate;
begin
  Result := DateFrom;
end;

function ArabToJulian(DateFrom: TDate): TDate;
begin
  Result := DateFrom;
end;

function ArabToFrench(DateFrom: TDate): TDate;
begin
  Result := DateFrom;
end;

function ArabToHebrew(DateFrom: TDate): TDate;
begin
  Result := DateFrom;
end;

function ArabToChinese(DateFrom: TDate): TDate;
begin
  Result := DateFrom;
end;

// CHINESE TO OTHERS ***********************************************************
function ChineseToGregorian(DateFrom: TDate): TDate;
begin
  Result := DateFrom;
end;

function ChineseToJulian(DateFrom: TDate): TDate;
begin
  Result := DateFrom;
end;

function ChineseToFrench(DateFrom: TDate): TDate;
begin
  Result := DateFrom;
end;

function ChineseToHebrew(DateFrom: TDate): TDate;
begin
  Result := DateFrom;
end;

function ChineseToArab(DateFrom: TDate): TDate;
begin
  Result := DateFrom;
end;

function ConvertWDayToStr(Day: integer): string;
begin
  case Day of
    1: Result := rsSunday;
    2: Result := rsMonday;
    3: Result := rsTuesday;
    4: Result := rsWednesday;
    5: Result := rsThursday;
    6: Result := rsFriday;
    7: Result := rsSaturday;
    else
      Result := '';
  end;
end;

function ConvertNDayToStr(NumberOfDay: integer): string;
begin
  case NumberOfDay of
    1: Result := rsOne;
    2: Result := rsTwo;
    3: Result := rsThree;
    4: Result := rsFour;
    5: Result := rsFive;
    6: Result := rsSix;
    7: Result := rsSeven;
    8: Result := rsEight;
    9: Result := rsNine;
    10: Result := rsTen;
    11: Result := rsEleven;
    12: Result := rsTwelve;
    13: Result := rsThirteen;
    14: Result := rsFourteen;
    15: Result := rsFifteen;
    16: Result := rsSixteen;
    17: Result := rsSeventeen;
    18: Result := rsEighteen;
    19: Result := rsNineteen;
    20: Result := rsTwenty;
    21: Result := rsTwentyOne;
    22: Result := rsTwentyTwo;
    23: Result := rsTwentyThree;
    24: Result := rsTwentyFour;
    25: Result := rsTwentyFive;
    26: Result := rsTwentySix;
    27: Result := rsTwentySeven;
    28: Result := rsTwentyEight;
    29: Result := rsTwentyNine;
    30: Result := rsThirty;
    31: Result := rsThirtyOne;
    else
      Result := '';
  end;
end;

function ConvertMonthToStr(Month: integer): string;
begin
  case Month of
    1: Result := rsJanuary;
    2: Result := rsFebruary;
    3: Result := rsMarch;
    4: Result := rsApril;
    5: Result := rsMay;
    6: Result := rsJune;
    7: Result := rsJuly;
    8: Result := rsAugust;
    9: Result := rsSeptember;
    10: Result := rsOctober;
    11: Result := rsNovember;
    12: Result := rsDecember;
    else
      Result := '';
  end;
end;

end.
