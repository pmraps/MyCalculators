unit Dateutils2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,DateUtils;

type TWeekDay = DayMonday..DaySunday;

function AddDate(d,m,y:word;n:integer):TDate;
function Age(BirthDate: TDate): integer;
function CalendarWeekToDate(cw,year:word): TDate;
function EasterSunday(year : integer) : TDate;
function eastersunday_jul(year:integer):TDate;
function FirstDayOfMonth(month,year:word):TDate;
function FirstDayOfYear(year:integer):TDate;
function gd(d,m,y:real):longint;
function Gregor(d,m,yyyy:word):longint;
function GregorToDate(n:longint):Tdate;
function Is53weeks1(y: word): boolean;
function Is53weeks2(y: word): boolean;
function IsDateOk(d,m,y:word):boolean;
function Isleapyear(year:integer):boolean;
function JDOfAllDays(d,m,y:real):longint;
function JDOfGregorianDates(d,m,j:longint):longint;
function JDOfJulianDate(d,m,y:real):longint;
function JdToDate(jd:longint):TDate;
function JdToJuldatStr(jd:longint):String;
function JdToStr(jd:longint):String;
function LastDayOfMonth(month,year:integer):TDate;
function LastDayOfWeekOfMonth(year,month: Integer;DayOfWeek: TWeekDay):TDate;
function LastDayOfYear(year:integer):TDate;

implementation

//Wolfgang  Mix - Delphi-PRAXiS
//Add or subtract number of days and give back new date
function AddDate(d,m,y:word;n:integer):TDate;
begin
   Result:=EncodeDate(y,m,d)+n;
end;

//Wolfgang  Mix - Delphi-PRAXiS
//Returns age of a thing or person avoiding problems
//with leap years
function Age(BirthDate: TDate): integer;
var y1,y2,m1,m2,d1,d2: Word;
begin
  SysUtils.DecodeDate(date,y1,m1,d1);
  SysUtils.DecodeDate(BirthDate,y2,m2,d2);
  Result := ((y1 * 10000 + m1 * 100 + d1)
           - (y2 * 10000 + m2 * 100 + d2)) div 10000;
end;

//Returns the first day of calendar week as date
//Wolfgang  Mix - Delphi-PRAXiS
// ----- Needs function FirstDayOfYear -----
//Returns the first day of calendar week as date
function CalendarWeekToDate(cw,year:word): TDate;
var temp1:TDate;
    temp2:word;
begin
  if (cw<=0) or (cw>WeeksInYear(year)) then
     raise Exception.CreateFmt('Cw(%d) - invalid arg', [cw]);
  temp1:=FirstDayOfYear(year);
  temp2:=WeekOfTheYear(temp1);
  if temp2 = 1 then result:=7*(cw-1)+temp1
  else result:=7*cw+temp1;
end;

function eastersunday(year : integer) : TDate;
//Wolfgang  Mix - Delphi-PRAXiS
{ Easter is on march nth. Example: Easter=33 means 2nd of April
  http://matheplanet.com/default3.html?article=417
  By formula of in the year 1800. For Dates from 1583 to 8202
  1st failure Fehler in the year 8202
  Modified by Wolfgang Mix}
var a,b,c,d,e,f,g,h,i,j,m,temp : integer;
begin
  a := year mod 19;
  b := year mod 4;
  c := year mod 7;
  d := ( ( (year div 100) * 8 ) + 13 ) div 25 - 2;
  e := (year div 100) - (year div 400) - 2;
  f := (15 + e - d) mod 30;
  g := (6 + e) mod 7;
  h := (19 * a + f) mod 30;
  i := h;
  if (h = 29) then i := 28;
  if ( (h = 28) and (a > 10) ) then i := 27;
  j := ( (2 * b) + (4 * c) + (6 * i) + g ) mod 7;
  temp :=   + i + j + 22;    {der nte Maerz}
  if temp>31 then
  begin
    d:=temp-31;m:=4;
  end
  else
  begin
    d:=temp;m:=3;
  end;
  result:=EncodeDate(year,m,d);
end;

