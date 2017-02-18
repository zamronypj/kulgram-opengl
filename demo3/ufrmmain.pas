unit ufrmmain;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, OpenGLContext, Forms, Controls, Graphics,
  Dialogs, renderer, renderqueue, rendercommand;

type

  { TForm1 }

  TForm1 = class(TForm)
    OpenGLControl1: TOpenGLControl;
    procedure OpenGLControl1Paint(Sender: TObject);
  private
    rendererObj : IRenderer;
    renderQueueObj : IRenderQueue;

    renderTriangleCommand  : IRenderCommand;
    renderClearCommand  : IRenderCommand;

    lastTick : longint;
    { private declarations }
    procedure buildRenderQueue(const queueObj : IRenderQueue);
  public
    constructor Create(AOwner : TComponent); override;
    destructor Destroy(); override;
    { public declarations }
  end;

var
  Form1: TForm1;

implementation

uses
  OpenGLRenderer,
  OpenGLRendererPrimitive,
  fifoRenderQueue,
  clearCommand,
  renderTriangleCommand;

{$R *.lfm}

{ TForm1 }

procedure TForm1.OpenGLControl1Paint(Sender: TObject);
var elapsedTimeInSecs : single;
begin
  buildRenderQueue(renderQueueObj);

  elapsedTimeInSecs := (getTickCount64() - lastTick)/1000;
  renderQueueObj.executeQueue(elapsedTimeInSecs);
  lastTick := getTickCount64();

  OpenGLControl1.swapBuffers();
end;

procedure TForm1.buildRenderQueue(const queueObj: IRenderQueue);
begin
  queueObj.addCommand(renderClearCommand);
  queueObj.addCommand(renderTriangleCommand);
end;

constructor TForm1.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  rendererObj := TOpenGLRenderer.Create(TOpenGLRendererPrimitive.Create());
  renderQueueObj := TFIFORenderQueue.Create();

  renderClearCommand := TClearCommand.Create(rendererObj);
  renderTriangleCommand := TRenderTriangleCommand.Create(rendererObj);
end;

destructor TForm1.Destroy;
begin
  renderClearCommand := nil;
  renderTriangleCommand := nil;
  renderQueueObj := nil;
  rendererObj := nil;
  inherited Destroy;
end;

end.

