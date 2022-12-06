import {Request, Response} from 'express';
import db from '../database/connection';

class UsersController{
    getAllUsers(req: Request, res: Response){
        db.queryTest();
        res.json({"prueba":"api"});
    }
}
const usersController = new UsersController();
export default usersController;