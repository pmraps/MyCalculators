unit GregorianConversions;

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

  TJulianDate = record
    Year: integer;
    Month: integer;
    Day: integer;
  end;

// JULIAN **********************************************************************
//function GregorianToJulian(DateFrom : TDate): TDate;
function GregorianToJulian(GregorianDate: TDate; CurrentLang: string): TDate;
function FormatJulianDate(JulianDate: TJulianDate; const DateFormat: string): string;

// FRENCH **********************************************************************
function GregorianToRepublican(Year, Month, Day: integer): TFrenchRepublicanDate;
function RepublicanDateToStr(Date: TFrenchRepublicanDate): string;

// HEBREW **********************************************************************
function GregorianToHebrew(DateFrom: TDate): THebrewDate;
function FormatHebrewDate(HebrewDate: THebrewDate; const DateFormat: string): string;

// ARAB ************************************************************************
function GregorianToArab(DateFrom: TDate): TDate;

// CHINESE *********************************************************************
function GregorianToChinese(DateFrom: TDate): TDate;

function ConvertWDayToStr(Day: integer): string;
function ConvertNDayToStr(NumberOfDay: integer): string;
function ConvertMonthToStr(Month: integer): string;

var
  WrongDate: boolean = False;

implementation

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
    'Nisan', 'Iyar', 'Sivan', 'Tammuz', 'Av', 'Elul',
    'Tishrei', 'Cheshvan', 'Kislev', 'Tevet', 'Shevat',
    'Adar I', 'Adar II'
    );

  HEBREWMONTHNAMESSHORT: array[1..13] of string = (
    'Tis', 'Che', 'Kis', 'Tet', 'She', 'Ada',
    'Nis', 'Iya', 'Siv', 'Tam', 'Av', 'Elu', 'Ad2'
    );

  JULIANMONTHNAMES: array[1..12] of string = (
    rsJanuary, rsFebruary, rsMarch, rsApril,
    rsMay, rsJune, rsJuly, rsAugust,
    rsSeptember, rsOctober, rsNovember, rsDecember
    );

  JULIANMONTHNAMESSHORT: array[1..12] of string = (
    rsShortJan, rsShortFeb, rsShortMar, rsShortApr,
    rsShortMay, rsShortJun, rsShortJul, rsShortAug,
    rsShortSep, rsShortOct, rsShortNov, rsShortDec
    );

    { Hebrew epoch: 1 Tishrei 1 AM = Julian Day 347997.5
    We work with integer JDN (noon-based), epoch = 347998 }
  HEBREW_EPOCH = 347998;

  // TO JULIAN *******************************************************************

function IsJulianLeapYear(Year: integer): boolean;
begin
  // In the Julian calendar, every year divisible by 4 is a leap year
  Result := (Year mod 4 = 0);
end;

function IsGregorianLeapYear(Year: integer): boolean;
begin
  Result := (Year mod 4 = 0) and ((Year mod 100 <> 0) or (Year mod 400 = 0));
end;

function GregorianToJulian(GregorianDate: TDate; CurrentLang: string): TDate;
var
  GYear, GMonth, GDay: word;
  A, B: integer;
  JDN: integer;   // Julian Day Number (internal use only)
  C, D, E, F: integer;
