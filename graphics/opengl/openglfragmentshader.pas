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
  case (valid()) of
     false: result := SHADER_CREATION_FAILED;
     true: result:= SHADER_OK;
  end;
end;

end.

