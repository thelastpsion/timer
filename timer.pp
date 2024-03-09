{$mode objfpc}{$H+}{$J-}
program timer;

uses sysutils;
var
    Start, Stop : TDateTime;
    params : Array of String;
    i : integer;
    filename : String;
    {$if defined(MSDOS) or defined(GO32V2)}
    extensions : Array of String;
    ext : String;
    found : Boolean;
    {$ifend}

begin
    if ParamCount = 0 then begin
        WriteLn('timer: A shoddy knock-off of the Unix time command');
        halt;
    end;

    SetLength(params, ParamCount - 1);

    for i := 2 to ParamCount do begin
        params := concat(params, [ParamStr(i)]);
    end;

    filename := ParamStr(1);

    {$if defined(MSDOS) or defined(GO32V2) or defined(WINDOWS)}
    found := false;
    extensions := ['', '.COM', '.EXE', '.BAT'];

    for ext in extensions do
    begin
        if FileExists(filename + ext) then begin
            filename += ext;
            found := true;
            break;
        end;
    end;

    if not found then begin
    {$else}
    if not FileExists(filename) then begin;
    {$ifend}
        WriteLn('timer: ', filename, ' Not found.');
        halt;
    end;

    Start := Now;
    ExecuteProcess(filename, params);
    Stop := Now;
    WriteLn;
    WriteLn('TIME: ', FormatDateTime('hh.nn.ss.zzz', Stop - Start));
end.
