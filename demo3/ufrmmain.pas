unit ufrmmain;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, OpenGLContext, Forms, Controls, Graphics,
  Dialogs, ExtCtrls, renderer, renderqueue, rendercommand;

type

  { TForm1 }

  TForm1 = class(TForm)
    OpenGLControl1: TOpenGLControl;
    Timer1: TTimer;
    procedure OpenGLControl1Paint(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
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
  OpenGLRendererFactory,
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

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  OpenGLControl1.invalidate();
end;

procedure TForm1.buildRenderQueue(const queueObj: IRenderQueue);
begin
  queueObj.addCommand(renderClearCommand);
  queueObj.addCommand(renderTriangleCommand);
end;

constructor TForm1.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  rendererObj := TOpenGLRendererFactory.Create();
  renderQueueObj := TFIFORenderQueue.Create();

  renderClearCommand := TClearCommand.Create(rendererObj);
  renderTriangleCommand := TRenderTriangleCommand.Create(rendererObj);

  lastTick := getTickCount64();
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

