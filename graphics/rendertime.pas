unit renderTime;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;

type

   IRenderTime = interface
      ['{AD4E06A4-8392-4E78-8DB6-99361C73FB08}']
      function init(): longint;
      function startTiming() : longint;
      function endTiming() : longint;
      function elapsedTimeInSec() : single;
   end;

implementation

end.

