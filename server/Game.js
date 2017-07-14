var Message = require ('./Message.js');
var Router = module.parent.exports.Router;
var netVar = module.parent.exports.netVar;
require('./const.js');

function itemSpawnTimer() {
    for (var matchId in netVar.matchList) {
        var match = netVar.matchList[matchId];
        var chance = Math.floor(Math.random()*25)+1;
        var isBox = Math.floor(Math.random()*2);
        var x = 0, type = 0;
        if (chance == 1) {
            x = Math.random();
            type = Math.floor(Math.random()*2)+1;

            for (var i=0; i < match.players.length; i++) {
                var sock = netVar.playerSocks[match.players[i]];
                sock.write(Message.write(GAME_SPAWN_ITEM, {
                    x: x,
                    type: type,
                    box: isBox
                }));
            }
        }
    }
    setTimeout(function() {
        itemSpawnTimer();
    }, 1000);
}
itemSpawnTimer();

function queueRemovePlayer(uid) {
    for (var i = 0; i < netVar.queue.length; i++) {
        if (netVar.queue[i].uid == uid) {
            netVar.queue.splice(i, 1);
            return true;
        }
    }

    return false;
};

Router.on(GAME_PLAYER_QUEUE, function(sock, msg) {
    if (netVar.queue.length > 0) {
        var opp = netVar.queue.shift();
        console.log("MATCH FOUND: " + msg.params.uid + " vs " + opp.uid);
        var oppSock = netVar.playerSocks[opp.uid];
        var p1left = !!Math.floor(Math.random()*2);
        var matchId = netVar.lastMatchId++;

        sock.write(Message.write(GAME_START, {
            uid: opp.uid,
            charId: opp.charId,
            direct: p1left
        }));

        oppSock.write(Message.write(GAME_START, {
            uid: msg.params.uid,
            charId: msg.params.charId,
            direct: !p1left
        }));

        netVar.matches[msg.params.uid] = opp.uid;
        netVar.matches[opp.uid] = msg.params.uid;
        netVar.matchList[matchId] = {players: [msg.params.uid, opp.uid]};
        sock.matchId = matchId;
        oppSock.matchId = matchId;
    } else {
        console.log("PLAYER QUEUED: " + msg.params.uid);
        netVar.queue.push({
            uid: msg.params.uid,
            charId: msg.params.charId
        });
    }
});

Router.on(GAME_PLAYER_CANCEL_QUEUE, function(sock, msg) {
    queueRemovePlayer(msg.params.uid);
});

Router.on(GAME_PLAYER_FIRE, function(sock, msg) {
    if (!netVar.matches[msg.params.uid]) {
        return;
    }
    if (msg.params.ulting) {
        console.log("PLAYER " + msg.params.uid + " IS ULTINGGGGG");
    } else {
        console.log("Player " + msg.params.uid + " Fired zee missile");
    }
    var oppUid = netVar.matches[msg.params.uid];
    var oppSock = netVar.playerSocks[oppUid];

    oppSock.write(Message.write(GAME_PLAYER_FIRE, {
        uid: msg.params.uid,
        x: msg.params.x,
        y: msg.params.y,
        pspd: msg.params.pspd,
        pvspd: msg.params.pvspd,
        direct: msg.params.direct,
        pdmg: msg.params.pdmg,
        ulting: msg.params.ulting
    }));
});

Router.on(GAME_UPDATE_PLAYER_POS, function(sock, msg) {
    if (!netVar.matches[msg.params.uid]) {
        console.log("PLAYER HAS NO MATCH but is moving");
        return;
    }
    var oppUid = netVar.matches[msg.params.uid];
    var oppSock = netVar.playerSocks[oppUid];

    oppSock.write(Message.write(GAME_UPDATE_PLAYER_POS, {
        uid: msg.params.uid,
        x: msg.params.x,
        y: msg.params.y,
        hspd: msg.params.hspd,
        vspd: msg.params.vspd,
        state: msg.params.state,
        modifiers: msg.params.modifiers,
        health: msg.params.health,
        power: msg.params.power
    }));

    if (msg.params.health <= 0) {
        sock.write(Message.write(GAME_OVER, {
            won: false 
        }));

        oppSock.write(Message.write(GAME_OVER, {
            won: true
        }));

        delete netVar.matches[msg.params.uid];
        delete netVar.matches[oppUid];
        delete netVar.matchList[sock.matchId];
        sock.matchId = undefined;
        oppSock.matchId = undefined;
        queueRemovePlayer(msg.params.uid);
    }
});

Router.on(GAME_UPDATE_PLAYERLIKE_PET, function(sock, msg) {
    if (!netVar.matches[msg.params.uid]) {
        console.log("PLAYER HAS NO MATCH but is pet moving");
        return;
    }

    var oppUid = netVar.matches[msg.params.uid];
    var oppSock = netVar.playerSocks[oppUid];

    oppSock.write(Message.write(GAME_UPDATE_PLAYERLIKE_PET, {
        uid: msg.params.uid,
        x: msg.params.x,
        state: msg.params.state,
        attacking: msg.params.attacking,
        alive: msg.params.alive,
        direct: msg.params.direct,
        spawn: msg.params.spawn
    }));
});

Router.on(GAME_PLAYER_SURRENDER, function(sock, msg) {
    if (!netVar.matches[msg.params.uid]) {
        console.log("PLAYER HAS NO MATCH but is trying to surrender");
        return;
    }

    var oppUid = netVar.matches[msg.params.uid];
    var oppSock = netVar.playerSocks[oppUid];

    oppSock.write(Message.write(GAME_OVER, {
        won: true
    }));

    delete netVar.matches[msg.params.uid];
    delete netVar.matches[oppUid];
    delete netVar.matchList[sock.matchId];
    sock.matchId = undefined;
    oppSock.matchId = undefined;
});

exports.queueRemovePlayer = queueRemovePlayer;
