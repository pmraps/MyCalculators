unit ErrorCatching;

{$mode ObjFPC}{$H+}

interface

uses
    Classes, SysUtils, Dialogs;

type
    //create unique index for each error message
    TErrMsgID = (emWrongJulianDate, emWrongGregorianDate, emWrongFrenchDate,
                 emCalendarUnavailable, emDivZero, emConvert, emCantOpen);

    function ErrMsg(id: TErrMsgID; params: array of const): integer; overload;
    function ErrMsg(id: TErrMsgID): integer; overload;

const
     ErrMsgFmt : array[Low(TErrMsgID)..High(TErrMsgID)] of string = (
               'Wrong julian date! Must be between January 1 45 BC and October 15, 1582',
               'Wrong gregorian date! Must be after October 15, 1582',
               'Wrong french republican date! Must be between 22/09/1792 and 31/12/1805',
               'The calendar is not available! Please request it from the developer.',
               'Division by zero',
               'Conversion error: %s',
               'Cannot open file: %s'
               );

     //array of corresponding dialog buttons
     ErrMsgBtns : array[Low(TErrMsgID)..High(TErrMsgID)] of TMsgDlgButtons = (
                [mbOK],
                [mbOK],
                [mbOK],
                [mbOK],
                [mbOK],
                [mbOK],
                [mbRetry,mbCancel]
                );


implementation

function ErrMsg(id: TErrMsgID; params: array of const): integer; overload;
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

