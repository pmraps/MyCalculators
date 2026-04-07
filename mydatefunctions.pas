unit mydatefunctions;

{$mode ObjFPC}{$H+}

interface

uses
    Classes, SysUtils, Graphics, DateUtils, Math,
    ErrorCatching, myResourceStrings;

    function CalendarConversion(DateFrom : TDate; CalendarFrom, CalendarTo : Byte; CurrentLang : String) : String;
    function DateDifference(firstDate, secondDate : TDate) : String;
    function formatDateString (DateFrom : TDate; CurrentLang : String) : String;

    function GregorianToJulian (DateFrom : TDate) : TDate;
    function GregorianToFrench (DateFrom : TDate) : TDate;
    function GregorianToHebrew (DateFrom : TDate) : TDate;
    function GregorianToArab (DateFrom : TDate) : TDate;
    function GregorianToChinese (DateFrom : TDate) : TDate;

    function JulianToGregorian (DateFrom : TDate) : TDate;
    function JulianToFrench (DateFrom : TDate) : TDate;
    function JulianToHebrew (DateFrom : TDate) : TDate;
    function JulianToArab (DateFrom : TDate) : TDate;
    function JulianToChinese (DateFrom : TDate) : TDate;

    function FrenchToGregorian (DateFrom : TDate) : TDate;
    function FrenchToJulian (DateFrom : TDate) : TDate;
    function FrenchToHebrew (DateFrom : TDate) : TDate;
    function FrenchToArab (DateFrom : TDate) : TDate;
    function FrenchToChinese (DateFrom : TDate) : TDate;

    function HebrewToGregorian (DateFrom : TDate) : TDate;
    function HebrewToJulian (DateFrom : TDate) : TDate;
    function HebrewToFrench (DateFrom : TDate) : TDate;
    function HebrewToArab (DateFrom : TDate) : TDate;
    function HebrewToChinese (DateFrom : TDate) : TDate;

    function ArabToGregorian (DateFrom : TDate) : TDate;
    function ArabToJulian (DateFrom : TDate) : TDate;
    function ArabToFrench (DateFrom : TDate) : TDate;
    function ArabToHebrew (DateFrom : TDate) : TDate;
    function ArabToChinese (DateFrom : TDate) : TDate;

    function ChineseToGregorian (DateFrom : TDate) : TDate;
    function ChineseToJulian (DateFrom : TDate) : TDate;
    function ChineseToFrench (DateFrom : TDate) : TDate;
    function ChineseToHebrew (DateFrom : TDate) : TDate;
    function ChineseToArab (DateFrom : TDate) : TDate;

    function ConvertWDayToStr(Day : Integer) : String;
    function ConvertNDayToStr(NumberOfDay : Integer) : String;
    function ConvertMonthToStr(Month : Integer) : String;

implementation

uses mainCalculators;

function CalendarConversion(DateFrom : TDate; CalendarFrom, CalendarTo : Byte; CurrentLang : String) : String;

