import sql from 'mssql';
import dbSettings from './dbSettings';

class Connection {
    pool!: sql.ConnectionPool;
    constructor() {
    }
    async getConnection() {
       this.pool=await sql.connect(dbSettings);
       return this.pool;
    }
}
const connection = new Connection();
export default connection;