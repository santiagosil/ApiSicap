import { Router } from "express";
import usersController from "../controllers/usersController";

export class UsersRoutes{
    route:Router=Router();
    constructor(){
        this.config();
    }
    config():void{
        this.route.get('/',usersController.verifyToken,usersController.getAllUsers);
    }
}
const usersRoutes = new UsersRoutes();
export default usersRoutes.route;