//Wolfgang  Mix - Delphi-PRAXiS
{Ester is on march nth. Example: Easter=33 means 2nd of April
http://matheplanet.com/default3.html?article=417
By formula of in the year 1800. For Dates from 1583 to 8202
1st failure Fehler in 8202
Modified by Wolfgang Mix}
function eastersunday_jul(year:integer):TDate;
var a,b,c,d,e,f,m,n,day,month:Integer;
begin
   m:= 15;n:=6;
   a := year mod 19;
   b := year mod 4;
   c := year mod 7;
   d := (19*a+m) mod 30;
   e := (2*b + 4*c + 6*d + n) mod 7;
   f := 22+d+e;
   //Easter met on (22+d+e)t Murch
   //Correction of Lichtenberg 1997
   if f = 57 then f:=50;
   if f = 56 then f:=49;
   //Extract Date
   if f>31 then
   begin
      day:=f-31;month:=4;
   end
   else
   begin
      day:=f;month:=3;
   end;
   result:=EncodeDate(year,month,day);
end;

//Wolfgang  Mix - Delphi-PRAXiS
//Returns Monday before 1st of month or 1st itsself as date
function FirstDayOfMonth(month,year:word):TDate;
var mydate:TDate;temp:extended;
begin
  Mydate:= EncodeDate(year,month,1);
  temp:=DayOfTheWeek(mydate);
  mydate:=mydate-temp+1;
  result:=mydate;
end;

//Wolfgang  Mix - Delphi-PRAXiS
//Returns Monday before NewYear or NewYear itsself as date
function FirstDayOfYear(year:integer):TDate;
var mydate: TDate;temp:extended;
begin
  Mydate:= EncodeDate(year,1,1);
  temp:=DayOfTheWeek(mydate);
  mydate:= mydate-temp+1;
  result:=mydate;
end;

//Modified by Wolfgang Mix - Delphi-PRAXiS
//1582-10-15 is gd = 1}
//Source: http://mathforum.org/library/drmath/view/62338.html
//For all platforms
function gd(d,m,y:real):longint;
var a,b,temp:real;
begin
  if (m=1) or (m=2) then
  begin
    y:=y-1;m:=m+13;
  end
  else m:=m+1;
  a:=int(y/100);
  b:=2 - a + int(a/4);
  temp:=int(int(365.25 * y) +int(30.6001*m) + b + d + 1720995);
  result:=trunc(temp)-2299160;
end;

//Wolfgang  Mix - Delphi-PRAXiS
//Returns a Gregorian day number since 1582-10-15 =1; 2000-1-1 = 152385
//Only for Delphi
function Gregor(d,m,yyyy:word):longint;
var Tmp:TDateTime;
begin
    Tmp:=EncodeDate(yyyy,m,d);
    result:=1+Round(tmp-StrToDate('15.10.1582'));
    if result<1 then raise Exception.CreateFmt('Gregor(%d) - invalid date',
    [result])
end;

//Wolfgang Mix - Delphi-PRAXiS
//Returns a date from gregorian day number
function GregorToDate(n:longint):Tdate;
begin
  if (n >= 1) and (n <= 3074324) then
    Result := n - 115859
  else
    raise Exception.CreateFmt('GregorToDate(%d) - invalid n', [n])
end;

//Wolfgang Mix - Delphi-PRAXiS
function Is53weeks1(y: word): boolean;
begin
  Result := (DayOfTheWeek(EncodeDate(y, 1 , 1)) = 4) or (DayOfTheWeek(EncodeDate(y, 12, 31)) = 4);
end;

//Wolfgang Mix - Delphi-PRAXiS
function Is53weeks2(y: word): boolean;
begin
  Result := (WeeksInYear(EncodeDate(y,1,1)) = 53);
end;

//Wolfgang Mix - Delphi-PRAXiS
//Range 1.1.0001 .. 31.12.9999
function IsDateOk(d,m,y:word):boolean;
var mydate:TDateTime;
begin
    result:=false;
    mydate:=EncodeDate(y,m,d);
    If TryEncodeDate(y,m,d,myDate) Then result:=true
end;

//Wolfgang Mix - Delphi-PRAXiS
//Before 1582-10-15 returning Julian values,
//else Gregorian values, year no.0 excluded
//-1 = true ; 0 = false
function Isleapyear(year:integer):boolean;
begin
  result:=false;
  case year of
      -4713..-1 :result:=(year+1) mod 4=0;
      1 .. 1582 :result:= year mod 4=0;
      1583..9999:result:=(year mod 4 =0) and ((year mod 100 <> 0)
                         or (year mod 400=0));
  //else raise Exception.Create('year out of range');
  else raise Exception.CreateFmt('IsLeapYear(%d) - invalid arg', [year]);
  end;