begin
     case CalendarFrom of
               0 : begin
                          if CalendarTo = 1 then Result := formatDateString(GregorianToJulian(DateFrom), CurrentLang)
                          else if CalendarTo = 2 then Result := formatDateString(GregorianToFrench(DateFrom), CurrentLang)
                               else if CalendarTo = 3 then Result := formatDateString(GregorianToHebrew(DateFrom), CurrentLang)
                                    else if CalendarTo = 4 then Result := formatDateString(GregorianToArab(DateFrom), CurrentLang)
                                         else Result := formatDateString(GregorianToChinese(DateFrom), CurrentLang)
               end;
               1 : begin
                          if CalendarTo = 0 then Result := formatDateString(JulianToGregorian(DateFrom), CurrentLang)
                          else if CalendarTo = 2 then Result := formatDateString(JulianToFrench(DateFrom), CurrentLang)
                               else if CalendarTo = 3 then Result := formatDateString(JulianToHebrew(DateFrom), CurrentLang)
                                    else if CalendarTo = 4 then Result := formatDateString(JulianToArab(DateFrom), CurrentLang)
                                         else Result := formatDateString(JulianToChinese(DateFrom), CurrentLang)
               end;
               2 : begin
                          if CalendarTo = 0 then Result := formatDateString(FrenchToGregorian(DateFrom), CurrentLang)
                          else if CalendarTo = 1 then Result := formatDateString(FrenchToJulian(DateFrom), CurrentLang)
                               else if CalendarTo = 3 then Result := formatDateString(FrenchToHebrew(DateFrom), CurrentLang)
                                    else if CalendarTo = 4 then Result := formatDateString(FrenchToArab(DateFrom), CurrentLang)
                                         else Result := formatDateString(FrenchToChinese(DateFrom), CurrentLang)
               end;
               3 : begin
                          if CalendarTo = 0 then Result := formatDateString(HebrewToGregorian(DateFrom), CurrentLang)
                          else if CalendarTo = 1 then Result := formatDateString(HebrewToJulian(DateFrom), CurrentLang)
                               else if CalendarTo = 2 then Result := formatDateString(HebrewToFrench(DateFrom), CurrentLang)
                                    else if CalendarTo = 4 then Result := formatDateString(HebrewToArab(DateFrom), CurrentLang)
                                         else Result := formatDateString(HebrewToChinese(DateFrom), CurrentLang)
               end;
               4 : begin
                          if CalendarTo = 0 then Result := formatDateString(ArabToGregorian(DateFrom), CurrentLang)
                          else if CalendarTo = 1 then Result := formatDateString(ArabToJulian(DateFrom), CurrentLang)
                               else if CalendarTo = 2 then Result := formatDateString(ArabToFrench(DateFrom), CurrentLang)
                                    else if CalendarTo = 3 then Result := formatDateString(ArabToHebrew(DateFrom), CurrentLang)
                                         else Result := formatDateString(ArabToChinese(DateFrom), CurrentLang)
               end;
               5 : begin
                          if CalendarTo = 0 then Result := formatDateString(ChineseToGregorian(DateFrom), CurrentLang)
                          else if CalendarTo = 1 then Result := formatDateString(ChineseToJulian(DateFrom), CurrentLang)
                               else if CalendarTo = 2 then Result := formatDateString(ChineseToFrench(DateFrom), CurrentLang)
                                    else if CalendarTo = 4 then Result := formatDateString(ChineseToArab(DateFrom), CurrentLang)
               end;
     end;
end;

function formatDateString (DateFrom : TDate; CurrentLang : String) : String;
var SWDay, SDay, SMonth, SYear : String;
    NDay, NMonth, NYear : Word;
begin
     DecodeDate(DateFrom, NYear, NMonth, NDay);
     SWDay := ConvertWDayToStr(DayOfWeek(DateFrom));
     SDay := ConvertNDayToStr(NDay);
     SMonth := ConvertMonthToStr(NMonth);
     SYear := IntToStr(NYear);

     { Is this needed? If 'FormatDateTime' works AND DTPickerPresent uses the chosen language format
       only one string should be needed! How to do it? }
     case CurrentLang of
          'de' : Result := SWDay + ', ' + SDay + ' ' + SMonth + ' ' + SYear;
          'en' : Result := SWDay + ', ' + SMonth + ', ' + SDay + ', ' + SYear;
          'es' : Result := SWDay + ', el ' + SDay + rsOf + SMonth + rsOf + SYear;
          'fr' : Result := 'Le ' + SWDay + ' ' + SDay + SMonth + SYear;
          'it' : Result := SWDay + ', il ' + SDay + rsOf + SMonth + rsOf + SYear;
          'pt' : Result := SWDay + ', ' + SDay + rsOf + SMonth + rsOf + Syear
          else Result := 'Invalid date';
     end;
end;

function DateDifference(firstDate, secondDate : TDate) : String;
var firstDay, firstMonth, firstYear : Word;
    years, months, days : String;
