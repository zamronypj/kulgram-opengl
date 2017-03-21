unit shaderCompilationHelper;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, shader;

type
   IShaderCompilationHelper = interface
      ['{00820695-0BD4-4A00-A736-CFBF86D4AC63}']
      function getCompilationStatus(const shaderObj : IShader) : boolean;
      function getCompilationErrorMessage(const shaderObj : IShader) : string;
   end;

implementation

end.

