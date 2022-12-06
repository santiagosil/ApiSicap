const keys={
    user:'admin',
    password:'12345',
    server: 'localhost',
    database:'sicapdb',
    options: {
        encrypt: true, // for azure
        trustServerCertificate: false // change to true for local dev / self-signed certs
      }
};
export default keys;