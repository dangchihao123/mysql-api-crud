// import module express vào
const express = require("express");
// sử dụng phương thức route trong module trong express
const router = express.Router();
// gọi controller
const userController = require('../app/controllers/UserController');
// tạo 1 phương thức chứa các đường dẫn
let initAPIs = (app) => {
        router.get('/user', userController.list); // lấy tất cả user
        router.get('/user/:id', userController.detail); // lấy chi tiết 1 user
        router.get('/user/search/:name', userController.search); // tìm user qua trường name
        router.post('/user', userController.add); // thêm user
        router.delete('/user/:id', userController.dele); // xóa 1 user
        router.delete('/user', userController.deleall); // xóa tất cả user
        router.put('/user/:id', userController.updated); // sửa 1 user nào đó
        return app.use("/", router);
    }
    // export thương thức initAPIs
module.exports = initAPIs;