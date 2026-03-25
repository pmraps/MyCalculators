unit FsiConv;

{
  Conversion routines that are not present in the standard
  FreePascal or Lazarus/LazUtils libraries.

  Copyright (C) 2022 Bart Broersma and Flying Sheep Inc.

  This library is free software; you can redistribute it and/or modify it
  under the terms of the GNU Library General Public License as published by
  the Free Software Foundation; either version 2 of the License, or (at your
  option) any later version with the following modification:

  As a special exception, the copyright holders of this library give you
  permission to link this library with independent modules to produce an
  executable, regardless of the license terms of these independent modules,and
  to copy and distribute the resulting executable under terms of your choice,
  provided that you also meet, for each linked independent module, the terms
  and conditions of the license of that module. An independent module is a
  module which is not derived from or based on this library. If you modify
  this library, you may extend this exception to your version of the library,
  but you are not obligated to do so. If you do not wish to do so, delete this
  exception statement from your version.

  This program is distributed in the hope that it will be useful, but WITHOUT
  ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
  FITNESS FOR A PARTICULAR PURPOSE. See the GNU Library General Public License
  for more details.

  You should have received a copy of the GNU Library General Public License
  along with this library; if not, write to the Free Software Foundation,
  Inc., 51 Franklin Street - Fifth Floor, Boston, MA 02110-1335, USA.
}


{$mode ObjFPC}{$H+}

interface

uses
  SysUtils, Math, SysConst;

type
  TBaseRange = 2..36;


function IntToStrBase(N: DWord; const Base: TBaseRange): string;
function IntToStrBase(N: QWord; const Base: TBaseRange): string;
{
  Notice: the signed versions by design will return strings like:
  - in Base 10: -123
  - in Base 36: -z
  - in Base  2: -1010
  - in Base 16: -ABCD
  This is different from the IntToHex/InToBin functions that treat *all* input as insigned
}
function IntToStrBase(N: Int64; const Base: TBaseRange): string;
function IntToStrBase(N: LongInt; const Base: TBaseRange): string;

function TryStrToQWordBase(const S: String; const Base: TBaseRange; out AValue: QWord): Boolean;
function TryStrToDWordBase(const S: String; const Base: TBaseRange; out AValue: DWord): Boolean;
function TryStrToWordBase(const S: String; const Base: TBaseRange; out AValue: Word): Boolean;
function TryStrToByteBase(const S: String; const Base: TBaseRange; out AValue: Byte): Boolean;

function StrToQWordDefBase(const S: String; const Base: TBaseRange; const ADef: QWord): QWord;
function StrToDWordDefBase(const S: String; const Base: TBaseRange; const ADef: DWord): DWord;
function StrToWordDefBase(const S: String; const Base: TBaseRange; const ADef: Word): Word;
function StrToByteDefBase(const S: String; const Base: TBaseRange; const ADef: Byte): Byte;

function StrToQWordBase(const S: String; const Base: TBaseRange): QWord;
function StrToDWordBase(const S: String; const Base: TBaseRange): DWord;
function StrToWordBase(const S: String; const Base: TBaseRange): Word;
function StrToByteBase(const S: String; const Base: TBaseRange): Byte;

function TryStrToInt64Base(const S: String; const Base: TBaseRange; out AValue: Int64): Boolean;
function TryStrToIntBase(const S: String; const Base: TBaseRange; out AValue: Integer): Boolean;
function TryStrToSmallIntBase(const S: String; const Base: TBaseRange; out AValue: SmallInt): Boolean;
function TryStrToShortIntBase(const S: String; const Base: TBaseRange; out AValue: ShortInt): Boolean;

function StrToInt64DefBase(const S: String; const Base: TBaseRange; const ADef: Int64): Int64;
function StrToIntDefBase(const S: String; const Base: TBaseRange; const ADef: Integer): Integer;
function StrToSmallIntDefBase(const S: String; const Base: TBaseRange; const ADef: SmallInt): SmallInt;
function StrToShortIntDefBase(const S: String; const Base: TBaseRange; const ADef: ShortInt): ShortInt;

function StrToInt64Base(const S: String; const Base: TBaseRange): Int64;
function StrToIntBase(const S: String; const Base: TBaseRange): Integer;
function StrToSmallIntBase(const S: String; const Base: TBaseRange): SmallInt;
function StrToShortIntBase(const S: String; const Base: TBaseRange): ShortInt;

//Treats all input and output as QWord
function TryBaseToBaseUnsigned(const S: String; const BaseIn, BaseOut: TBaseRange; out AValue: String): Boolean;
function BaseToBaseUnsigned(const S: String; const BaseIn, BaseOut: TBaseRange): String;
//Treats all input as Int64
function TryBaseToBase(const S: String; const BaseIn, BaseOut: TBaseRange; out AValue: String): Boolean;
function BaseToBase(const S: String; const BaseIn, BaseOut: TBaseRange): String;

//use at your own risk...
function CheckAndRemoveValidThousandSeparators(var S: String; const FS: TFormatSettings): Boolean;

//TryStrToFloatEx allows ThousandSeparators (if properly placed)
{$ifdef FPC_HAS_TYPE_SINGLE}
function TryStrToFloatEx(S: String; FS: TFormatSettings; out Res: Single): Boolean;
{$endif FPC_HAS_TYPE_SINGLE}
{$ifdef FPC_HAS_TYPE_DOUBLE}
function TryStrToFloatEx(S: String; FS: TFormatSettings; out Res: Double): Boolean;
{$endif FPC_HAS_TYPE_DOUBLE}
{$ifdef FPC_HAS_TYPE_EXTENDED}
function TryStrToFloatEx(S: String; FS: TFormatSettings; out Res: Extended): Boolean;
{$endif FPC_HAS_TYPE_EXTENDED}
function StrToFloatEx(S: String; FS: TFormatSettings): Extended;
function StrToFloatDefEx(S: String; const Def: Extended; FS: TFormatSettings): Extended;

