unit ErrorCatching;

{$mode ObjFPC}{$H+}

interface

uses
    Classes, SysUtils, Dialogs, myResourceStrings;

type
    //create unique index for each error message
    TErrMsgID = (emWrongJulianDate, emWrongGregorianDate, emWrongFrenchDate,
                 emCalendarUnavailable, emDivisionByZero, emNegativePower, emNotANumber, emConvert);

    function ErrMsg(id: TErrMsgID; params: Array of Const): integer; overload;
    function ErrMsg(id: TErrMsgID): integer; overload;

const
     ErrMsgFmt : array[Low(TErrMsgID)..High(TErrMsgID)] of string = (
               rsStrWrongJulian,
               rsStrWrongGregorian,
               rsStrWrongFrench,
               rsStrCalendarUnavailable,
               rsStrDivisionByZero,
               rsStrNegativeExponential,
               rsStrNotANumber,
               rsStrConverionError
               );

     //array of corresponding dialog buttons
     ErrMsgBtns : array[Low(TErrMsgID)..High(TErrMsgID)] of TMsgDlgButtons = (
                [mbOK], [mbOK], [mbOK], [mbOK], [mbOK], [mbOK],
                [mbOK], [mbOK]
                );


implementation

function ErrMsg(id: TErrMsgID; params: Array of Const): integer; overload;
//possible parameters (filename, etc) are contained in the open array parameter "params"
begin
     result := MessageDlg(
     Format(ErrMsgFmt[id], params), //formatted message
     mtError, //dialog type
     ErrMsgBtns[id], //buttons
     0
     );
end;

function ErrMsg(id: TErrMsgID): integer; overload;
begin
     result := ErrMsg(id, []);
end;

end.

