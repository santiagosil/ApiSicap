import { Request, Response } from "express";
import { IResult } from "mssql";
import db from '../database/connection';
import { User, Login } from "../models";
import jwtoken from 'jsonwebtoken';
import { jwt } from "../database/dbSettings";
import bcrypt from 'bcryptjs';

class AuthController {
    async login(req: Request, res: Response) {
        const login: Login = req.body;
        let result: IResult<any> = await (await db).request().query('SELECT 1');
        if (login.role === 'user') {
            result = await (await db).request()
                .input('identification', login.identification)
                .query('SELECT * FROM users WHERE identification=@identification');
        }
        if (login.role === 'organization') {
            result = await (await db).request()
                .input('identification', login.identification)
                .query('SELECT * FROM organization WHERE nit=@identification');

        }
        let user: User = result.recordset[0];
        if(!user){
            return res.json({
                login: false,
                role: login.role,
                token: ''
            });
        }
        if (!(await bcrypt.compare(login.password, user.password))) {
            return res.json({
                login: false,
                role: login.role,
                token: ''
            });
        }

        user.password = '';
        const token: string = jwtoken.sign(user, jwt.key, {
            expiresIn: '10h'
        });
        return res.json({
            login: true,
            role: login.role,
            token
        });

    }
    async register(req: Request, res: Response) {
        const user: User = req.body;
        const salt = await bcrypt.genSalt(10);
        user.password = await bcrypt.hash(user.password, salt);
        try {
            const result = await (await db).request()
                .input('identification', user.identification)
                .input('password', user.password)
                .input('name', user.name)
                .input('lastname', user.lastname)
                .input('gender_id', user.gender_id)
                .input('email', user.email)
                .input('birthdate', user.birthdate)
                .input('country_code', user.country_code)
                .input('phone', user.phone)
                .input('occupation_id', user.occupation_id)
                .input('postal_code', user.postal_code)
                .input('marital_status_id', user.marital_status_id)
                .input('geolocalitation', user.geolocalitation)
                .input('lat', user.lat)
                .input('lng', user.lng)
                .input('code', user.code)
                .input('verification', user.verification)
                .input('sexual_orientation_id', user.sexual_orientation_id)
                .input('educational_level_id', user.educational_level_id)
                .input('etnia_id', user.etnia_id)
                .query(`INSERT INTO users (
                identification,
                password,
                name,
                lastname,
                gender_id,
                email,
                birthdate,
                country_code,
                phone,
                occupation_id,
                postal_code,
                marital_status_id,
                geolocalitation,
                lat,
                lng,
                code,
                verification,
                sexual_orientation_id,
                educational_level_id,
                etnia_id
                ) VALUES (
                    @identification,
                    @password,
                    @name,
                    @lastname,
                    @gender_id,
                    @email,
                    @birthdate,
                    @country_code,
                    @phone,
                    @occupation_id,
                    @postal_code,
                    @marital_status_id,
                    @geolocalitation,
                    @lat,
                    @lng,
                    @code,
                    @verification,
                    @sexual_orientation_id,
                    @educational_level_id,
                    @etnia_id
                    );`);
            res.json({ response: result });

        } catch (err) {
            res.json({ response: 'Failure' });
        }
    }
    async test(req: Request, res: Response) {
        const { password } = req.body;
        const salt = await bcrypt.genSalt(10);
        const hash = await bcrypt.hash(password, salt);
        res.json({ "Response": hash });
    }
}
const authController = new AuthController();
export default authController;