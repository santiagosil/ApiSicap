import sql, { connect } from 'mssql';
import keys from './keys';

class Connection {
    pool!: sql.ConnectionPool;
    constructor() {
        //this.connect();
    }
    async queryTest() {
        try {
            this.pool = await sql.connect(keys);
            const result = await this.pool.request()
                .input('email', sql.VarChar, 'test')
                .query('SELECT * FROM users');
            console.log(result);
        } catch (err) {
            console.log(err);

        }


    }
    async connect() {

    }
}
const connection = new Connection();
export default connection;