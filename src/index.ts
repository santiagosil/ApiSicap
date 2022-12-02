import express, { Application, Request, Response } from 'express';
import http from 'http';
import morgan from 'morgan';
import socketio from 'socket.io';

class Servidor{

    io:socketio.Server;
    api:Application;
    server:http.Server;

    constructor(){
        this.api = express();
        this.server = http.createServer(this.api);
        this.io = new socketio.Server(this.server,{cors:{origin:'*'}});
        this.config();
        this.routes();
    }

    config():void{
        this.api.set('port', process.env.PORT || 3000);
        this.api.use(morgan('dev'));
        this.io.on('connection',(socket)=>{
            const id = socket.id;
            const rol:string = String(socket.handshake.query['rol']);
            console.log('Detected Connection:',id);
            console.log('Rol Connection:',rol);
        });
    }
    routes():void{
        this.api.get('',(req:Request,res:Response)=>{
            res.json({"hola":"mundo"});
        });
    }
    start():void{
        this.server.listen(this.api.get('port'), ()=>{
            console.log('Listen on port:',this.api.get('port'));
        });
    }
}
const servidor = new Servidor();
servidor.start();