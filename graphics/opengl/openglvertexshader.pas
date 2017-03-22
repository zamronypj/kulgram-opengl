{-----------------------------------
 OpenGL Vertex Shader implementation
-------------------------------------
This class provides vertex shader creation and
compilation
-------------------------------------
(c) 2017 Zamrony P. Juhara <zamronypj@yahoo.com>
http://github.com/zamronypj/kulgram-opengl
-------------------------------------
Tested on:
-Ubuntu 14.04 64 bit Intel core i7, 8 GB RAM
-Ubuntu 16.04 64 bit AMD A9-9400, 4 GB RAM
-------------------------------------
TODO: Need to be tested on other
platform
-------------------------------------}
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
uses constants, gl, glExt;

{ TOpenGLVertexShader }

function TOpenGLVertexShader.createShader(): cardinal;
begin
  shaderId := glCreateShader(GL_VERTEX_SHADER);
  case (valid()) of
     false: result := SHADER_CREATION_FAILED;
     true: result:= SHADER_OK;
  end;
end;


end.

