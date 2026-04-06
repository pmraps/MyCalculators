unit DateFunctions;

{$mode ObjFPC}{$H+}

interface

uses
    Classes, SysUtils, ErrorCatching;

    function GregorianConversion (DateFrom : TDate; ConvertTo : Char) : TDate;
    function JulianConversion (DateFrom : TDate; ConvertTo : Char) : TDate;
    function FrenchConversion (DateFrom : TDate; ConvertTo : Char) : TDate;
{    function HebrewConversion (Date : TDate; ConvertTo : Char) : TDate;
    function ArabConversion (Date : TDate; ConvertTo : Char) : TDate;
    function ChineseConversion (Date : TDate; ConvertTo : Char) : TDate;}

    function GregorianJulian(DateFrom : TDate; Calendar : Char) : TDate;

implementation

    function GregorianConversion(DateFrom : TDate; ConvertTo : Char) : TDate;
         begin
              if DateFrom < StrToDate('15/10/1582', 'DD/MM/YYYY') then
              ErrMsg(emWrongDate)
              else Result := GregorianJulian(DateFrom, ConvertTo);
         end;

    function JulianConversion (DateFrom : TDate; ConvertTo : Char) : TDate;
        begin
             if DateFrom >= StrToDate('15/10/1582', 'DD/MM/YYYY') then
             ErrMsg(emWrongDate)
             else Result := GregorianJulian(DateFrom, ConvertTo);
         end;

    function FrenchConversion (DateFrom : TDate) : TDate;
    // G 22/09/1792 = 24/11/1793

             begin
                  if (DateFrom >= StrToDate('05/10/1793', 'DD/MM/YYYY')) or
                     (DateFrom >= StrToDate('01/01/1806', 'DD/MM/YYYY')) then
                     ErrMsg(emWrongDate)
                  else Result := FrenchDate(DateFrom);
             end;


    function GregorianJulian(DateFrom : TDate; Calendar : Char) : TDate;
        var NYear, NMonth, NDay : Word;
        begin
            DecodeDate(DateFrom, NYear, NMonth, NDay);
             if Calendar = 'J' then                  // Gregorian to Julian
                begin
                    if NDay > 13 then NDay := NDay - 13
                    else begin
                           if NMonth = 2 then
                                if IsLeapYear(NYear) then NDay := NDay + 16
                                else NDay := NDay + 15
                           else NDay := NDay + 18;
                           NMonth := NMonth - 1;
                         end;
                end
             else begin
                        if NDay <= 13 then NDay := NDay + 13
                        else begin
                               if NMonth = 2 then
                                    if IsLeapYear(NYear) then NDay := NDay + 15
                                    else NDay := NDay + 14
                               else NDay := NDay + 17;
                               NMonth := NMonth - 1;
                             end;
                    end;
             Result := EncodeDate(NYear, NMonth, NDay);
        end;

end.

