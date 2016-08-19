

var createHttp = require('http').createServer;
var WebSocketServer = require('ws').Server;

var httpServer = createHttp((req, res)=>{
    res.end('');
});

var wsServer = new WebSocketServer({
    server: httpServer
});

wsServer.on('connection', (webSocket)=>{

    var pingTimer;

    console.log('WebSocket connected');

    webSocket.on('close', ()=>{
        clearInterval(pingTimer);
        console.log('WebSocket closed');
    });

    webSocket.on('pong', ()=>{
        console.log('Got pong');
    });

    pingTimer = setInterval(()=>{
        webSocket.ping('@', {}, true);
        console.log('Sent ping');
    }, 6000);
});

httpServer.listen(8080, ()=>{
    console.log('WebSocket server listening at port 8080');
});