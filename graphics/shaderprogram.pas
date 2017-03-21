unit shaderprogram;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, baseshader, shader;

type
   IShaderProgram = interface(IBaseShader)
       ['{5F63D3A7-84AA-4E70-9D8F-79C50D82CDD1}']
       function createProgram() : cardinal;
       function destroyProgram() : cardinal;
       function attachShader(const shaderObj: IShader): cardinal;
       function detachShader(const shaderObj: IShader): cardinal;
       function linkProgram() : cardinal;
       function useProgram() : cardinal;
   end;

implementation

end.