//String to Integer conversion that accept thousandseparators
function TryStrToIntEx(S: String; FS: TFormatSettings; out Res: Integer): Boolean;
function TryStrToIntEx(S: String; AThousandSeparator: Char; out Res: Integer): Boolean;
function TryStrToInt64Ex(S: String; FS: TFormatSettings; out Res: Int64): Boolean;
function TryStrToInt64Ex(S: String; AThousandSeparator: Char; out Res: Int64): Boolean;
function TryStrToDWordEx(S: String; FS: TFormatSettings; out Res: DWord): Boolean;
function TryStrToDWordEx(S: String; AThousandSeparator: Char; out Res: DWord): Boolean;
function TryStrToQWordEx(S: String; FS: TFormatSettings; out Res: QWord): Boolean;
function TryStrToQWordEx(S: String; AThousandSeparator: Char; out Res: QWord): Boolean;
function StrToIntEx(S: String; FS: TFormatSettings): Integer;
function StrToIntEx(S: String; AThousandSeparator: Char): Integer;
function StrToIntDefEx(S: String; const Def: Integer; FS: TFormatSettings): Integer;
function StrToIntDefEx(S: String; const Def: Integer; AThousandSeparator: Char): Integer;
function StrToInt64Ex(S: String; FS: TFormatSettings): Int64;
function StrToInt64Ex(S: String; AThousandSeparator: Char): Int64;
function StrToInt64DefEx(S: String; const Def: Int64; FS: TFormatSettings): Int64;
function StrToInt64DefEx(S: String; const Def: Int64; AThousandSeparator: Char): Int64;
function StrToDWordEx(S: String; FS: TFormatSettings): DWord;
function StrToDWordEx(S: String; AThousandSeparator: Char): DWord;
function StrToDWordDefEx(S: String; const Def: DWord; FS: TFormatSettings): DWord;
function StrToIntDWordEx(S: String; const Def: DWord; AThousandSeparator: Char): DWord;
function StrToQWordEx(S: String; FS: TFormatSettings): QWord;
function StrToQWordEx(S: String; AThousandSeparator: Char): Integer;
function StrToQWordDefEx(S: String; const Def: QWord; FS: TFormatSettings): QWord;
function StrToIntQWordEx(S: String; const Def: QWord; AThousandSeparator: Char): QWord;

function IntToStrEx(Value: LongInt; FS: TFormatSettings): String;
function IntToStrEx(Value: Int64; FS: TFormatSettings): String;
function IntToStrEx(Value: QWord; FS: TFormatSettings): String;

ResourceString
  SInvalidIntegerBase = '%s is not a valid integer in base %d';


type
  TPressureUnit = (
    puPascal,                  //Pascal = SI unit for pressure
    puBar,                     //Bar
    puAtmosphere,              //(Standard) Atmosphere
    puTechnicalAtmosphere,     //Technical Atmosphere
    puTorr,                    //mmHg    Hg = Mercury)
    puInchHg,                  //InHg    Inch of Mercury
    puFootHg,                  //ftHg    Foot of Mercury
    puMmH2O,                   //mmH2O   mm of Water
    puCmH2O,                   //cmH2O   cm of Water   (appr. 0.999972 Atmosphere)
    puInchH2O,                 //inH2O   inch of Water
    puPoundForcePerSquareInch, //Pound force per square inch
    puPoundForcePerSquareFoot, //Pound force per square foot
    puPoundalPerSquareFoot,    //Poundall per square foot
    puShortTonPerSqaureFoot,   //Short Ton per square foot
    puKgForcePerSquareMm       //Kg force per square mm (or 100 Atmosphere)
  );

const
  pummHg = puTorr;
  puKgPerSquareCm = puAtmosphere;

type
  TForceUnit = (
    fuNewton,        //SI unit
    fuAtomic,        //Atomic unit of force
    fuDyne,          //g*cm/s
    fuKgForce,       //kg*standard accelleration due to gravity (g0),
    fuKip,           //1000 lb*g0,
    fuMilliGrave,    //1 gram*g0
    fuLongTonForce,  //long ton*g0
    fuShortTonForce, //g0 * 1 short ton
    fuOunceForce,    //1 oz * g0
    fuPoundForce,    //1 lb * g0
    fuPoundal,       //1 lb.ft/s2
    fuSthene         //1 t.m/s2
  );

type
  TSpeedUnit = (
    suMeterPerSecond,      // SI unit
    suFootPerMinute,
    suFootPerSecond,
    suFurlongPerFortnight, // furlong/fortnight
    suInchPerHour,
    suInchPerMinute,
    suInchPerSecond,
    suKmPerHour,
    suKnot,                // 1 nmi/h = 1.852 km/h
    suKnotAdmiralty,       // 1 NM (Adm)/h
    suMilePerHour,
    suMilePerMinute,
    suMilePerSecond,
    suSpeedOfLight         // in a vacuum
    //no suMach or suSoundSpeed since this is not a constant
  );

type
  TEnergyUnit = (
    euJoule,               // SI Unit The work done when a force of one newton moves the point of its application a distance of one metre in the direction of the force.[35]
    euCalIT,               // calorie international table
    euCalMean,             // 1⁄100 of the energy required to warm one gram of air-free water from 0 °C to 100 °C at a pressure of 1 atm
    euCalThermoMechanical, //
    euCalFDA,              //  1000 calth
    euCelsiusHeatUnit,     //
    euElectronVolt,        // elementary charge * 1V
    euErg,                 // 1 g.cm2/s2
    euFootPoundForce,      // g0 × 1 lb × 1 ft
    euFootPoundal,         // 1 lb*ft2/s2
    euHartree,             // atomic unit of energy
    euHorsePowerHour,      // 1 hp × 1 h
    euInchPoundForce,      // g0 × 1 lb × 1 in
    euKiloCalorie,         // 1000 calIT
    euWattHour,            // 1 W × 1 h
    euKiloWattHour,        // 1 kW × 1 h
    euRydberg,             // Rydberg constant for heavy elements*Planck constant*c
    euThermie,             // 1 McalIT
    euTonTNT               // 1 Gcalth
  );

