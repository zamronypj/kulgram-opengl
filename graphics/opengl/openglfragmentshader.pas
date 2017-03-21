unit openglfragmentshader;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, openglShader;
type

  { TOpenGLFragmentShader }

  TOpenGLFragmentShader = class(TOpenGLShader)
  public
     function createShader() : cardinal; override;
  end;

implementation
uses constants, openglConstants, gl, glExt;

{ TOpenGLFragmentShader }

function TOpenGLFragmentShader.createShader(): cardinal;
begin
  shaderId := glCreateShader(GL_FRAGMENT_SHADER);
  case (shaderId = NULL_ID) of
     true: result := SHADER_CREATION_FAILED;
     false: result:= SHADER_OK;
  end;
end;

end.

