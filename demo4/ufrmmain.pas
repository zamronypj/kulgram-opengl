unit ufrmMain;

{$mode objfpc}{$H+}
interface

uses
  Classes, SysUtils, FileUtil, OpenGLContext, Forms, Controls, Graphics,
  Dialogs, ExtCtrls, StdCtrls,

  renderer,
  renderQueue,
  renderCommand,
  renderTime,
  shader, shaderProgram,
  shaderCompilationHelper;

type

  { TForm1 }

  TForm1 = class(TForm)
    Memo1: TMemo;
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
    vertexShader, fragmentShader : IShader;
    shaderProgram : IShaderProgram;
    shaderHelperObj : IShaderCompilationHelper;
    shaderIsInitialized : boolean;

    procedure buildRenderQueue(const queue: IRenderQueue);
    function loadShaderCodeFromFile(const shaderFile:string) : string;
    function buildSingleShader(const shader: IShader; const shaderFile:string) : IShader;
    procedure buildShaders(const vtxShader, fragShader : IShader; const shaderProg : IShaderProgram; const shaderHelper : IShaderCompilationHelper);
  public
    constructor Create(AOwner : TComponent); override;
    destructor Destroy(); override;
    { public declarations }
  end;

var
  Form1: TForm1;

implementation
uses
   gl,
   glExt,
   OpenGLRendererFactory,
   fifoRenderQueue,
   basicRenderTime,
   clearCommand,
   cubeRenderCommand,
   VectorSSEOperation,
   openGLVertexShader,
   openGLFragmentShader,
   openGLShaderProgram,
   rendererProfile,
   OpenGL20RendererProfile,
   OpenGLShaderCompilationHelper;

{$R *.lfm}

{ TForm1 }

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  OpenGLControl1.Invalidate();
end;

procedure TForm1.buildRenderQueue(const queue: IRenderQueue);
begin
  queue.addCommand(renderCommands[0]);
  buildShaders(vertexShader, fragmentShader, shaderProgram, shaderHelperObj);
  shaderProgram.useProgram();
  queue.addCommand(renderCommands[1]);
end;

function TForm1.loadShaderCodeFromFile(const shaderFile: string): string;
var shader: TStringList;
begin
  shader:=TStringList.Create();
  try
    shader.loadFromFile(shaderFile);
    result := shader.Text;
  finally
    shader.free();
  end;
end;

function TForm1.buildSingleShader(const shader: IShader; const shaderFile: string) : IShader;
var shaderSrc : string;
begin
  shaderSrc := loadShaderCodeFromFile(shaderFile);
  shader.createShader();
  shader.setSource(shaderSrc);
  shader.compile();
  result := shader;
end;

function getBooleanString(const boolValue:boolean) :string;
begin
  if (boolValue) then
     result := 'true'
  else
     result := 'false';
end;

procedure TForm1.buildShaders(const vtxShader, fragShader : IShader; const shaderProg : IShaderProgram; const shaderHelper : IShaderCompilationHelper);
begin
  if (not shaderIsInitialized) then
  begin
    shaderProg.createProgram();
    buildSingleShader(vtxShader, '../shader/vertexShader.glsl');
    Memo1.Lines.add('Vertex Shader compilation: '+ getBooleanString(shaderHelper.getCompilationStatus(vtxShader)));
    Memo1.Lines.add('Vertex Shader compilation error message: '+ shaderHelper.getCompilationErrorMessage(vtxShader));
    buildSingleShader(fragShader, '../shader/fragmentShader.glsl');
    Memo1.Lines.add('Fragment Shader compilation: '+ getBooleanString(shaderHelper.getCompilationStatus(fragShader)));
    Memo1.Lines.add('Fragment Shader compilation error message: '+ shaderHelper.getCompilationErrorMessage(fragShader));
    shaderProg.attachShader(vtxShader);
    shaderProg.attachShader(fragShader);
    shaderProg.linkProgram();
    shaderIsInitialized := true;
  end;
end;

constructor TForm1.Create(AOwner: TComponent);
var rendererProfileObj: IRendererProfile;
begin
  inherited Create(AOwner);
  //To use shader, we need OpenGL 2.0 at least
  rendererProfileObj:= TOpenGL20RendererProfile.Create();
  rendererProfileObj.initialize();

  rendererObj := TOpenGLRendererFactory.create();
  renderQueueObj := TFIFORenderQueue.Create();
  renderTiming := TBasicRenderTime.Create();
  renderCommands[0] := TClearCommand.Create(rendererObj);
  renderCommands[1] := TRenderCube.Create(rendererObj, TSSEVectorOperation.Create());

  vertexShader := TOpenGLVertexShader.Create();
  fragmentShader := TOpenGLFragmentShader.Create();
  shaderProgram := TOpenGLShaderProgram.Create();
  shaderHelperObj := TOpenGLShaderCompilationHelper.Create();
  shaderIsInitialized := false;

  renderTiming.init();

  rendererProfileObj := nil;
end;

destructor TForm1.Destroy();
begin
  renderCommands[0] := nil;
  renderCommands[1] := nil;
  renderQueueObj :=nil;
  rendererObj := nil;
  renderTiming := nil;
  vertexShader := nil;
  fragmentShader := nil;
  shaderProgram := nil;
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