const
  euWattSecond = euJoule;

type
  TTemperatureUnit = (
    tuKelvin,        // SI base unit
    tuCelsius,       // [°C] ≡ [K] − 273.15 	[K] ≡ [°C] + 273.15
    tuDelisle,       // [K] = 373.15 − [°De] × 2⁄3
    tuFahrenheit,    // [°F] ≡ [°C] × 9⁄5 + 32 	[K] ≡ ([°F] + 459.67) × 5⁄9
    tuNewton,        // [K] = [°N] × 100⁄33 + 273.15
    tuRankine,       // [°R] ≡ [K] × 9⁄5 	[K] ≡ [°R] × 5/9
    tuReamur,        // [K] = [°Ré] × 5⁄4 + 273.15
    tuRomer,         // [K] = ([°Rø] − 7.5) × 40⁄21 + 273.15
    tuReguloGasMark  // [°F] ≡ [GM] × 25 + 250 	[K] ≡ [GM] × 125⁄9 + 394.26
  );


type
  TMomentUnit = (
    muNewtonMeter,    // SI Unit
    muPoundForceFoot, // g0 × 1 lb × 1 ft
    muPoundalFoot,    // 1 lb*ft^2/s^2
    muPoundForceInch, // g0 × 1 lb × 1 in
    muKgForceMeter    // g0 × N × m
  );
  //some aliasses for those who prefer Torque ove Moment
  TTorqueUnit = TMomentUnit;

const
  tuNewtonMeter = muNewtonMeter;
  tuPoundForceFoot = muPoundForceFoot;
  tuPoundalFoot = muPoundalFoot;
  tuPoundForceInch = muPoundForceInch;
  tuKgForceMeter = muKgForceMeter;



function Convert(AValue: Double; aFrom, aTo: TPressureUnit): Double;
function Convert(AValue: Double; aFrom, aTo: TForceUnit): Double;
function Convert(AValue: Double; aFrom, aTo: TSpeedUnit): Double;
function Convert(AValue: Double; aFrom, aTo: TEnergyUnit): Double;
function Convert(AValue: Double; aFrom, aTo: TTemperatureUnit): Double;
function Convert(AValue: Double; aFrom, aTo: TMomentUnit): Double;

//Because fpc's StdConvs unit also has them
function FahrenheitToCelsius(const AValue: Double): Double;
function CelsiusToFahrenheit(const AValue: Double): Double;
function CelsiusToKelvin(const AValue: Double): Double;
function KelvinToCelsius(const AValue: Double): Double;


implementation

procedure DivMod(Dividend: QWord; Divisor: QWord; var Result, Remainder: QWord); overload;
begin
  //writeln('DivMod QWord version');
  Remainder := Dividend mod Divisor;
  Result := Dividend div Divisor;
end;

// based upon https://wiki.lazarus.freepascal.org/Base_converting
function IntToStrBase(N: DWord; const Base: TBaseRange): string;
const
  Digits = '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ';
var
  Remainder: DWord;
begin
  // while concatenating strings is expensive,
  // preallocating with StringOfChar and then deleting leading zero's is actually slower
  if (N = 0) then
    Exit('0');
  Result := ''; //StringOfChar('0',Len);
  repeat
    DivMod(N, DWord(Base), N, {%H-}Remainder);
    Result := Digits[Remainder + 1] + Result;
  until (N = 0);
end;

function IntToStrBase(N: QWord; const Base: TBaseRange): string;
const
  Digits = '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ';
var
  Remainder: QWord;
begin
  if (N = 0) then
    Exit('0');
  Result := '';
  repeat
    DivMod(N, QWord(Base), N, {%H-}Remainder);
    Result := Digits[Remainder + 1] + Result;
  until (N = 0);
end;

function IntToStrBase(N: Int64; const Base: TBaseRange): string;
begin
  if (N < 0) then
    Result := '-' + IntToStrBase(QWord(Abs(N)), Base)
  else
    Result := IntToStrBase(QWord(N), Base);
end;

function IntToStrBase(N: LongInt; const Base: TBaseRange): string;
begin
  if (N < 0) then
    Result := '-' + IntToStrBase(DWord(Abs(N)), Base)
  else
    Result := IntToStrBase(DWord(N), Base);
end;

function TryStrToQWordBase(const S: String; const Base: TBaseRange; out AValue: QWord): Boolean;
const
  Digits = '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ';
var
  i, DigitValue: Integer;
  C: Char;
begin
  Result := False;
  if (S = '') then
    Exit;
  AValue := 0;
  for i := 1 to Length(S) do
  begin
    C := UpCase(S[i]);
    DigitValue := Pos(C, Digits) - 1;
    if (DigitValue < 0) or (DigitValue >= Base) then
    begin
      //writeln(format('S[%d]=%s, DigitValue=%d > %d or not in digist at all',[i,s[i],digitvalue,base]));
      Exit;
    end;
    if (((High(QWord) - DigitValue) div QWord(Base)) < AValue) then
    begin
      //writeln('High(QWord) - DigitValue = ',High(QWord) - DigitValue);
      //writeln('(High(QWord) - DigitValue) div QWord(Base) = ',(High(QWord) - DigitValue) div QWord(Base));
      //writeln('AValue = ',AValue);
      Exit;
    end;
    AValue := (AValue * Base) + DigitValue;
  end;
  Result := True;
