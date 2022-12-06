import { Router } from "express";
import usersController from "../controllers/usersController";

class UsersRoutes{
    route:Router=Router();
    constructor(){
        this.config();
    }
    config():void{
        this.route.get('/',usersController.getAllUsers);
    }
}
const usersRoutes = new UsersRoutes();
export default usersRoutes.route;