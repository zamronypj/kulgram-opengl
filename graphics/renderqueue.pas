unit renderqueue;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, renderer, renderCommand;

type

    {--------------------------------
    Interface for class for submitting
    render command to render queue
    ---------------------------------}
    IRenderQueueSubmitter = interface
        ['{78B480A5-9208-47DC-B5D8-BBE610EF5498}']

        {----------------------------
         Add render command to queue
        -----------------------------
        input:
        command : render command to add
        -----------------------------
        output:
        interger value of the order of
        inserted render command in queue
        -----------------------------}
        function addCommand(command : IRenderCommand) : integer;
    end;

    IRenderQueue = interface(IRenderQueueSubmitter)
        ['{F43C1713-43D3-40FE-9975-96B00EBDBF9E}']

        {----------------------------
         remove render command from queue
         and return it
        -----------------------------
        output:
         instance of removed render command
         or nil if queue is empty
        -----------------------------}
        function removeCommand(const indx : integer) : IRenderCommand;

        {----------------------------
        Loop to all entries in queue
        and render them
        -----------------------------
        input:
        elapsedTimeInSecs : time passed since
        last call in seconds
        -----------------------------
        output:
        0 if success
        -----------------------------}
        function executeQueue(const elapsedTimeInSecs : single) : cardinal;
    end;

implementation

end.