end;

function TryStrToDWordBase(const S: String; const Base: TBaseRange; out AValue: DWord): Boolean;
var
  AQWord: QWord;
begin
  Result := TryStrToQWordBase(S, Base, AQWord);
  Result := Result and (AQWord <= High(DWord));
  if Result then
    AValue := AQWord;
end;

function TryStrToWordBase(const S: String; const Base: TBaseRange; out AValue: Word): Boolean;
var
  AQWord: QWord;
begin
  Result := TryStrToQWordBase(S, Base, AQWord);
  Result := Result and (AQWord <= High(Word));
  if Result then
    AValue := AQWord;
end;

function TryStrToByteBase(const S: String; const Base: TBaseRange; out
  AValue: Byte): Boolean;
var
  AQWord: QWord;
begin
  Result := TryStrToQWordBase(S, Base, AQWord);
  Result := Result and (AQWord <= High(Byte));
  if Result then
    AValue := AQWord;
end;

function StrToQWordDefBase(const S: String; const Base: TBaseRange; const ADef: QWord): QWord;
begin
  if not TryStrToQWordBase(S, Base, Result) then
    Result := ADef;
end;

function StrToDWordDefBase(const S: String; const Base: TBaseRange; const ADef: DWord): DWord;
begin
  if not TryStrToDWordBase(S, Base, Result) then
    Result := ADef;
end;

function StrToWordDefBase(const S: String; const Base: TBaseRange; const ADef: Word): Word;
begin
  if not TryStrToWordBase(S, Base, Result) then
    Result := ADef;
end;

function StrToByteDefBase(const S: String; const Base: TBaseRange; const ADef: Byte): Byte;
begin
  if not TryStrToByteBase(S, Base, Result) then
    Result := ADef;
end;

function StrToQWordBase(const S: String; const Base: TBaseRange): QWord;
begin
  if not TryStrToQWordBase(S, Base, Result) then
    Raise EConvertError.CreateFmt(SInvalidIntegerBase,[S, Base]);
end;

function StrToDWordBase(const S: String; const Base: TBaseRange): DWord;
begin
  if not TryStrToDWordBase(S, Base, Result) then
    Raise EConvertError.CreateFmt(SInvalidIntegerBase,[S, Base]);
end;

function StrToWordBase(const S: String; const Base: TBaseRange): Word;
begin
  if not TryStrToWordBase(S, Base, Result) then
    Raise EConvertError.CreateFmt(SInvalidIntegerBase,[S, Base]);
end;

function StrToByteBase(const S: String; const Base: TBaseRange): Byte;
begin
  if not TryStrToByteBase(S, Base, Result) then
    Raise EConvertError.CreateFmt(SInvalidIntegerBase,[S, Base]);
end;

function TryStrToInt64Base(const S: String; const Base: TBaseRange; out AValue: Int64): Boolean;
var
  AQWord: QWord;
  Negative: Boolean;
begin
  Negative := (S <> '') and (S[1] = '-');
  if Negative then
  begin
    Result := TryStrToQWordBase(Copy(S, 2, Length(S)-1), Base, AQWord);
    Result := Result and (AQWord <= QWord(High(Int64) + 1));
    if Result then
    begin
      if (AQWord = High(Int64) + 1) then
        AValue := Low(Int64)
      else
        AValue := -Int64(AQWord);
    end;
  end
  else
  begin
    Result := TryStrToQWordBase(S, Base, AQWord);
    Result := Result and (AQWord <= High(Int64));
    if Result then
      AValue := Int64(AQWord);
  end;
end;

function TryStrToIntBase(const S: String; const Base: TBaseRange; out AValue: Integer): Boolean;
var
  AInt64: Int64;
begin
  Result := TryStrToInt64Base(S, Base, AInt64);
  Result := Result and (AInt64 <= High(Integer)) and (AInt64 >= Low(Integer));
  if Result then
    AValue := AInt64;
end;

function TryStrToSmallIntBase(const S: String; const Base: TBaseRange; out AValue: SmallInt): Boolean;
var
  AInt64: Int64;
begin
  Result := TryStrToInt64Base(S, Base, AInt64);
  Result := Result and (AInt64 <= High(SmallInt)) and (AInt64 >= Low(SmallInt));
  if Result then
    AValue := AInt64;
end;

function TryStrToShortIntBase(const S: String; const Base: TBaseRange; out AValue: ShortInt): Boolean;
var
  AInt64: Int64;
begin
  Result := TryStrToInt64Base(S, Base, AInt64);
  Result := Result and (AInt64 <= High(ShortInt)) and (AInt64 >= Low(ShortInt));
  if Result then
    AValue := AInt64;
end;

function StrToInt64DefBase(const S: String; const Base: TBaseRange; const ADef: Int64): Int64;
begin
  if not TryStrToInt64Base(S, Base, Result) then
    Result := ADef;
end;

function StrToIntDefBase(const S: String; const Base: TBaseRange; const ADef: Integer): Integer;
begin
  if not TryStrToIntBase(S, Base, Result) then
    Result := ADef;
end;

function StrToSmallIntDefBase(const S: String; const Base: TBaseRange; const ADef: SmallInt): SmallInt;
begin
  if not TryStrToSmallIntBase(S, Base, Result) then
    Result := ADef;
end;

function StrToShortIntDefBase(const S: String; const Base: TBaseRange; const ADef: ShortInt): ShortInt;
begin
  if not TryStrToShortIntBase(S, Base, Result) then
    Result := ADef;
end;

function StrToInt64Base(const S: String; const Base: TBaseRange): Int64;
begin
  if not TryStrToInt64Base(S, Base, Result) then
    Raise EConvertError.CreateFmt(SInvalidIntegerBase,[S, Base]);
end;

