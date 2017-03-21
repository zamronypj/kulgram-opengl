unit shader;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, baseshader;
type

   IShader = interface(IBaseShader)
       ['{7BE5B3BF-F9CA-4B43-B5EB-3B3E9D60EB9C}']
       function createShader() : cardinal;
       function destroyShader() : cardinal;
       function setSource(const source:string) : cardinal;
       function compile() : cardinal;
   end;

implementation

end.