begin
     if firstDate > secondDate then
         begin
              frmMyCalculators.lblStartDate.Caption := rsStrDateEndDate;         // Flag the inversion of order
              frmMyCalculators.lblStartDate.Font.Color := clRed;                 // with a red label
              frmMyCalculators.lblEndDate.Caption := rsStrDateStartDate;
         end
     else
         begin
              frmMyCalculators.lblStartDate.Font.Color := clDefault;             // Return labels to default colour
              frmMyCalculators.lblStartDate.Caption := rsStrDateStartDate;
              frmMyCalculators.lblEndDate.Caption := rsStrDateEndDate;
         end;
     PeriodBetween(firstDate, secondDate, firstYear, firstMonth, firstDay);
     days := IntToStr(firstDay);
     months := IntToStr(firstMonth);
     years := IntToStr(firstYear);
     if (days = '0') and (months = '0') and (years = '0') then DateDifference := years + rsDatesAreEqual
     else if (days = '0') and (months = '0') and (years = '1') then DateDifference := years + rsYearPeriod
          else if (days = '0') and (months = '0') and (years > '1') then DateDifference := years + rsYearsPeriod
               else if (days = '0') and (months = '1') and (years = '0') then DateDifference := months + rsMonthPeriod
                    else if (days = '0') and (months = '1') and (years = '1') then DateDifference := years + rsYearAnd + months + rsMonthPeriod
                         else if (days = '0') and (months = '1') and (years > '1') then DateDifference := years + rsYearsAnd + months + rsMonthPeriod
                              else if (days = '0') and (months > '1') and (years = '0') then DateDifference := months + rsMonthsPeriod
                                   else if (days = '0') and (months > '1') and (years = '1') then DateDifference := years + rsYearAnd + months + rsMonthsPeriod
                                        else if (days = '0') and (months > '1') and (years > '1') then DateDifference := years + rsYearsAnd + months + rsMonthsPeriod
                                             else if (days = '1') and (months = '0') and (years = '0') then DateDifference := days + rsDayPeriod
                                                  else if (days = '1') and (months = '0') and (years = '1') then DateDifference := years + rsYearAnd + days + rsDayPeriod
                                                       else if (days = '1') and (months = '0') and (years > '1') then DateDifference := years + rsYearsAnd + days + rsDayPeriod
                                                            else if (days = '1') and (months = '1') and (years = '0') then DateDifference := months + rsMonthAnd + days + rsDayPeriod
                                                                 else if (days = '1') and (months = '1') and (years = '1') then DateDifference := years + rsYearComma + months + rsMonthAnd + days + rsDayPeriod
                                                                      else if (days = '1') and (months = '1') and (years > '1') then DateDifference := years + rsYearsComma + months + rsMonthAnd + days + rsDayPeriod
                                                                           else if (days = '1') and (months > '1') and (years = '0') then DateDifference := months + rsMonthsAnd + days + rsDayPeriod
                                                                                else if (days = '1') and (months > '1') and (years = '1') then DateDifference := years + rsYearComma + months + rsMonthsAnd + days + rsDayPeriod
                                                                                     else if (days = '1') and (months > '1') and (years > '1') then DateDifference := years + rsYearsComma + months + rsMonthsAnd + days + rsDayPeriod
                                                                                          else if (days > '1') and (months = '0') and (years = '0') then DateDifference := days + rsDaysPeriod
                                                                                               else if (days > '1') and (months = '0') and (years = '1') then DateDifference :=  years  + rsYearAnd + days + rsDaysPeriod
                                                                                                    else if (days > '1') and (months = '0') and (years > '1') then DateDifference := years + rsYearAnd + days + rsDaysPeriod
                                                                                                         else if (days > '1') and (months = '1') and (years = '0') then DateDifference := months + rsMonthAnd + days + rsDaysPeriod
                                                                                                              else if (days > '1') and (months = '1') and (years = '1') then DateDifference := years + rsYearComma + months + rsMonthAnd + days + rsDaysPeriod
                                                                                                                   else if (days > '1') and (months = '1') and (years > '1') then DateDifference := years + rsYearsComma + months + rsMonthAnd + days + rsDaysPeriod
                                                                                                                        else if (days > '1') and (months > '1') and (years = '0') then DateDifference := months + rsMonthsAnd + days + rsDaysPeriod
                                                                                                                             else if (days > '1') and (months > '1') and (years = '1') then DateDifference := years + rsYearComma + months + rsMonthsAnd + days + rsDaysPeriod
                                                                                                                                  else if (days > '1') and (months > '1') and (years > '1') then DateDifference := years + rsYearsComma + months + rsMonthsAnd + days + rsDaysPeriod
end;

function fInt(d : Double) : Integer;
begin
     if d > 0 then
        Result := floor(d)
     else if d = floor(d) then Result := floor(d)
          else Result := floor(d)-1;
end;

