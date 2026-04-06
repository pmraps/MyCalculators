unit mydatefunctions;

{$mode ObjFPC}{$H+}

interface

uses
    Classes, SysUtils, Graphics, DateUtils,
    ErrorCatching, myResourceStrings;

    function CalendarConversion(DateFrom : TDate; CalendarFrom, CalendarTo : Char; CurrentLang : String) : String;
    function DateDifference(firstDate, secondDate : TDate) : String;

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

function CalendarConversion(DateFrom : TDate; CalendarFrom, CalendarTo : Char; CurrentLang : String) : String;
var SWDay, SDay, SMonth, SYear : String;
    NDay, NMonth, NYear : Word;
begin
     case CalendarFrom of
               'G' : begin
                          if CalendarTo = 'J' then DecodeDate(GregorianToJulian(DateFrom), NYear, NMonth, NDay)
                          else if CalendarTo = 'F' then DecodeDate(GregorianToFrench(DateFrom), NYear, NMonth, NDay)
                               else if CalendarTo = 'H' then DecodeDate(GregorianToHebrew(DateFrom), NYear, NMonth, NDay)
                                    else if CalendarTo = 'A' then DecodeDate(GregorianToArab(DateFrom), NYear, NMonth, NDay)
                                         else DecodeDate(GregorianToChinese(DateFrom), NYear, NMonth, NDay);
               end;
               'J' : begin
                          if CalendarTo = 'G' then DecodeDate(JulianToGregorian(DateFrom), NYear, NMonth, NDay)
                          else if CalendarTo = 'F' then DecodeDate(JulianToFrench(DateFrom), NYear, NMonth, NDay)
                               else if CalendarTo = 'H' then DecodeDate(JulianToHebrew(DateFrom), NYear, NMonth, NDay)
                                    else if CalendarTo = 'A' then DecodeDate(JulianToArab(DateFrom), NYear, NMonth, NDay)
                                         else DecodeDate(JulianToChinese(DateFrom), NYear, NMonth, NDay);
               end;
               'F' : begin
                          if CalendarTo = 'G' then DecodeDate(FrenchToGregorian(DateFrom), NYear, NMonth, NDay)
                          else if CalendarTo = 'J' then DecodeDate(FrenchToJulian(DateFrom), NYear, NMonth, NDay)
                               else if CalendarTo = 'H' then DecodeDate(FrenchToHebrew(DateFrom), NYear, NMonth, NDay)
                                    else if CalendarTo = 'A' then DecodeDate(FrenchToArab(DateFrom), NYear, NMonth, NDay)
                                         else DecodeDate(FrenchToChinese(DateFrom), NYear, NMonth, NDay);
               end;
               'H' : begin
                          if CalendarTo = 'G' then DecodeDate(HebrewToGregorian(DateFrom), NYear, NMonth, NDay)
                          else if CalendarTo = 'J' then DecodeDate(HebrewToJulian(DateFrom), NYear, NMonth, NDay)
                               else if CalendarTo = 'F' then DecodeDate(HebrewToFrench(DateFrom), NYear, NMonth, NDay)
                                    else if CalendarTo = 'A' then DecodeDate(HebrewToArab(DateFrom), NYear, NMonth, NDay)
                                         else DecodeDate(HebrewToChinese(DateFrom), NYear, NMonth, NDay);
               end;
               'A' : begin
                          if CalendarTo = 'G' then DecodeDate(ArabToGregorian(DateFrom), NYear, NMonth, NDay)
                          else if CalendarTo = 'J' then DecodeDate(ArabToJulian(DateFrom), NYear, NMonth, NDay)
                               else if CalendarTo = 'F' then DecodeDate(ArabToFrench(DateFrom), NYear, NMonth, NDay)
                                    else if CalendarTo = 'H' then DecodeDate(ArabToHebrew(DateFrom), NYear, NMonth, NDay)
                                         else DecodeDate(ArabToChinese(DateFrom), NYear, NMonth, NDay);
               end;
               'C' : begin
                          if CalendarTo = 'G' then DecodeDate(ChineseToGregorian(DateFrom), NYear, NMonth, NDay)
                          else if CalendarTo = 'J' then DecodeDate(ChineseToJulian(DateFrom), NYear, NMonth, NDay)
                               else if CalendarTo = 'F' then DecodeDate(ChineseToFrench(DateFrom), NYear, NMonth, NDay)
                                    else if CalendarTo = 'A' then DecodeDate(ChineseToArab(DateFrom), NYear, NMonth, NDay);
               end;
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
          'pt' : CalendarConversion := SWDay + ', ' + SDay + rsOf + SMonth + rsOf + Syear
          else CalendarConversion := 'Invalid date';
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
     else if (days = '0') and (months = '0') and (years = '1')
         then DateDifference := years + rsYear
          else if (days = '0') and (months = '0') and (years > '1')
              then DateDifference := years + rsYears
               else if (days = '0') and (months = '1') and (years = '0')
                   then DateDifference := months + ' '+ rsMonth
                    else if (days = '0') and (months = '1') and (years = '1')
                        then DateDifference := months + rsMonthAnd + years + rsYear
                         else if (days = '0') and (months = '1') and (years > '1') then DateDifference := months + rsMonthAnd + years + rsYears
                              else if (days = '0') and (months > '1') and (years = '0') then DateDifference := months + rsMonths
                                   else if (days = '0') and (months > '1') and (years = '1') then DateDifference := months + rsMonthsAnd + years + rsYear
                                        else if (days = '0') and (months > '1') and (years > '1') then DateDifference := months + rsMonthsAnd + years + rsYears
                                             else if (days = '1') and (months = '0') and (years = '0') then DateDifference := days + rsDay
                                                  else if (days = '1') and (months = '0') and (years = '1') then DateDifference := days + rsDayAnd + years + rsYear
                                                       else if (days = '1') and (months = '0') and (years > '1') then DateDifference := days + rsDayAnd + years + rsYears
                                                            else if (days = '1') and (months = '1') and (years = '0') then DateDifference := days + rsDayAnd + months + rsMonth
                                                                 else if (days = '1') and (months = '1') and (years = '1') then DateDifference := days + rsDayMonth + months + rsMonthAnd + years + rsYear
                                                                      else if (days = '1') and (months = '1') and (years > '1') then DateDifference := days + rsDayMonth + months + rsMonthAnd + years + rsYears
                                                                           else if (days = '1') and (months > '1') and (years = '0') then DateDifference := days + rsDayAnd +  months + rsMonths
                                                                                else if (days = '1') and (months > '1') and (years = '1') then DateDifference := days + rsDayMonth + months + rsMonthsAnd + years + rsYear
                                                                                     else if (days = '1') and (months > '1') and (years > '1') then DateDifference := days + rsDayMonth + months + rsMonthsAnd + years + rsYears
                                                                                          else if (days > '1') and (months = '0') and (years = '0') then DateDifference := days + rsDaysMonth
                                                                                               else if (days > '1') and (months = '0') and (years = '1') then DateDifference :=  days + rsDaysAnd + years  + rsYear
                                                                                                    else if (days > '1') and (months = '0') and (years > '1') then DateDifference := days + rsDaysAnd + years + rsYears
                                                                                                         else if (days > '1') and (months = '1') and (years = '0') then DateDifference := days + rsDaysAnd + months + rsMonth
                                                                                                              else if (days > '1') and (months = '1') and (years = '1') then DateDifference := days + rsDays + months + rsMonthAnd + years + rsYear
                                                                                                                   else if (days > '1') and (months = '1') and (years > '1') then DateDifference := days + rsDays + months + rsMonthAnd + years + rsYears
                                                                                                                        else if (days > '1') and (months > '1') and (years = '0') then DateDifference := days + rsDaysAnd + months + rsMonths
                                                                                                                             else if (days > '1') and (months > '1') and (years = '1') then DateDifference := days + rsDays + months + rsMonthsAnd + years + rsYear
                                                                                                                                  else if (days > '1') and (months > '1') and (years > '1') then DateDifference := days + rsDays + months + rsMonthsAnd + years + rsYears
