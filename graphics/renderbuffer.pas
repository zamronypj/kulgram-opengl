{-----------------------------------
 interface for render buffer
 (vertex buffer, index buffer, color buffer etc)
-------------------------------------
(c) 2017 Zamrony P. Juhara <zamronypj@yahoo.com>
http://github.com/zamronypj/kulgram-opengl
-------------------------------------
Tested on Ubuntu 14.04 64 bit
Intel core i7
-------------------------------------
TODO: Need to be tested on other
platform
-------------------------------------}
unit renderBuffer;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;

type

    IRenderBuffer = interface
       ['{4EF1A608-8160-4BDB-B7AC-C13C25685713}']
       function beginWrite() : cardinal;
       function write(const sourceMemory: pointer; const numberOfData: cardinal; const dataType:cardinal; const stride: cardinal) : cardinal;
       function endWrite() : cardinal;
    end;

implementation

end.

