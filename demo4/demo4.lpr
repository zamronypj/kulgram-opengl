program demo4;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, lazopenglcontext, ufrmMain, OpenGLRendererFactory, renderTime,
  basicRenderTime, cubeRenderCommand, renderBuffer, baseRenderBuffer,
  OpenGLVertexBuffer, openglcolorbuffer, OpenGLIndexBuffer, vertexbuffer,
  indexbuffer, shader, shaderprogram, baseshader, BasicShader,
  openglvertexshader, constants, basicprogram, openglshaderprogram,
  openglshader, openglfragmentshader, rendererProfile, baseRendererProfile,
  OpenGL20RendererProfile, shaderCompilationHelper, baseShaderCompilationHelper,
  OpenGLShaderCompilationHelper, OpenGLGeometryShader;

{$R *.res}

begin
  RequireDerivedFormResource:=True;
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.

