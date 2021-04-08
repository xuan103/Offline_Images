#!/bin/bash

which dotnet &>/dev/null
if [ "$?" == "0" ] ; then
   echo "Oops, Already Installed dotnet." && exit 1
else
   echo "DotNet installing..."
   DOTNET_FILE=dotnet-sdk-3.1.407-linux-x64.tar.gz
   export DOTNET_ROOT=/usr/bin
   mkdir -p "$DOTNET_ROOT" && tar zxf "$DOTNET_FILE" -C "$DOTNET_ROOT" &>/dev/null
   export PATH=$PATH:$DOTNET_ROOT
   dotnet new console --output sample1 &>/dev/null
   dotnet run --project sample1 &>/dev/null
fi

which dotnet &>/dev/null
if [ "$?" == "0" ]; then 
   echo "Yeah, dotnet-offline: Installation finished successfully."
else
   echo "Oops, Installation dotnet ERROR."
fi