begin
  case CurrentLang of
    'de': if (GregorianDate < StrToDate('15/10/1582')) or
        (GregorianDate > StrToDate('11/01/1583')) then
        errmsg(emWrongJulianDate);
    'en': if (GregorianDate < StrToDate('15/10/1582')) or
        (GregorianDate > StrToDate('14/09/1752')) then
        errmsg(emWrongJulianDate);
    'fr': if (GregorianDate < StrToDate('15/10/1582')) or
        (GregorianDate > StrToDate('20/12/1582')) then
        errmsg(emWrongJulianDate)
    else if GregorianDate < StrToDate('15/10/1582') then
    errmsg(emWrongJulianDate);
  end;
  DecodeDate(GregorianDate, GYear, GMonth, GDay);

  // Step 1: Convert Gregorian date to Julian Day Number
  A := (14 - GMonth) div 12;
  B := GYear + 4800 - A;
  JDN := GDay + ((153 * (GMonth + 12 * A - 3) + 2) div 5) +
    (365 * B) + (B div 4) - (B div 100) + (B div 400) - 32045;

  // Step 2: Convert Julian Day Number back to Julian calendar date
  C := JDN + 32082;
  D := (4 * C + 3) div 1461;
  E := C - (1461 * D) div 4;
  F := (5 * E + 2) div 153;

  GDay := E - (153 * F + 2) div 5 + 1;
  GMonth := F + 3 - 12 * (F div 10);
  GYear := D - 4800 + (F div 10);
  Result := EncodeDate(GYear, GMonth, GDay);
end;

function FormatJulianDate(JulianDate: TJulianDate; const DateFormat: string): string;
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
          'd': // Day (1-31)
          begin
            Token := IntToStr(JulianDate.Day);
            Delete(Output, i, 2);
            Insert(Token, Output, i);
            Inc(i, Length(Token) - 1);
          end;
          'D': // Day zero-padded (01-31)
          begin
            Token := SysUtils.Format('%.*d', [2, JulianDate.Day]);
            Delete(Output, i, 2);
            Insert(Token, Output, i);
            Inc(i, Length(Token) - 1);
          end;
          'm': // Month number (1-12)
          begin
            Token := IntToStr(JulianDate.Month);
            Delete(Output, i, 2);
            Insert(Token, Output, i);
            Inc(i, Length(Token) - 1);
          end;
          'M': // Month zero-padded (01-12)
          begin
            Token := SysUtils.Format('%.*d', [2, JulianDate.Month]);
            Delete(Output, i, 2);
            Insert(Token, Output, i);
            Inc(i, Length(Token) - 1);
          end;
          'B': // Full month name
          begin
            Token := JULIANMONTHNAMES[JulianDate.Month];
            Delete(Output, i, 2);
            Insert(Token, Output, i);
            Inc(i, Length(Token) - 1);
          end;
          'b': // Short month name
          begin
            Token := JULIANMONTHNAMESSHORT[JulianDate.Month];
            Delete(Output, i, 2);
            Insert(Token, Output, i);
            Inc(i, Length(Token) - 1);
          end;
          'y': // Year (2 digits)
          begin
            Token := SysUtils.Format('%.*d', [2, JulianDate.Year mod 100]);
            Delete(Output, i, 2);
            Insert(Token, Output, i);
            Inc(i, Length(Token) - 1);
          end;
          'Y': // Year (4 digits)
          begin
            Token := IntToStr(JulianDate.Year);
            Delete(Output, i, 2);
            Insert(Token, Output, i);
            Inc(i, Length(Token) - 1);
          end;
          'l': // Leap year indicator (L/-)
          begin
            if IsJulianLeapYear(JulianDate.Year) then Token := 'L'
            else
              Token := '-';
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

// TO FRENCH *******************************************************************
// Compute Julian Day Number from Gregorian date
function GregorianToJDN(Y, M, D: integer): int64;
var
  A: int64;
begin
  A := (14 - M) div 12;
  Y := Y + 4800 - A;
  M := M + 12 * A - 3;
  Result := D + (153 * M + 2) div 5 + 365 * Y + Y div 4 - Y div 100 +
    Y div 400 - 32045;
end;

function GregorianToRepublican(Year, Month, Day: integer): TFrenchRepublicanDate;
const
  // JDN of 1 Vendémiaire An I = September 22, 1792
  EPOCH_JDN = 2375840;
var
  JDN: int64;
  DaysSinceEpoch: int64;
  RepYear, DayOfYear: integer;
  RepMonth, RepDay: integer;
begin
  JDN := GregorianToJDN(Year, Month, Day);
  DaysSinceEpoch := JDN - EPOCH_JDN;

  if DaysSinceEpoch < 0 then
    errmsg(emWrongFrenchDate);

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

