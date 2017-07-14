var net = require('net');
var events = require('events');
var Message = require('./Message.js');
var Game = null;
var Router = new events.EventEmitter();
var netVar = { clients: 0, socketlist: [], lastId: 1, players: {}, playerSocks: {}, matches: {}, queue: [], lastMatchId: 1, matchList: {} };
require('./const.js');

var HOST = 'pounce.house';
var PORT = 4050;

exports.Router = Router;
exports.netVar = netVar;

net.createServer(function(sock) {
    Game = require('./Game.js');
    console.dir(Game);
    console.log('CONNECTED: ' + sock.remoteAddress +':'+ sock.remotePort);
    netVar.clients++;

    //Fake being a GM Studio server
    var buffer = new Buffer("GM:Studio-Connect\0");
    sock.write(buffer);
    var waitingHandshake = true;

    sock.on('data', function(data) {
        var waitingHandshake = false;

        if (data.length >= 12) {
            var x = data.readUInt32LE(0);
            var y = data.readUInt32LE(4);
            var size = data.readUInt32LE(8);

            if (x == 3405691582 && y == 3735924747) { waitingHandshake = true; }
        }

        if (waitingHandshake === true) {
            buffer = new Buffer([0xad, 0xbe, 0xaf, 0xde, 0xeb, 0xbe, 0x0d, 0xf0, 0x0c, 0x00, 0x00, 0x00]);
            sock.write(buffer);

            //create uid
            var newUid = netVar.lastId++;
            sock.uid = newUid;
            netVar.playerSocks[newUid] = sock;
            sock.write(Message.write(GAME_PLAYER_SET_UID, {uid: newUid}));
        } else {
            var eof = false;
            while (!eof) {
                var x = data.readUInt32LE(0);
                var y = data.readUInt32LE(4);
                var size = data.readUInt32LE(8) + 12;
                var msgData = Buffer(data).slice(0, size);
                data = Buffer(data).slice(size);

                if (Buffer.byteLength(data) === 0) {
                    eof = true;
                }

                msg = Message.read(msgData);
                if (msg.type !== GAME_UPDATE_PLAYER_POS) {
                    console.log("New Msg: " + msg.type);
                }
                Router.emit(msg.type, sock, msg);
            }
        }
    });
    
    // Add a 'close' event handler to this instance of socket
    sock.on('close', function(data) {
        console.log('CLOSED: ' + sock.remoteAddress +' '+ sock.remotePort);
        Game.queueRemovePlayer(sock.uid); 

        if (netVar.matches[sock.uid]) {
            var oppUid = netVar.matches[sock.uid];
            var oppSock = netVar.playerSocks[oppUid];
            oppSock.write(Message.write(GAME_OVER, {won: true}));

            delete netVar.matches[sock.uid];
            delete netVar.matches[oppUid];
            delete netVar.matchList[sock.matchId];
            sock.matchId = undefined;
            oppSock.matchId = undefined;
        }

        delete netVar.playerSocks[sock.uid];
        netVar.clients--;
    });

    sock.on('end', function(data) {
        console.log('END: ' + data);
    });

    sock.on('timeout', function(data) {
        console.log('TIMEOUT: ' + data);
    });

    sock.on('drain', function(data) {
        console.log('DRAIN: ' + data);
    });

    sock.on('error', function(data) {
        console.log('ERROR: ' + data);
    });
}).listen(PORT, HOST);

console.log('Server listening on ' + HOST +':'+ PORT);