function StrToIntBase(const S: String; const Base: TBaseRange): Integer;
begin
  if not TryStrToIntBase(S, Base, Result) then
    Raise EConvertError.CreateFmt(SInvalidIntegerBase,[S, Base]);
end;

function StrToSmallIntBase(const S: String; const Base: TBaseRange): SmallInt;
begin
  if not TryStrToSmallIntBase(S, Base, Result) then
    Raise EConvertError.CreateFmt(SInvalidIntegerBase,[S, Base]);
end;

function StrToShortIntBase(const S: String; const Base: TBaseRange): ShortInt;
begin
  if not TryStrToShortIntBase(S, Base, Result) then
    Raise EConvertError.CreateFmt(SInvalidIntegerBase,[S, Base]);
end;

function TryBaseToBaseUnsigned(const S: String; const BaseIn, BaseOut: TBaseRange; out AValue: String): Boolean;
var
  AQWord: QWord;
begin
  Result := TryStrToQWordBase(S, BaseIn, AQWord);
  if Result then
    AValue := IntToStrBase(AQWord, BaseOut);
end;

function BaseToBaseUnsigned(const S: String; const BaseIn, BaseOut: TBaseRange): String;
begin
  if not TryBaseToBaseUnsigned(S, BaseIn, BaseOut, Result) then
    Raise EConvertError.CreateFmt(SInvalidIntegerBase,[S, BaseIn]);
end;

function TryBaseToBase(const S: String; const BaseIn, BaseOut: TBaseRange; out AValue: String): Boolean;
var
  AInt64: Int64;
begin
  Result := TryStrToInt64Base(S, BaseIn, AInt64);
  if Result then
    AValue := IntToStrBase(AInt64, BaseOut);
end;

function BaseToBase(const S: String; const BaseIn, BaseOut: TBaseRange): String;
begin
  if not TryBaseToBase(S, BaseIn, BaseOut, Result) then
    Raise EConvertError.CreateFmt(SInvalidIntegerBase,[S, BaseIn]);
end;


{
  Removes ThousandSeparator from string which is supposed to be representing a floating point or integer value.
  Returns True if
  - ThousandSeparator in not present (string is unchanged)
  - ThousandSeparator separate digits properly in groups of three (ThousandSeparators are removed)

  Examples of valid string values (assuming FS.DecimalSeparator = '.' and ThousandSeparator = ','):
    '1,234.5'
    '-1,234,567.98E10'
  Examples of invalid string values
    '12,45'   : ThousandSeparator not in correct place
    '12.45,0' : ThousandSeparator after DecimalSeparator
    ',123,456': ThousandSeparator before first digit
    '$123,456': ThousandSeparator not allowed in hexadecimal notation

  Notice that the function does NOT check wether sthe string is actually a valid representation of a number,
  so a non-sensical string like 'abc,def.ghiE-xyz' will return True and be changed to 'abcdef.ghiE-xyz'
}
function CheckAndRemoveValidThousandSeparators(var S: String; const FS: TFormatSettings): Boolean;
var
  P, L, FirstDigit: Integer;
  Ch: Char;
begin
  if (Pos(FS.ThousandSeparator, S) = 0) then
    Exit(True);
  Result := False;
  P := Pos(FS.DecimalSeparator, S);
  if (P = 0) then
  begin
    P := Pos('E', UpperCase(S));  //123E10
    if (P = 0) then
      P := Length(S) + 1;
  end;
  //No TS allowed after DS or E
  if (Pos(FS.ThousandSeparator, S, P-1) > 0) then
    Exit;
  FirstDigit := 0;
  for L := 1 to Length(S) do
  begin
    //Disallow in binary, octal or hexadecimal representations
    //otherwise the invalid string '$1,234' will become a valid '$1234'
    //and disallow any TS before a digit is found
    if (S[L] in ['$','x','X','%','&', FS.ThousandSeparator]) then
      Exit;
    if S[L] in ['0'..'9'] then
    begin
      FirstDigit := L;
      Break;
    end;
  end;
  begin
    Dec(P);
    L := 1;
    while (P > FirstDigit) do
    begin
      Ch := S[P];
      if ((L mod 4) = 0) then
      begin
        if (Ch <> FS.ThousandSeparator) then
          Exit;
      end
      else
      begin
        if (Ch = FS.ThousandSeparator) then
          Exit;
      end;
      Dec(P);
      Inc(L);
    end;
  end;
  S := StringReplace(S, FS.ThousandSeparator, '', [rfReplaceAll]);
  Result := True;
end;


{$ifdef FPC_HAS_TYPE_SINGLE}
function TryStrToFloatEx(S: String; FS: TFormatSettings; out Res: Single): Boolean;
begin
  if not CheckAndRemoveValidThousandSeparators(S, FS) then
    Exit(False);
  Result := TryStrToFloat(S, Res, FS);
end;
{$endif FPC_HAS_TYPE_SINGLE}

{$ifdef FPC_HAS_TYPE_DOUBLE}
function TryStrToFloatEx(S: String; FS: TFormatSettings; out Res: Double): Boolean;
begin
  if not CheckAndRemoveValidThousandSeparators(S, FS) then
    Exit(False);
  Result := TryStrToFloat(S, Res, FS);
end;
{$endif FPC_HAS_TYPE_DOUBLE}

{$ifdef FPC_HAS_TYPE_EXTENDED}
function TryStrToFloatEx(S: String; FS: TFormatSettings; out Res: Extended): Boolean;
begin
  if not CheckAndRemoveValidThousandSeparators(S, FS) then
    Exit(False);
  Result := TryStrToFloat(S, Res, FS);
end;
{$endif FPC_HAS_TYPE_EXTENDED}
function StrToFloatEx(S: String; FS: TFormatSettings): Extended;
begin
  CheckAndRemoveValidThousandSeparators(S, FS);
  Result := StrToFloat(S, FS);
