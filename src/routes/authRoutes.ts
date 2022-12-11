import { Router } from "express";
import authController from "../controllers/authController";

class AuthRoutes{
    router: Router=Router();
    constructor(){
        this.config();
    }
    config():void{
        this.router.post('/',authController.login);
        this.router.post('/test',authController.test);
    }
}
const authRoutes= new AuthRoutes();
export default authRoutes.router;