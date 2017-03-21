unit openglvertexshader;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, openGLShader;

type

  { TOpenGLVertexShader }

  TOpenGLVertexShader = class(TOpenGLShader)
  public
     function createShader() : cardinal; override;
  end;

implementation
uses constants, openglConstants, gl, glExt;

{ TOpenGLVertexShader }

function TOpenGLVertexShader.createShader(): cardinal;
begin
  shaderId := glCreateShader(GL_VERTEX_SHADER);
  case (shaderId = NULL_ID) of
     true: result := SHADER_CREATION_FAILED;
     false: result:= SHADER_OK;
  end;
end;


end.

