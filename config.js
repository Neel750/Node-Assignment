module.exports = {
    dbConnection: {
        user: "postgres",
        password: "123456",
        host: "localhost",
        database: "NodeAssignment",
        port: 5432
    },
    server: {
        PORT: 3000,
    },
    jwtConfig: {
        algorithm: "HS256",
        secretKey: "Test@12345",
    },
    imageLink: {
        link: "https://localhost:3000/Images/"
    },
    file: {
        path: "public/images/cars/"
    }
};