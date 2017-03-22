{-----------------------------------
 OpenGL Geometry Shader implementation
-------------------------------------
This class provides geometry shader creation and
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
unit OpenGLGeometryShader;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, OpenGLShader;
type

   { TOpenGLGeometryShader }

   TOpenGLGeometryShader = class(TOpenGLShader)
   public
     function createShader() : cardinal; override;
   end;

implementation
uses constants, gl, glExt;

{ TOpenGLGeometryShader }

function TOpenGLGeometryShader.createShader(): cardinal;
begin
  shaderId := glCreateShader(GL_GEOMETRY_SHADER);
  case (valid()) of
     false: result := SHADER_CREATION_FAILED;
     true: result:= SHADER_OK;
  end;
end;

end.