end;

    function GregorianToJulian(DateFrom : TDate) : TDate;
        var NYear, NMonth, NDay, NHour, NMin, NSec, NMilsec : Word;
            a, b : Integer;
        begin
             if DateFrom < StrToDate('15/10/1582', 'DD/MM/YYYY') then
             ErrMsg(emWrongDate)
             else
                begin
                     DecodeDate(DateFrom, NYear, NMonth, NDay);
                     DecodeTime(DateFrom, NHour, NMin, NSec, NMilsec);
                     if (NMonth < 3) then
                        begin
                             NYear := NYear - 1;
                             NMonth := NMonth + 12;
                        end;
                     b := 0;
                     a := NYear div 100;
                     b := 2 - a + a div 4;
                     Result := (365.25 * (NYear + 4716)) + (30.6001 * (NMonth + 1)) + NDay + b - 1524.5;
                     Result := Result + NHour/24.0;
                     Result := Result + NMin/24.0/60.0;
                     Result := Result + NSec/24.0/60.0/60.0;
                end;
         end;
    function GregorianToFrench (DateFrom : TDate) : TDate;
         begin

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
    var temp , alpha, A, B, C, D, E, F, Z : Double;
        NYear, NMonth, NDay, NHour, NMin, NSec, NMilsec : Word;
        begin
             if DateFrom >= StrToDate('15/10/1582', 'DD/MM/YYYY') then
             ErrMsg(emWrongDate)
             else
                begin
                     DecodeDate(DateFrom, Nyear, NMonth, NDay);
                     DecodeTime(DateFrom, NHour, NMin, NSec, NMilsec);
                     temp := DateFrom + 0.5;
                     Z := Trunc(temp);
                     F := temp - Z;
                     A := Z;
                     if (Z >= 2299161) then
                        begin
                             alpha := Trunc((Z - 1867216.25) / 36524.25);
                             A := Z + 1 + alpha - Trunc(alpha / 4);
                        end;
                     B := A + 1524;
                     C := Trunc((B - 122.1) / 365.25);
                     D := Trunc(365.25 * C);
                     E := Trunc((B - D) / 30.6001);
                     NDay := Trunc(B - D - Trunc(30.6001 * E) + F);
                     NMonth := Trunc(E - 1);
                     if E > 13 then NMonth := Trunc(E - 13);
                     NYear := Trunc(C - 4716);
                     if NMonth < 3 then NYear := Trunc(C - 4715);
                     NHour := Trunc(F * 24);
                     F := F - NHour / 24;
                     NMin := Trunc(F * 60 * 24);
                     F := F - NMin / (60 * 24);
                     NSec := Trunc(Round(F * 60 * 60 * 24 * 1000) / 1000);
                     Result := EncodeDate(NYear, NMonth, NDay);
                end;
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

    function FrenchToGregorian (DateFrom : TDate) : TDate;         // G 22/09/1792 = 24/11/1793
        begin
             if (DateFrom >= StrToDate('05/10/1793', 'DD/MM/YYYY')) or
                (DateFrom >= StrToDate('01/01/1806', 'DD/MM/YYYY')) then
                ErrMsg(emWrongDate)
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

