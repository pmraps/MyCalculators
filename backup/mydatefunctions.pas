unit mydatefunctions;

{$mode ObjFPC}{$H+}

interface

uses
    Classes, SysUtils, Graphics, DateUtils, Dialogs,
    ErrorCatching, myResourceStrings;

    function CalendarConversion(DateFrom : TDate; CalendarFrom, CalendarTo : Byte; CurrentLang : String) : String;
    function DateDifference(firstDate, secondDate : TDate) : String;
    function formatDateString (DateFrom : TDate; CurrentLang : String; Error : boolean) : String;

    function GregorianToJulian (DateFrom : TDate) : TDate;
    function GregorianToFrench (DateFrom : TDate) : TDate;

    function JulianToGregorian (DateFrom : TDate) : TDate;

    function FrenchToGregorian (DateFrom : TDate) : TDate;

    function FindFrenchYear(DateFrom : TDate) : Word;
    function FindFrenchExtraDays(FYear : Integer) : Integer;

    function ConvertWDayToStr(Day : Integer) : String;
    function ConvertNDayToStr(NumberOfDay : Integer) : String;
    function ConvertMonthToStr(Month : Integer) : String;

var
    WrongDate : boolean = false;

implementation

uses mainCalculators;

function CalendarConversion(DateFrom : TDate; CalendarFrom, CalendarTo : Byte; CurrentLang : String) : String;

begin
     frmMyCalculators.StTxtCalendarInput.Caption := formatDateString(DateFrom, CurrentLang, WrongDate);
     case CalendarFrom of
               0 : begin
                          if CalendarTo = 1 then Result := formatDateString(GregorianToJulian(DateFrom), CurrentLang, WrongDate)
                          else if CalendarTo = 2 then Result := formatDateString(GregorianToFrench(DateFrom), CurrentLang, WrongDate)
{                               else if CalendarTo = 3 then Result := formatDateString(GregorianToHebrew(DateFrom), CurrentLang)
                                    else if CalendarTo = 4 then Result := formatDateString(GregorianToArab(DateFrom), CurrentLang)
                                         else Result := formatDateString(GregorianToChinese(DateFrom), CurrentLang)}
               end;
               1 : if CalendarTo = 0 then Result := formatDateString(JulianToGregorian(DateFrom), CurrentLang, WrongDate);
               2 : if CalendarTo = 0 then Result := formatDateString(FrenchToGregorian(DateFrom), CurrentLang, WrongDate);
{               3 : if CalendarTo = 0 then Result := formatDateString(HebrewToGregorian(DateFrom), CurrentLang);
               4 : if CalendarTo = 0 then Result := formatDateString(ArabToGregorian(DateFrom), CurrentLang);
               5 : if CalendarTo = 0 then Result := formatDateString(ChineseToGregorian(DateFrom), CurrentLang);     }
               else ErrMsg(emCalendarUnavailable);
     end;
end;

function formatDateString (DateFrom : TDate; CurrentLang : String; Error : boolean) : String;
var frenchMonths, frenchSansCulottides : TStringArray;
    SWDay, SDay, SMonth, SYear : String;
    NDay, NMonth, NYear : Word;
    SansCulottides : Integer;
begin
     if not error then
        begin
             frenchMonths := TStringArray.Create('Vendémiaire', 'Brumaire', 'Frimaire', 'Nivôse',
                                                 'Pluviôse', 'Ventose', 'Germinal', 'Floreal',
                                                 'Prairial', 'Messidor', 'Thermidor', 'Fructidor',
                                                 'Complémentaire');
             frenchSansCulottides := TStringArray.Create('Fete de la vertu', 'Fete du genie', 'Fete du travail',
	                                                     'Fete de l''opinion', 'Fete des recompenses',
                                                         'Fete de la Revolution');

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

function GregorianToJulian(DateFrom : TDate) : TDate;
begin
     if DateFrom < StrToDate('15/10/1582', 'DD/MM/YYYY') then
        begin
             frmMyCalculators.StTxtCalendarInput.Caption := '';
             frmMyCalculators.StTxtCalendarOutput.Caption := '';
             ErrMsg(emWrongGregorianDate)
             WrongDate := true;
        end
     else Result := JulianDateToDateTime(DateTimeToJulianDate(DateFrom)-13);
end;

function GregorianToFrench (DateFrom : TDate) : TDate;
var daysBefore, daysAfter : Integer;
    FYear, FDay : Word;

begin
    if (DateFrom < StrToDate('22/09/1792', 'DD/MM/YYYY')) or
       (DateFrom >= StrToDate('31/12/1805', 'DD/MM/YYYY')) then
                 ErrMsg(emWrongFrenchDate)
    else
      begin
           daysAfter := DaysBetween(DateFrom, StrToDate('31/12/1805', 'DD/MM/YYY'));
           daysBefore := DaysBetween(StrToDate('22/09/192', 'DD/MM/YYY'), DateFrom);
           if (daysBefore < 0) or (daysAfter < 0) then
               ErrMsg(emWrongFrenchDate);
           FYear := ((daysAfter + 366) div 365) - 13;
           FDay := (daysAfter + 366) mod 365 - FindFrenchExtraDays(FYear);
           if FDay < 1 then
               begin
                    Dec(FYear);
                    Inc(FDay, 366);
               end;
           if FDay < 361 then
               Result := EncodeDate(FYear, FDay div 30, FDay mod 30)
           else Result := EncodeDate(FYear, 13, FDay - 360);
      end;
end;

function FindFrenchYear(DateFrom : TDate) : Word;
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
                                                                 else if (DateFrom >= StrToDate('22/09/1804', 'DD/MM/YYYY')) and
                                                                         (DateFrom < StrToDate('21/09/1805', 'DD/MM/YYYY')) then
                                                                         Result := 12
                                                                         else Result := 13;
end;

function JulianToGregorian(DateFrom : TDate) : TDate;
begin
     // From 01 Jan -45 (MAGIC NUMBER 1704986.5) to 15 Oct 1582
     if (DateFrom < 1704986.5) or (DateFrom >= StrToDate('15/10/1582', 'DD/MM/YYYY')) then
        begin
             frmMyCalculators.StTxtCalendarInput.Caption := '';
             frmMyCalculators.StTxtCalendarOutput.Caption := '';
             ErrMsg(emWrongJulianDate);
             WrongDate := true;
        end
     else
         Result := JulianDateToDateTime(DateFrom) + 13;
end;

function FindFrenchExtraDays(FYear : Integer) : Integer;
begin
     if FYear > 11 then Result := 3
     else if FYear > 7 then Result := 2
          else if FYear > 3 then Result := 1
               else Result := 0;
end;

function FrenchToGregorian (DateFrom : TDate) : TDate;
const STARTDATE = '22/09/1792';
var FYear, FMonth, FDay : word;
    days : Integer;
begin
     if (DateFrom < StrToDate('01/01/0001', 'DD/MM/YYYY')) or
        (DateFrom > StrToDate('30/12/0014', 'DD/MM/YYYY')) then
        ErrMsg(emWrongFrenchDate)
     else
       begin
         DecodeDate(DateFrom, FYear, FMonth, FDay);
         days := ( FYear - 1 ) * 365 + FindFrenchExtraDays(FYear) + ( FMonth - 1 ) * 30 + FDay - 1;
		 result := StrToDate(STARTDATE) + days;
       end;
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

