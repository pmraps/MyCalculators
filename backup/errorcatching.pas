unit ErrorCatching;

{$mode ObjFPC}{$H+}

interface

uses
    Classes, SysUtils, Dialogs;

type
    //create unique index for each error message
    TErrMsgID = (emWrongDate, emFileNotFound, emDivZero, emConvert, emCantOpen);

const
     ErrMsgFmt : array[Low(TErrMsgID)..High(TErrMsgID)] of string = (
               'The date does''t exist!',
               'File not found: %s',
               'Division by zero',
               'Conversion error: %s',
               'Cannot open file: %s'
               );

     //array of corresponding dialog buttons
     ErrMsgBtns : array[Low(TErrMsgID)..High(TErrMsgID)] of TMsgDlgButtons = (
                mbOKCancel,
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

