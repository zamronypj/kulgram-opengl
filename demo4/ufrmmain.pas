unit ufrmMain;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, OpenGLContext, Forms, Controls, Graphics,
  Dialogs, ExtCtrls,

  renderer,
  renderQueue,
  renderCommand,
  renderTime;

type

  { TForm1 }

  TForm1 = class(TForm)
    OpenGLControl1: TOpenGLControl;
    Timer1: TTimer;
    procedure OpenGLControl1Paint(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { private declarations }
    rendererObj : IRenderer;
    renderQueueObj : IRenderQueue;
    renderCommands : array[0..1] of IRenderCommand;
    renderTiming : IRenderTime;

    procedure buildRenderQueue(const queue: IRenderQueue);
  public
    constructor Create(AOwner : TComponent); override;
    destructor Destroy(); override;
    { public declarations }
  end;

var
  Form1: TForm1;

implementation
uses
   OpenGLRendererFactory,
   fifoRenderQueue,
   basicRenderTime,
   clearCommand,
   cubeRenderCommand;

{$R *.lfm}

{ TForm1 }

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  OpenGLControl1.Invalidate();
end;

procedure TForm1.buildRenderQueue(const queue: IRenderQueue);
begin
  queue.addCommand(renderCommands[0]);
  queue.addCommand(renderCommands[1]);
end;

constructor TForm1.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  rendererObj := TOpenGLRendererFactory.create();
  renderQueueObj := TFIFORenderQueue.Create();
  renderTiming := TBasicRenderTime.Create();
  renderCommands[0] := TClearCommand.Create(rendererObj);
  renderCommands[1] := TRenderCube.Create(rendererObj);
  renderTiming.init();
end;

destructor TForm1.Destroy();
begin
  renderCommands[0] := nil;
  renderCommands[1] := nil;
  renderQueueObj :=nil;
  rendererObj := nil;
  renderTiming := nil;
  inherited Destroy();
end;

procedure TForm1.OpenGLControl1Paint(Sender: TObject);
begin
  renderTiming.startTiming();
  buildRenderQueue(renderQueueObj);
  renderQueueObj.executeQueue(renderTiming.elapsedTimeInSec());
  OpenGLControl1.swapBuffers();
  renderTiming.endTiming();
end;

end.