function RepublicanDateToStr(Date: TFrenchRepublicanDate): string;
begin
  if Date.Month = 13 then
    Result := Format('%s An %d (%s)', [Date.DayName, Date.Year, Date.MonthName])
  else
    Result := Format('%d %s An %d', [Date.Day, Date.MonthName, Date.Year]);
end;

// TO HEBREW *******************************************************************
{ CLAUDE CODE
  Gregorian to Hebrew Date Converter
  Algorithm: Dershowitz-Reingold (Calendrical Calculations)
  Accurate for all valid Hebrew calendar dates.
}

// ── Leap year ────────────────────────────────────────────────────────────────
function IsHebrewLeapYear(Year: integer): boolean;
begin
  { A Hebrew year is a leap year when ((7*Year + 1) mod 19) < 7 }
  Result := ((Year * 7 + 1) mod 19) < 7;
end;

// ── Months in a year ─────────────────────────────────────────────────────────
function MonthsInHebrewYear(Year: integer): integer;
begin
  if IsHebrewLeapYear(Year) then
    Result := 13
  else
    Result := 12;
end;

// ── Elapsed days (molad-based) ────────────────────────────────────────────────
{ Number of days from epoch to the start of a given Hebrew year,
  using the standard molad Tohu calculation. }
function HebrewElapsedDays(Year: integer): integer;
var
  MonthsElapsed: integer;
  PartsElapsed: integer;
  Day: integer;
begin
  { Months elapsed since epoch (molad Tohu) }
  MonthsElapsed := 235 * ((Year - 1) div 19) + 12 *
    ((Year - 1) mod 19) + (((Year - 1) mod 19) * 7 + 1) div 19;

  { Parts (halakim) elapsed: each month = 29d 12h 793p = 765433 parts }
  PartsElapsed := 204 + 793 * (MonthsElapsed mod 1080);

  Day := 1 + 29 * MonthsElapsed + 12 * (MonthsElapsed div 1080) +
    (3 + 793 * (MonthsElapsed div 1080) + PartsElapsed div 1080) div 24;

  { Dechiyot (postponement rules) }
  { Rule 1 – ADU: Rosh Hashana cannot fall on Sun, Wed, or Fri (days 1,4,6) }
  if ((Day mod 7) = 2) or ((Day mod 7) = 4) or ((Day mod 7) = 6) then
    Inc(Day);

  { Rule 2 – Molad Zaken: if molad >= noon on day 3 and year is ordinary,
    postpone to day 5 (or 6 if that would be ADU) }
  if ((Day mod 7) = 0) and ((PartsElapsed mod 1080) >=
    204)  { parts portion of molad } and (not IsHebrewLeapYear(Year)) then
    Inc(Day, 2);

  { Rule 3 – GaTaRaD: leap year following ordinary, specific molad condition }
  if ((Day mod 7) = 1) and ((PartsElapsed mod 1080) >= 589) and
    IsHebrewLeapYear(Year - 1) then
    Inc(Day);

  Result := Day;
end;

// ── Days in a Hebrew year ─────────────────────────────────────────────────────
function DaysInHebrewYear(Year: integer): integer;
begin
  Result := HebrewElapsedDays(Year + 1) - HebrewElapsedDays(Year);
end;

// ── Cheshvan / Kislev length ──────────────────────────────────────────────────
{ Cheshvan (month 8 in Tishrei-first order) is long (30 days)
  only in a "complete" (shalem) year of 355 or 385 days. }
function IsLongCheshvan(Year: integer): boolean;
begin
  Result := (DaysInHebrewYear(Year) mod 10) = 5;
end;

{ Kislev (month 9) is short (29 days) only in a "deficient" (chaser)
  year of 353 or 383 days. }
function IsShortKislev(Year: integer): boolean;
begin
  Result := (DaysInHebrewYear(Year) mod 10) = 3;
end;

