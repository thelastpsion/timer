{$mode objfpc}{$H+}{$J-}
program timer;

uses sysutils;
var
    Start, Stop : TDateTime;
    params : array of string;
    i : integer;
begin
    for i := 2 to ParamCount do begin
        params := concat(params, [ParamStr(i)]);
    end;

    Start := Now;
    ExecuteProcess(ParamStr(1), params);
    Stop := Now;
    WriteLn;
    WriteLn('TIME: ', FormatDateTime('hh.nn.ss.zzz', Stop - Start));
end.
