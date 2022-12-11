import jwtoken from 'jsonwebtoken';
import { jwt } from '../database/dbSettings';
import {NextFunction, Request, Response} from 'express';

export class BaseController{
    verifyToken(req: Request, res: Response,next:NextFunction){
        const bearerHeader:string=String(req.headers['authorization']);
        if(typeof bearerHeader !== 'undefined'){
            const token=bearerHeader.split(" ")[1];
            const decoded=jwtoken.verify(token,jwt.key,(err,auth)=>{
                if(err){
                    return res.status(403).json({
                        auth:false,
                        message:"Token is invalid"
                    });
                }
                if(auth){
                    next();
                }
            });            
        }
        return res.status(403).json({
            auth:false,
            message:"No token provided"
        });
    }
}