end;

//Modified by Wolfgang Mix - Delphi-PRAXiS
//Output JD,  1.1.-4712 jd=0
//Source: http://mathforum.org/library/drmath/view/62338.html
function JDOfAllDays(d,m,y:real):longint;
var a,b,temp:real;
begin
  //if y<1 then y:=y+1;
  if (m=1) or (m=2) then
  begin
    y:=y-1;m:=m+13;
  end
  else m:=m+1;
  a:=int(y/100);
  b:=2 - a + int(a/4);
  temp:=int(int(365.25 * y) +int(30.6001*m) + b + d + 1720995);
  if trunc(temp) < 2299161 then
     temp:=int(int(365.25 * y) +int(30.6001*m) + d + 1720995);
  if y<0 then
  temp:=int(int(365.25 * y - 0.75) +int(30.6001*m) + d + 1720995);
  result:=trunc(temp);
end;

// Translated to Delphi: Wolfgang Mix - Delphi-PRAXiS
// Only for gregorian Dates from 1582-10-15 and above
// From H.F. Fliegel and T.C. van Flandern
// Source: Helmut Herold: Übungen zur Programmiersprache C, Teil II S. 260
function JDOfGregorianDates(d,m,j:longint):longint;
var k,l:longint;
begin
  result:=0;
  if (j<1582) or  (j>9999) then showmessage('Invalid Date') else
  if (j=1582) and (m < 10) then showmessage('Invalid Date') else
  if (j=1582) and (m = 10) and (d<15) then showmessage('Invalid Date') else
  begin
    K:=(m-14) div 12;
    L:= J+K+4800;
    result:= d-32075+1461*L div 4 + 367*(M-2-12*k) div 12
             - 3*((L+100) div 100) div 4;
  end;
end;

//Source: http://mathforum.org/library/drmath/view/62338.html
//Translated by Wolfgang Mix - Delphi-PRAXiS
//Input d,m,y of Julian Date
//Output JD,  1.1.-4712 jd=0
//Continous Counting 1582-10-04 = 2299160, 1582-10-05 = 2299161
function JDOfJulianDate(d,m,y:real):longint;
var a,b,temp:real;
begin
  //if y<1 then y:=y+1;
  if (m=1) or (m=2) then
  begin
    y:=y-1;m:=m+13;
  end
  else m:=m+1;
  a:=int(y/100);
  b:=2 - a + int(a/4);
  //temp:=int(int(365.25 * y) +int(30.6001*m) + b + d + 1720995);
  //if trunc(temp) < 2299161 then
  temp:=int(int(365.25 * y) +int(30.6001*m) + d + 1720995);
  if y<0 then
  temp:=int(int(365.25 * y - 0.75) +int(30.6001*m) + d + 1720995);
  result:=trunc(temp);
end;

//Source: http://mathforum.org/library/drmath/view/62338.html
//Translated by Wolfgang  Mix - Delphi-PRAXiS
//Input d,m,y of Julian Date
//Input:       JD   (Julian day)
//Returns Julian Date up to 1582-10-14 , since 1582-10-15
//Julian date of grgorian values
function JdToDate(jd:longint):TDate;
var  A,B,C,D,E,F,G,J,M,T,Z:real;
begin
  if (jd<1721424) or (jd>5373484) then raise Exception.CreateFmt('JdToDate(%d) - invalid argument', [jd]);
  Z:=Int (JD + 0.5);
  F:=Frac(JD + 0.5);
  If Z < 2299161 Then A:=Z   // < 15.10.1582
  else
  begin
   g:= int((Z-1867216.25) / 36525.25);
   a:=z+1+g-int(g/4);
  end;
  B := A+1524;
  C := Int((B-122.1)/365.25);
  D := int(365.25 * C);
  E := Int((B-D)/30.6001);
  T := B-D-int(30.6001*E) + F;
  if(E<14) then
    M := E-1
  else
    M := E-13;
  if (M>2) then
      J := C-4716
  else
      J := C-4715;
  if j<1 then j:=j-1;
  result:=EncodeDate(trunc(j),trunc(m),trunc(t));