end;

function StrToFloatDefEx(S: String; const Def: Extended; FS: TFormatSettings): Extended;
begin
  if not CheckAndRemoveValidThousandSeparators(S, FS) then
    raise EConvertError.CreateFmt(SInValidFLoat,[S]);
  Result := StrToFloatDef(S, Def, FS);
end;

function TryStrToIntEx(S: String; FS: TFormatSettings; out Res: Integer): Boolean;
begin
  if (FS.ThousandSeparator = FS.DecimalSeparator) or not CheckAndRemoveValidThousandSeparators(S, FS) then
    Exit(False);
  Result := TryStrToInt(S, Res);
end;

function TryStrToIntEx(S: String; AThousandSeparator: Char; out Res: Integer): Boolean;
var
  FS: TFormatSettings;
begin
  FS := DefaultFormatSettings;
  FS.ThousandSeparator := AThousandSeparator;
  Result := TryStrToIntEx(S, FS, Res);
end;

function TryStrToInt64Ex(S: String; FS: TFormatSettings; out Res: Int64): Boolean;
begin
  if (FS.ThousandSeparator = FS.DecimalSeparator) or not CheckAndRemoveValidThousandSeparators(S, FS) then
    Exit(False);
  Result := TryStrToInt64(S, Res);
end;

function TryStrToInt64Ex(S: String; AThousandSeparator: Char; out Res: Int64): Boolean;
var
  FS: TFormatSettings;
begin
  FS := DefaultFormatSettings;
  FS.ThousandSeparator := AThousandSeparator;
  Result := TryStrToInt64Ex(S, FS, Res);
end;

function TryStrToDWordEx(S: String; FS: TFormatSettings; out Res: DWord): Boolean;
begin
  if (FS.ThousandSeparator = FS.DecimalSeparator) or not CheckAndRemoveValidThousandSeparators(S, FS) then
    Exit(False);
  Result := TryStrToDWord(S, Res);
end;

function TryStrToDWordEx(S: String; AThousandSeparator: Char; out Res: DWord): Boolean;
var
  FS: TFormatSettings;
begin
  FS := DefaultFormatSettings;
  FS.ThousandSeparator := AThousandSeparator;
  Result := TryStrToDWordEx(S, FS, Res);
end;

function TryStrToQWordEx(S: String; FS: TFormatSettings; out Res: QWord): Boolean;
begin
  if (FS.ThousandSeparator = FS.DecimalSeparator) or not CheckAndRemoveValidThousandSeparators(S, FS) then
    Exit(False);
  Result := TryStrToQWord(S, Res);
end;

function TryStrToQWordEx(S: String; AThousandSeparator: Char; out Res: QWord): Boolean;
var
  FS: TFormatSettings;
begin
  FS := DefaultFormatSettings;
  FS.ThousandSeparator := AThousandSeparator;
  Result := TryStrToQWordEx(S, FS, Res);
end;

function StrToIntEx(S: String; FS: TFormatSettings): Integer;
begin
  if not CheckAndRemoveValidThousandSeparators(S, FS) then
    raise EConvertError.CreateFmt(SInValidInteger,[S]);
  Result := StrToInt(S);
end;

function StrToIntEx(S: String; AThousandSeparator: Char): Integer;
var
  FS: TFormatSettings;
begin
  FS := DefaultFormatSettings;
  FS.ThousandSeparator := AThousandSeparator;
  if AThousandSeparator <> #0 then
    FS.DecimalSeparator := #0; //force DS <> TS
  Result := StrToIntEx(S, FS);
end;

function StrToIntDefEx(S: String; const Def: Integer; FS: TFormatSettings): Integer;
begin
  if not TryStrToIntEx(S, FS, Result) then
    Result := Def;
end;

function StrToIntDefEx(S: String; const Def: Integer; AThousandSeparator: Char): Integer;
begin
  if not TryStrToIntEx(S, AThousandSeparator, Result) then
    Result := Def;
end;

function StrToInt64Ex(S: String; FS: TFormatSettings): Int64;
begin
  if not CheckAndRemoveValidThousandSeparators(S, FS) then
    raise EConvertError.CreateFmt(SInValidInteger,[S]);
  Result := StrToInt64(S);
end;

function StrToInt64Ex(S: String; AThousandSeparator: Char): Int64;
var
  FS: TFormatSettings;
begin
  FS := DefaultFormatSettings;
  FS.ThousandSeparator := AThousandSeparator;
  if AThousandSeparator <> #0 then
    FS.DecimalSeparator := #0; //force DS <> TS
  Result := StrToIntEx(S, FS);
end;

function StrToInt64DefEx(S: String; const Def: Int64; FS: TFormatSettings): Int64;
begin
  if not TryStrToInt64Ex(S, FS, Result) then
    Result := Def;
end;

function StrToInt64DefEx(S: String; const Def: Int64; AThousandSeparator: Char): Int64;
begin
  if not TryStrToInt64Ex(S, AThousandSeparator, Result) then
    Result := Def;
end;


function StrToDWordEx(S: String; FS: TFormatSettings): DWord;
begin
  if not CheckAndRemoveValidThousandSeparators(S, FS) then
    raise EConvertError.CreateFmt(SInValidInteger,[S]);
  Result := StrToDWord(S);
end;

function StrToDWordEx(S: String; AThousandSeparator: Char): DWord;
var
  FS: TFormatSettings;
begin
  FS := DefaultFormatSettings;
  FS.ThousandSeparator := AThousandSeparator;
  if AThousandSeparator <> #0 then
    FS.DecimalSeparator := #0; //force DS <> TS
  Result := StrToDWordEx(S, FS);
end;