// ── Days in a Hebrew month ────────────────────────────────────────────────────
{ Months are numbered in Tishrei-first order (as used internally):
    1=Tishrei  2=Cheshvan  3=Kislev  4=Tevet  5=Shevat
    6=Adar I   7=Adar II   8=Nisan   9=Iyar  10=Sivan
   11=Tammuz  12=Av       13=Elul                       }
function DaysInHebrewMonth(Year, Month: integer): integer;
begin
  case Month of
    1, 5, 7, 8, 10, 12: Result := 30;   { Tishrei,Kislev,Shevat,AdarII,Nisan,Sivan,Av }
    4, 6, 9, 11, 13: Result := 29;   { Tevet,AdarI,Iyar,Tammuz,Elul }
    2: if IsLongCheshvan(Year) then Result := 30
      else
        Result := 29;
    3: if IsShortKislev(Year) then Result := 29
      else
        Result := 30;
    else
      Result := 0;
  end;
end;

// ── Gregorian → Julian Day Number ────────────────────────────────────────────
function GregorianToJDN(Year, Month, Day: integer): integer;
var
  A, B: integer;
begin
  A := (14 - Month) div 12;
  B := Year + 4800 - A;
  Result := Day + (153 * (Month + 12 * A - 3) + 2) div
    5 + 365 * B + B div 4 - B div 100 +
    B div 400 - 32045;
end;

// ── Julian Day Number → Hebrew Date ──────────────────────────────────────────
{ Core conversion: given a JDN, return the Hebrew date.
  Uses the elapsed-days epoch and searches forward from an approximate year. }
function JDNToHebrew(JDN: integer): THebrewDate;
var
  Approx: integer;
  Year: integer;
  Month: integer;
  Day: integer;
  Start: integer;
begin
  { Step 1: approximate Hebrew year from JDN }
  Approx := (JDN - HEBREW_EPOCH) * 98496;   { 98496/35975351 ≈ 1/mean-year }
  Approx := Approx div 35975351 + 1;

  { Step 2: find the actual year (the one whose Rosh Hashana <= JDN) }
  Year := Approx;
  while HebrewElapsedDays(Year + 1) + HEBREW_EPOCH - 1 <= JDN do
    Inc(Year);
  while HebrewElapsedDays(Year) + HEBREW_EPOCH - 1 > JDN do
    Dec(Year);

  { Step 3: day within the year }
  Start := HebrewElapsedDays(Year) + HEBREW_EPOCH - 1;
  Day := JDN - Start + 1;

  { Step 4: find the month }
  { Hebrew months start at Tishrei (month 1 internally) }
  Month := 1;
  while Day > DaysInHebrewMonth(Year, Month) do
  begin
    Day := Day - DaysInHebrewMonth(Year, Month);
    Inc(Month);
  end;

  { Step 5: convert internal month numbering (Tishrei=1) to
    traditional display order (Nisan=1) for the HebrewMonthNames array.
    In a regular year:  internal 1..12  → display 7,8,9,10,11,12,1,2,3,4,5,6
    In a leap year:     internal 1..13  → display 7,8,9,10,11,12,13,1,2,3,4,5,6
    We keep internal numbering for THebrewDate.Month so callers can still
    index HebrewMonthNames directly.                                          }
  Result.Day := Day;
  Result.Month := Month;
  Result.Year := Year;
end;

// ── Main conversion (public API) ──────────────────────────────────────────────
function GregorianToHebrew(DateFrom: TDate): THebrewDate;
var
  GYear, GMonth, GDay: word;
begin
  DecodeDate(DateFrom, GYear, GMonth, GDay);
  Result := JDNToHebrew(GregorianToJDN(GYear, GMonth, GDay));
end;

// ── Display ───────────────────────────────────────────────────────────────────
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
            Token := Format('%.*d', [2, HebrewDate.Day]);
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

// TO ARAB *********************************************************************
function GregorianToArab(DateFrom: TDate): TDate;
begin
  Result := DateFrom;
end;

// TO CHINESE
function GregorianToChinese(DateFrom: TDate): TDate;
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
