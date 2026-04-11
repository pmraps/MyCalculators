unit mydatefunctions;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Graphics, DateUtils, Dialogs,
  ErrorCatching, resourcestrings;

function CalendarConversion(DateFrom: TDate; CalendarFrom, CalendarTo: byte;
  CurrentLang: string): string;
function DateDifference(FirstDate, SecondDate: TDate): string;
function FormatDateString(DateFrom: TDate; CurrentLang: string; Error: boolean): string;

function GregorianToFrench(DateFrom: TDate): TDate;
function GregorianToHebrew(DateFrom: TDate): TDate;
function GregorianToArab(DateFrom: TDate): TDate;
function GregorianToChinese(DateFrom: TDate): TDate;

function JulianToHebrew(DateFrom: TDate): TDate;
function JulianToArab(DateFrom: TDate): TDate;
function JulianToChinese(DateFrom: TDate): TDate;

function FrenchToGregorian(DateFrom: TDate): TDate;
function FrenchToHebrew(DateFrom: TDate): TDate;
function FrenchToArab(DateFrom: TDate): TDate;
function FrenchToChinese(DateFrom: TDate): TDate;
function FindFrenchYear(DateFrom: TDate): TDate;
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

function CalendarConversion(DateFrom: TDate; CalendarFrom, CalendarTo: byte;
  CurrentLang: string): string;
begin
  frmMyCalculators.StTxtCalendarInput.Caption :=
    FormatDateString(DateFrom, CurrentLang, WrongDate);
  case CalendarFrom of
    0: begin
      if CalendarTo = 2 then
        Result := FormatDateString(GregorianToFrench(DateFrom), CurrentLang, WrongDate)
      else if CalendarTo = 3 then
        Result := FormatDateString(GregorianToHebrew(DateFrom), CurrentLang, WrongDate)
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
  frenchMonths, frenchSansCulottides: TStringArray;
  SWDay, SDay, SMonth, SYear: string;
  NDay, NMonth, NYear: word;
  SansCulottides: integer;
begin
  if not Error then
  begin
    frenchMonths := TStringArray.Create('Vendémiaire', 'Brumaire',
      'Frimaire', 'Nivôse', 'Pluviôse', 'Ventose', 'Germinal',
      'Floreal', 'Prairial', 'Messidor', 'Thermidor', 'Fructidor',
      'Complémentaire');
    frenchSansCulottides :=
      TStringArray.Create('Fete de la vertu', 'Fete du genie',
      'Fete du travail', 'Fete de l''opinion', 'Fete des recompenses',
      'Fete de la Revolution');

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
  if FirstDate = SecondDate then
  ShowMessage(rsDatesAreEqual)
  else if FirstDate > SecondDate then
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
    Result := years + rsDatesAreEqual
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

function GregorianToFrench(DateFrom: TDate): TDate;
var
  DaysBefore, DaysAfter: integer;
  FYear, FDay: word;
begin
  if (DateFrom < StrToDate('22/09/1792', 'DD/MM/YYYY')) or
    (DateFrom >= StrToDate('31/12/1805', 'DD/MM/YYYY')) then
    ErrMsg(emWrongFrenchDate)
  else
  begin
    DaysAfter := DaysBetween(DateFrom, StrToDate('31/12/1805', 'DD/MM/YYY'));
    DaysBefore := DaysBetween(StrToDate('22/09/192', 'DD/MM/YYY'), DateFrom);
    if (DaysBefore < 0) or (DaysAfter < 0) then
      ErrMsg(emWrongFrenchDate);
    FYear := ((DaysAfter + 366) div 365) - 13;
    FDay := (DaysAfter + 366) mod 365 - FindFrenchExtraDays(FYear);
    if FDay < 1 then
    begin
      Dec(FYear);
      Inc(FDay, 366);
    end;
    if FDay < 361 then
      Result := EncodeDate(FYear, FDay div 30, FDay mod 30)
    else
      Result := EncodeDate(FYear, 13, FDay - 360);
  end;
end;

function FindFrenchYear(DateFrom: TDate): TDate;
begin
  if (DateFrom < StrToDate('21/09/1793', 'DD/MM/YYYY')) then
    Result := 1
  else if (DateFrom >= StrToDate('22/09/1793', 'DD/MM/YYYY')) and
    (DateFrom < StrToDate('21/09/1794', 'DD/MM/YYYY')) then
    Result := 2
  else if (DateFrom >= StrToDate('22/09/1794', 'DD/MM/YYYY')) and
    (DateFrom < StrToDate('21/09/1795', 'DD/MM/YYYY')) then
    Result := 3
  else if (DateFrom >= StrToDate('22/09/1795', 'DD/MM/YYYY')) and
    (DateFrom < StrToDate('21/09/1796', 'DD/MM/YYYY')) then
    Result := 4
  else if (DateFrom >= StrToDate('22/09/1796', 'DD/MM/YYYY')) and
    (DateFrom < StrToDate('21/09/1797', 'DD/MM/YYYY')) then
    Result := 5
  else if (DateFrom >= StrToDate('22/09/1797', 'DD/MM/YYYY')) and
    (DateFrom < StrToDate('21/09/1798', 'DD/MM/YYYY')) then
    Result := 6
  else if (DateFrom >= StrToDate('22/09/1798', 'DD/MM/YYYY')) and
    (DateFrom < StrToDate('21/09/1799', 'DD/MM/YYYY')) then
    Result := 7
  else if (DateFrom >= StrToDate('22/09/1800', 'DD/MM/YYYY')) and
    (DateFrom < StrToDate('21/09/1801', 'DD/MM/YYYY')) then
    Result := 8
  else if (DateFrom >= StrToDate('22/09/1801', 'DD/MM/YYYY')) and
    (DateFrom < StrToDate('21/09/1802', 'DD/MM/YYYY')) then
    Result := 9
  else if (DateFrom >= StrToDate('22/09/1802', 'DD/MM/YYYY')) and
    (DateFrom < StrToDate('21/09/1803', 'DD/MM/YYYY')) then
    Result := 10
  else if (DateFrom >= StrToDate('22/09/1803', 'DD/MM/YYYY')) and
    (DateFrom < StrToDate('21/09/1804', 'DD/MM/YYYY')) then
    Result := 11
  else
  if (DateFrom >= StrToDate('22/09/1804', 'DD/MM/YYYY')) and
    (DateFrom < StrToDate('21/09/1805', 'DD/MM/YYYY')) then
    Result := 12
  else
    Result := 13;
end;

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

function GregorianToHebrew(DateFrom: TDate): TDate;
begin
  Result := DateFrom;
end;

function GregorianToArab(DateFrom: TDate): TDate;
begin
  Result := DateFrom;
end;

function GregorianToChinese(DateFrom: TDate): TDate;
begin
  Result := DateFrom;
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