end;  //T.M.J = Kalenderdatum von JD

//Source: http://de.wikipedia.org/wiki/
//Translated by Wolfgang  Mix - Delphi-PRAXiS
//Input: Julian Day Number
//Range -4713-01-01 .. 9999-12-31
//Return all values julian (strait counting)
function JdToJuldatStr(jd:longint):String;
var  A,B,C,D,E,F,G,J,M,T,Z:real;
     day,month,year:integer;
     days,months,years:string;
     s:string;
begin
  s:=''; // just to initialize
  if (jd<0) or (jd>5373484) then raise Exception.CreateFmt('JdToDate(%d) - invalid argument', [jd]);
  Z:=Int (JD + 0.5);
  F:=Frac(JD + 0.5);
  A:=Z;
  B := A+1524;
  C := Int((B-122.1)/365.25);
  D := int(365.25 * C);
  E := Int((B-D)/30.6001);
  T := B-D-int(30.6001*E) + F;
  if(E<14) then
    M := E-1
  else
    M := E-13;
  if (M>2) then
      J := C-4716
  else
      J := C-4715;
  if j<1 then j:=j-1;
  //Develop String
  day:=trunc(t);month:=trunc(m);year:=trunc(j);
  Result := Format('%.2d.%.2d.%d',[day,month,year]);
end;  //T.M.J = Calendar Date of JD


// Source: http://de.wikipedia.org/wiki/
// Tranlated by Wolfgang Mix - Delphi-PRAXiS
// Calculate Julian Date from Julian Day
// Range -4713-01-01 .. 9999-12-31
// Input: JD (Julian Day)
// Returns julian values up to 1582-10-04 then grgorian values
// from 1582-10-15 and later
function JdToStr(jd:longint):String;
var  A,B,C,D,E,F,G,J,M,T,Z:real;
     day,month,year:integer;
     days,months,years:string;
     s:string;
begin
  s:=''; // just to inatialize
  if (jd<0) or (jd>5373484) then raise Exception.CreateFmt('JdToDate(%d) - invalid argument', [jd]);
  Z:=Int (JD + 0.5);
  F:=Frac(JD + 0.5);
  If Z < 2299161 Then A:=Z   // < 15.10.1582
  else
  begin
   g:= int((Z-1867216.25) / 36525.25);
   a:=z+1+g-int(g/4);
  end;
  B := A+1524;
  C := Int((B-122.1)/365.25);
  D := int(365.25 * C);
  E := Int((B-D)/30.6001);
  T := B-D-int(30.6001*E) + F;
  if(E<14) then
    M := E-1
  else
    M := E-13;
  if (M>2) then
      J := C-4716
  else
      J := C-4715;
  if j<1 then j:=j-1;

  //Develope String
  day:=trunc(t);month:=trunc(m);year:=trunc(j);
  Result := Format('%.2d.%.2d.%d',[day,month,year]);
end;  //T.M.J = Calendar Date of JD

// Source: http://www.mycsharp.de/wbb2/thread.php?threadid=74208
// Translated by DeddyH - Delphi-PRAXiS
// Useful. if you search for f.e. last thursday in August of 2009
function LastDayOfWeekOfMonth(year,month: Integer;DayOfWeek: TWeekDay):TDate;
var temp: TDate;
begin
  temp := IncMonth(EncodeDateTime(year,month,1,0,0,0,0));
  Result := IncDay(temp,(DayOfWeek - DayOfTheWeek(temp) + 7) mod 7 - 7);
end;

//Wolfgang  Mix - Delphi-PRAXiS
//Returns Sunday after last daynumber of month
//or last daynumber itsself as date
function LastDayOfMonth(month,year:integer):TDate;
var mydate: TDate;temp:extended;
begin
  Mydate:= EncodeDate(year,month,DaysInAMonth(year,month));
  temp:=DayOfTheWeek(mydate);
  mydate:= mydate+7-temp;
  result:=mydate;
end;

//Wolfgang  Mix - Delphi-PRAXiS
//Returns Sunday after Silvester or Silvester itsself as date
function LastDayOfYear(year:integer):TDate;
var mydate: TDate;temp:extended;
begin
  Mydate:= EncodeDate(year,12,31);
  temp:=DayOfTheWeek(mydate);
  mydate:= mydate+7-temp;
  result:=mydate;
end;

end.