function GregorianToJulian(DateFrom : TDate) : TDate;
begin
     if DateFrom < StrToDate('15/10/1582', 'DD/MM/YYYY') then
     ErrMsg(emWrongGregorianDate)
     else Result := JulianDateToDateTime(DateTimeToJulianDate(DateFrom)-13);
end;

function GregorianToFrench (DateFrom : TDate) : TDate;
var frenchMonths : TStringArray;
begin
     frenchMonths := TStringArray.Create('Vendémiaire', 'Brumaire', 'Frimaire', 'Nivôse',
                                         'Pluviôse', 'Ventose', 'Germinal', 'Floreal',
                                         'Prairial', 'Messidor', 'Thermidor', 'Fructidor',
                                         'Complémentaire');

    if (DateFrom < StrToDate('22/09/1793', 'DD/MM/YYYY')) or
       (DateFrom >= StrToDate('01/01/1806', 'DD/MM/YYYY')) then
                 ErrMsg(emWrongFrenchDate)
    else Result := 'frenchDay + frenchMonth + frenchYear';
end;

function GregorianToHebrew (DateFrom : TDate) : TDate;
    begin

    end;
function GregorianToArab (DateFrom : TDate) : TDate;
    begin

     end;
function GregorianToChinese (DateFrom : TDate) : TDate;
    begin

     end;

function JulianToGregorian(DateFrom : TDate) : TDate;
begin
     // From 01 Jan -45 to 15 Oct 1582
     if (DateFrom < 1704986.5) or (DateFrom >= StrToDate('15/10/1582', 'DD/MM/YYYY')) then
     ErrMsg(emWrongJulianDate)
     else Result := JulianDateToDateTime(JulianDateToDateTime(DateFrom) + 13);
end;

    function JulianToFrench (DateFrom : TDate) : TDate;
        begin

        end;

    function JulianToHebrew (DateFrom : TDate) : TDate;
         begin

         end;

    function JulianToArab (DateFrom : TDate) : TDate;
        begin

        end;
    function JulianToChinese (DateFrom : TDate) : TDate;
        begin

        end;

    function FrenchToGregorian (DateFrom : TDate) : TDate;
        begin
             // From 22 Sep 1792 = 24/11/1793
             if (DateFrom >= StrToDate('05/10/1793', 'DD/MM/YYYY')) or
                (DateFrom >= StrToDate('01/01/1806', 'DD/MM/YYYY')) then
                ErrMsg(emWrongFrenchDate)
             else Result := 0; //FrenchDate(DateFrom);
        end;

    function FrenchToJulian (DateFrom : TDate) : TDate;
        begin

        end;

    function FrenchToHebrew (DateFrom : TDate) : TDate;
        begin

        end;

    function FrenchToArab (DateFrom : TDate) : TDate;
        begin

        end;

    function FrenchToChinese (DateFrom : TDate) : TDate;
        begin

        end;

    function HebrewToGregorian (DateFrom : TDate) : TDate;
        begin

        end;

    function HebrewToJulian (DateFrom : TDate) : TDate;
        begin

        end;

    function HebrewToFrench (DateFrom : TDate) : TDate;
        begin

        end;

    function HebrewToArab (DateFrom : TDate) : TDate;
        begin

        end;

    function HebrewToChinese (DateFrom : TDate) : TDate;
        begin

        end;

    function ArabToGregorian (DateFrom : TDate) : TDate;
        begin

        end;

    function ArabToJulian (DateFrom : TDate) : TDate;
        begin

        end;

    function ArabToFrench (DateFrom : TDate) : TDate;
        begin

        end;

    function ArabToHebrew (DateFrom : TDate) : TDate;
        begin

        end;

    function ArabToChinese (DateFrom : TDate) : TDate;
        begin

        end;

    function ChineseToGregorian (DateFrom : TDate) : TDate;
        begin

        end;
    function ChineseToJulian (DateFrom : TDate) : TDate;
        begin

        end;

    function ChineseToFrench (DateFrom : TDate) : TDate;
        begin

        end;
    function ChineseToHebrew (DateFrom : TDate) : TDate;
        begin

        end;
    function ChineseToArab (DateFrom : TDate) : TDate;
        begin

        end;

function ConvertWDayToStr(Day : Integer) : String;
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

function ConvertNDayToStr(NumberOfDay : Integer) : String;
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

function ConvertMonthToStr(Month : Integer) : String;
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

end.

