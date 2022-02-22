#!/usr/bin/env python
import ctypes

import asyncio
import websockets

from handler import handle_message

clients = set()
mcDll = ctypes.WinDLL("./MultimidiaController.dll")

def print_clients():
    print("Clients:")
    print(clients)


async def handler(websocket, path):
    clients.add(websocket)
    print_clients()
    await websocket.send("Connected!");
    while True:
        try:
            message = await websocket.recv()
            
            handle_message(websocket, message, mcDll)
        except Exception as e:
            print(e)
            clients.remove(websocket)
            break
  
if __name__ == "__main__":
    
    start_server = websockets.serve(handler, "192.168.18.183", 8001)
    asyncio.get_event_loop().run_until_complete(start_server)
    asyncio.get_event_loop().run_forever()