function StrToDWordDefEx(S: String; const Def: DWord; FS: TFormatSettings): DWord;
begin
  if not TryStrToDWordEx(S, FS, Result) then
    Result := Def;
end;

function StrToIntDWordEx(S: String; const Def: DWord; AThousandSeparator: Char): DWord;
begin
  if not TryStrToDWordEx(S, AThousandSeparator, Result) then
    Result := Def;
end;

function StrToQWordEx(S: String; FS: TFormatSettings): QWord;
begin
  if not CheckAndRemoveValidThousandSeparators(S, FS) then
    raise EConvertError.CreateFmt(SInValidInteger,[S]);
  Result := StrToQWord(S);
end;

function StrToQWordEx(S: String; AThousandSeparator: Char): Integer;
var
  FS: TFormatSettings;
begin
  FS := DefaultFormatSettings;
  FS.ThousandSeparator := AThousandSeparator;
  if AThousandSeparator <> #0 then
    FS.DecimalSeparator := #0; //force DS <> TS
  Result := StrToQWordEx(S, FS);
end;

function StrToQWordDefEx(S: String; const Def: QWord; FS: TFormatSettings): QWord;
begin
  if not TryStrToQWordEx(S, FS, Result) then
    Result := Def;
end;

function StrToIntQWordEx(S: String; const Def: QWord; AThousandSeparator: Char): QWord;
begin
  if not TryStrToQWordEx(S, AThousandSeparator, Result) then
    Result := Def;
end;


function InsertThousandSeparator(const ValueS, AThousandSep: String): String;
// A bit more complicated, but 3 times faster than repeated Insert() calls
var
  ResLen, ResPos, SLen, i, j: Integer;
begin
  if (AThousandSep = '') then
    Exit(ValueS);
  Result := '';
  SLen := Length(ValueS);
  //Needed separators = ((SLen - 1) div 3)
  ResLen := SLen + ((SLen - 1) div 3) * Length(AThousandSep);
  SetLength(Result, ResLen);
  ResPos := ResLen;
  for i := Length(ValueS) downto 1 do
  begin
    if (SLen <> i) and ((SLen-i) mod 3 = 0) then
    begin
      for j := Length(AThousandSep) downto 1 do
      begin
        Result[ResPos] := AThousandSep[j];
        Dec(ResPos);
      end;
    end;
    Result[ResPos] := ValueS[i];
    Dec(ResPos);
  end;
end;

function IntToStrEx(Value: LongInt; FS: TFormatSettings): String;
begin
  Result := IntToStr(Value);
  Result := InsertThousandSeparator(Result, FS.ThousandSeparator);
end;

function IntToStrEx(Value: Int64; FS: TFormatSettings): String;
begin
  Result := IntToStr(Value);
  Result := InsertThousandSeparator(Result, FS.ThousandSeparator);
end;

function IntToStrEx(Value: QWord; FS: TFormatSettings): String;
begin
  Result := IntToStr(Value);
  Result := InsertThousandSeparator(Result, FS.ThousandSeparator);
end;


const
  //https://en.wikipedia.org/wiki/Conversion_of_units#Pressure_or_mechanical_stress
  ToPascalFactors: array[TPressureUnit] of Double = (
  1.0,       // puPascal
  100000.0,  // puBar
  98066.5,   // puAtmosphere
  101325.0,  // puTechnicalAtmosphere
  133.3224,  // puTorr
  3386.39,   // puInchHg
  40363.66,  // puFootHg
  9.80638,   // puMmH2O
  98.0638,   // puCmH2O
  24.082,    // puInchH2O
  6894.757,  // puPoundForcePerSquareInch
  47.88028,  // puPoundForcePerSquareFoot
  1.488164,  // puPoundalPerSquareFoot
  95760.518, // puShortTonPerSquareFoot
  9806650.0  // puKgForcePerSquareMm
);


function Convert(AValue: Double; aFrom, aTo: TPressureUnit): Double;
begin
  if (aFrom = aTo) then
    Exit(AValue);
  Result := (AValue * ToPascalFactors[aFrom]) / ToPascalFactors[aTo];
end;

const
  //https://en.wikipedia.org/wiki/Conversion_of_units#Force
  ToNewtonFactors: array[TForceUnit] of Double = (
    1.0,                 // fuNewton
    8.23872206E-8,       // fuAtomic
    1E-5,                // fuDyne
    9.80664,             // fuKgForce
    4448.2216152605,     // fuKip
    0.00980664,          // fuMilliGrave
    9964.01641818352,    // fuLongTonForce
    8896.443230521,      // fuShortTonForce
    0.27801385095378125, // fuOunceForce
    4.4482216152605,     // fuPoundForce
    0.138254954376,      // fuPoundal
    103.0                // fuStheme
  );

function Convert(AValue: Double; aFrom, aTo: TForceUnit): Double;
begin
  if (aFrom = aTo) then
    Exit(AValue);
  Result := (ToNewtonFactors[aFrom] * AValue) / ToNewtonFactors[aTo];
end;

const
  //https://en.wikipedia.org/wiki/Conversion_of_units#Speed_or_velocity
  ToMeterPerSecondFactors: array[TSPeedUnit] of Double= (
    1.0,
    5.08E-3,            // suFootPerMinute
    0.3048,             // suFootPerSecond
    1.663095E-4,        // suFurlongPerFortnight
    7.05E-6,            // suInchPerHour
    4.23E-4,            // suInchPerMinute
    2.54E-2,            // suInchPerSecond
    0.2777777777777778, // suKmPerHour (1000/(60*60))
    0.514,              // suKnot
    0.514773,           // suKnotAdmiralty
    0.44704,            // suMilePerHour
    26.8224,            // suMilePerMinute
    1609.344,           // suMilePerSecond
    299792458.0         // suSpeedOfLight, exactly, as per definition (the meter is defined as the distance light travels in a vacuum in 1/c second)
  );

