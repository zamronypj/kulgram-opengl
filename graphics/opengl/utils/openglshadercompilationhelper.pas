{-----------------------------------
 OpenGL Shader Compilation status helper
 implementation
-------------------------------------
This class provides shader compilation
status and error message reporting
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
unit OpenGLShaderCompilationHelper;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, shader, baseShaderCompilationHelper;

type

    { TOpenGLShaderCompilationHelper }

    TOpenGLShaderCompilationHelper = class(TBaseShaderCompilationHelper)
    private
      function getShaderCompilationStatus(const shaderObj : IShader) : boolean;
      function getShaderCompilationErrorMessage(const shaderObj : IShader) : string;
    public
      function getCompilationStatus(const shaderObj : IShader) : boolean; override;
      function getCompilationErrorMessage(const shaderObj : IShader) : string; override;
    end;

implementation
uses gl, glExt;

{ TOpenGLShaderCompilationHelper }

function TOpenGLShaderCompilationHelper.getShaderCompilationStatus(const shaderObj: IShader): boolean;
var compilationResult : GLint;
begin
  compilationResult := GL_FALSE;
  glGetShaderiv(shaderObj.id(), GL_COMPILE_STATUS, @compilationResult );
  result := (compilationResult = GL_FALSE);
end;

function TOpenGLShaderCompilationHelper.getShaderCompilationErrorMessage(const shaderObj: IShader): string;
var i:integer;
    InfoLogLength: GLint;
    ErrorMessageArray: array of GLChar;
begin
  result := '';
  glGetShaderiv(shaderObj.id(), GL_INFO_LOG_LENGTH, @InfoLogLength);
  SetLength(ErrorMessageArray, InfoLogLength + 1);
  glGetShaderInfoLog(shaderObj.id(), InfoLogLength, nil, @ErrorMessageArray[0]);
  for i := 0 to InfoLogLength do
  begin
    result := result + string(ErrorMessageArray[i]);
  end;
end;

function TOpenGLShaderCompilationHelper.getCompilationStatus(const shaderObj : IShader): boolean;
begin
  result := (shaderObj<>nil) and getShaderCompilationStatus(shaderObj);
end;

function TOpenGLShaderCompilationHelper.getCompilationErrorMessage(const shaderObj : IShader): string;
begin
  if (getCompilationStatus(shaderObj)) then
  begin
    result:= getShaderCompilationErrorMessage(shaderObj);
  end else
  begin
    result := '';
  end;
end;

end.

