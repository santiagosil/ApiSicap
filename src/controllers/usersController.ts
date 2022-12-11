import {NextFunction, Request, Response} from 'express';
import db from '../database/connection';
import {BaseController} from './BaseController';

class UsersController extends BaseController{
    getAllUsers(req: Request, res: Response){
        return res.json({"prueba":"ok"});   
    }
}
const usersController = new UsersController();
export default usersController;