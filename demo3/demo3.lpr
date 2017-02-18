program demo3;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, lazopenglcontext, ufrmmain, baserenderqueue, fifoRenderQueue,
  baseRenderCommand, renderTriangleCommand, clearcommand, standardRenderCommand,
  renderertypes, rendererPrimitive, OpenGLRendererPrimitive, matrixUtility
  { you can add units after this };

{$R *.res}

begin
  RequireDerivedFormResource:=True;
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.

