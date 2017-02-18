unit fifoRenderQueue;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, renderCommand, baserenderqueue;

type

  {--------------------------------------
  render queue that process command
  first in first out
  ---------------------------------------}

  { TFIFORenderQueue }

  TFIFORenderQueue = class(TBaseRenderQueue)
  private
      function getFirstCommandOrNilIfEmpty() : IRenderCommand;
  public
      {----------------------------
      Loop to all entries in queue
      and render them
      -----------------------------}
      function executeQueue(const elapsedTimeInSecs : single) : cardinal; override;
  end;

implementation

function TFIFORenderQueue.getFirstCommandOrNilIfEmpty(): IRenderCommand;
begin
  if (renderCommandQueue.count > 0) then
  begin
    result := renderCommandQueue.first;
  end else
  begin
    result := nil;
  end;
end;

function TFIFORenderQueue.executeQueue(const elapsedTimeInSecs : single): cardinal;
var command : IRenderCommand;
begin
  command := getFirstCommandOrNilIfEmpty();
  while (command <> nil) do
  begin
    command.render(elapsedTimeInSecs);
    renderCommandQueue.Delete(0);
    command := getFirstCommandOrNilIfEmpty();
  end;
  result := EXEC_QUEUE_OK;
end;

end.

