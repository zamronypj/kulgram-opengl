unit baseShaderCompilationHelper;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, shader, shaderCompilationHelper;

type
    TBaseShaderCompilationHelper = class(TInterfacedObject, IShaderCompilationHelper)
    public
      function getCompilationStatus(const shaderObj : IShader) : boolean; virtual; abstract;
      function getCompilationErrorMessage(const shaderObj : IShader) : string; virtual; abstract;
    end;

implementation

end.

