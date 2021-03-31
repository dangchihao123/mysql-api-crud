//  require model/user vào để lấy được dữ liệu của bảng user từ database nha
const User = require('../models/user.model');
// tạo phương thức list để hiển thị tất cản user trong bảng user nha
exports.list = function(req, res) {
        User.get_all(function(data) {
            res.send({ result: data });
        });
    }
    // tạo phương thức detail để hiển thị chi tiết 1 user trong bảng user nha
exports.detail = function(req, res) {
        User.getById(req.params.id, function(data) {
            res.send({ result: data });
        });
    }
    // tạo phương thức add để thêm 1 user trong bảng user nha
exports.add = function(req, res) {
        var data = req.body;
        User.create(data, function(data1) {
            res.send({ result: data1 });
        });
    }
    // tạo phương thức dete để xóa 1 user trong bảng user nha
exports.dele = function(req, res) {
        User.delete(req.params.id, function(data) {
            res.send({ result: data });
        });
    }
    // tạo phương thức deteall để xóa tất cả user trong bảng user nha
exports.deleall = function(req, res) {
        User.deleteAll(function(data) {
            res.json({ status: 200, message: "xóa thành công rồi" });
        });
    }
    // tạo phương thức update để sửa 1 user trong bảng user nha
exports.updated = function(req, res) {
        //let data = [req.body, req.params.id];
        let id = req.params.id;
        let data = req.body;
        User.update(id, data);
        res.send({ result: data });
    }
    // tạo phương search để tìm user qua trường name trong bảng user nha
exports.search = function(req, res) {
    let name = req.params.name;
    console.log(name);
    User.search(name, function(data) {
        res.send({ result: data });
    });
}