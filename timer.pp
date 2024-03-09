{$mode objfpc}{$H+}{$J-}
program timer;

uses sysutils;
var
    Start, Stop : TDateTime;
    params : array of string;
    i : integer;
begin
    if ParamCount = 0 then begin
        WriteLn('timer: A shoddy knock-off of the Unix time command');
        halt;
    end;

    SetLength(params, ParamCount - 1);

    for i := 2 to ParamCount do begin
        params := concat(params, [ParamStr(i)]);
    end;

    Start := Now;
    ExecuteProcess(ParamStr(1), params);
    Stop := Now;
    WriteLn;
    WriteLn('TIME: ', FormatDateTime('hh.nn.ss.zzz', Stop - Start));
end.