function Convert(AValue: Double; aFrom, aTo: TSpeedUnit): Double;
begin
  if (aFrom = aTo) then
    Exit(AValue);
  Result := (AValue * ToMeterPerSecondFactors[aFrom])/ToMeterPerSecondFactors[aTo];
end;

//https://en.wikipedia.org/wiki/Conversion_of_units#Energy
const
  ToJouleFactors: array[TEnergyUnit] of Double = (
    1.0, // euJoule
    4.1868, // euCalIT
    4.19002, // euCalMean
    4.184, // euCalThermoMechanical
    4184, // euCalFDA
    1899.100534716, // euCelsiusHeatUnit
    1.602176634E-19, // euElectronVolt
    1.0E-7, // euErg
    1.3558179483314004, //euFootPoundForce
    4.21401100938048E-2, //euFootPoundal
    4.359744E-18, //euHartree
    2.684519537696172792E6 , //euHorsePowerHour
    0.1129848290276167, //euInchPoundForce
    4.1868E3, // euKiloCalorie
    3600.0, //euWattHour
    3.6E6, //euKiloWattHour
    2.179872E-18, //euRydberg
    4.1868E6, // euThermie
    4.184E9 //euTonTNT
  );

function Convert(AValue: Double; aFrom, aTo: TEnergyUnit): Double;
begin
  if (aTo = aFrom) then
    Exit(AValue);
  Result := (AValue * ToJouleFactors[aFrom]) / ToJouleFactors[aTo]
end;

function Convert(AValue: Double; aFrom, aTo: TTemperatureUnit): Double;
//https://en.wikipedia.org/wiki/Conversion_of_units#Temperature
var
  K: Double;
begin
  if (aFrom = aTo) then
    Exit(AValue);
  case aFrom of
    tuKelvin:        K := AValue;                                    // SI base unit
    tuCelsius:       K := AValue + 273.15;                           // [K] ≡ [°C] + 273.15; [°C] ≡ [K] − 273.15
    tuDelisle:       K := 373.15 - (AValue * (2/3));                 // [K] = 373.15 − [°De] × 2⁄3
    tuFahrenheit:    K := (AValue + 459.67) * (5/9);                 // [K] ≡ ([°F] + 459.67) × 5⁄9; [°F] ≡ [°C] × 9⁄5 + 32
    tuNewton:        K := (AValue * Double(100/33)) + 273.15;        // [K] = [°N] × 100⁄33 + 273.15
    tuRankine:       K := AValue * Double(5/9);                      // [K] ≡ [°R] × 5/9; [°R] ≡ [K] × 9⁄5
    tuReamur:        K := (AValue * Double(5/4)) + 273.15;           // [K] = [°Ré] × 5⁄4 + 273.15
    tuRomer:         K := ((AValue - 7.5) * Double(40/21)) + 273.15; // [K] = ([°Rø] − 7.5) × 40⁄21 + 273.15
    tuReguloGasMark: K := (AValue * Double(125/9)) + 394.26;         // [K] ≡ [GM] × 125⁄9 + 394.26
  end;
  case aTo of
    tuKelvin:        Result := K;                            // SI base unit
    tuCelsius:       Result := K - 273.15;                   // [K] ≡ [°C] + 273.15; [°C] ≡ [K] − 273.15
    tuDelisle:       Result := -1.5 * (K - 373.15);          // [K] = 373.15 − [°De] × 2⁄3 ==> [De] = -3/2([K] - 373.15)
    tuFahrenheit:    Result := (1.8 * K) - 459.67;           // [K] ≡ ([°F] + 459.67) × 5⁄9  ==> [F] = (9/5*K) - 459.67
    tuNewton:        Result := 0.33 * (K - 273.15);          // [K] = [°N] × 100⁄33 + 273.15 ==> [N] = 33/100 * ([K]-273.15)
    tuRankine:       Result := K * 1.8;                      // [K] ≡ [°R] × 5/9; [°R] ≡ [K] × 9⁄5
    tuReamur:        Result := 0.8 * (K - 273.15);           // [K] = [°Ré] × 5⁄4 + 273.15 ==>  [Re] = 4/5 * ([K] - 273.15)
    tuRomer:         Result := (0.525 * (K - 273.15)) + 7.5; // [K] = ([°Rø] − 7.5) × 40⁄21 + 273.15 ==> [Ro] = 21/40*([K] - 273.15) + 7.5
    tuReguloGasMark: Result := 0.072 * (K - 394.26);         // [K] ≡ [GM] × 125⁄9 + 394.26 ==> [GM] = 9/125 * ([K] - 394.26)
  end;
end;

function FahrenheitToCelsius(const AValue: Double): Double;
begin
  Result := (double(5.0)/9.0)  * (Avalue - 32.0);
end;

function CelsiusToFahrenheit(const AValue: Double): Double;
begin
  Result := 32.0 + ((9.0 * AValue)/ 5.0);
end;

function CelsiusToKelvin(const AValue: Double): Double;
begin
  Result := AValue+273.15;
end;

function KelvinToCelsius(const AValue: Double): Double;
begin
  Result := AValue-273.15;
end;

const
  ToNewtonMeterFactors: array[TMomentUnit] of Double = (
    1.0, // muNewtonMeter
    1.3558179483314004,  // moPoundForceFoot
    4.21401100938048E-2, // muPoundalFoot
    0.1129848290276167,  // muPoundForceInch
    9.80665              // muKgForceMeter
  );


function Convert(AValue: Double; aFrom, aTo: TMomentUnit): Double;
begin
  if (aFrom = aTo) then
    Exit(AValue);
  Result := (AValue * ToNewtonMeterFactors[aFrom]) / ToNewtonMeterFactors[aTo];
end;


end.
