unit basicRenderTime;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, renderTime;

type

   { TBasicRenderTime }

   TBasicRenderTime = class(TInterfacedObject, IRenderTime)
   private
      currentTick : longint;
      lastTick : longint;
      elapsedTimeInSeconds : single;
   public
      function init(): longint;
      function startTiming() : longint;
      function endTiming() : longint;
      function elapsedTimeInSec() : single;
   end;

implementation

{ TBasicRenderTime }

function TBasicRenderTime.init() : longint;
begin
  currentTick := getTickCount64();
  lastTick := currentTick;
  elapsedTimeInSeconds := 0.0;
  result := currentTick;
end;

function TBasicRenderTime.startTiming() : longint;
begin
  currentTick := getTickCount64();
  elapsedTimeInSeconds := (currentTick - lastTick)/1000;
  result := currentTick;
end;

function TBasicRenderTime.endTiming() : longint;
begin
  lastTick := currentTick;
  result := lastTick;
end;

function TBasicRenderTime.elapsedTimeInSec(): single;
begin
  result := elapsedTimeInSeconds;
end;

end.

