unit baserenderqueue;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, fgl,
  renderQueue, renderCommand;

const
   EXEC_QUEUE_OK = 0;
   EXEC_QUEUE_EMPTY = 1;

type

   TRenderCommandList = specialize TFPGInterfacedObjectList<IRenderCommand>;

   {--------------------------------------
   base render queue that process command
   ---------------------------------------}

   { TBasicRenderQueue }

   TBaseRenderQueue = class(TInterfacedObject, IRenderQueue)
   protected
       renderCommandQueue : TRenderCommandList;
   public
       constructor Create();
       destructor Destroy(); override;

       {----------------------------
        Add render command to queue
       -----------------------------
       input:
       command : render command to add
       -----------------------------
       output:
       interger value of the order of
       inserted render command in queue
       -----------------------------}
       function addCommand(command : IRenderCommand) : integer;

       {----------------------------
        remove render command from queue
        and return it
       -----------------------------
       output:
        instance of removed render command
        or nil if queue is empty
       -----------------------------}
       function removeCommand(const indx: integer) : IRenderCommand;

       {----------------------------
       Loop to all entries in queue
       and render them
       -----------------------------}
       function executeQueue(const elapsedTimeInSecs : single) : cardinal; virtual; abstract;
   end;

implementation

{ TBasicRenderQueue }

constructor TBaseRenderQueue.Create();
begin
  inherited Create();
  renderCommandQueue := TRenderCommandList.Create();
end;

destructor TBaseRenderQueue.Destroy();
begin
  renderCommandQueue.Free();
  inherited Destroy();
end;

function TBaseRenderQueue.addCommand(command: IRenderCommand): integer;
begin
  result := renderCommandQueue.Add(command);
end;

function TBaseRenderQueue.removeCommand(const indx : integer): IRenderCommand;
begin
  result:= renderCommandQueue.Items[indx] as IRenderCommand;
  renderCommandQueue.Delete(indx);
end;

end.

